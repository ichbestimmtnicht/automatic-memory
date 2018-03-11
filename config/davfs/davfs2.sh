#!/bin/bash
## davfs2 installation and WebDAV account configuration script for Linux
## Tested on Raspbian
## Update 0.1

## This script must be run as root
if [ ! $UID = 0 ]; then
    echo "This script needs super user privileges to run"
    echo "run it againg using sudo or login as root"
    exit 1
fi


TTY=$(tty | sed -e 's:/dev/::')

## get current user:
auser=$(w | grep $TTY | awk {'print $1'})
uhome=/home/$auser

## Remove option:
if [ "$1" = '-r' ]; then
  echo "Removing credentials.."
  echo > "$uhome/.davfs2/secrets"
  echo "Removing mount point.."
  sed -i "/$auser@box/d" /etc/fstab
  echo "Removing symlink.."
  unlink /home/$auser/Box
  echo "Done. Exiting.."
  exit 0
elif [ -z "$1" ]; then
  :
else
  echo "Usage:"
  echo "box-linux     |  Configure a Box account"
  echo "box-linux -r  |  Remove Box configuration"
  exit 1  
fi


## determine OS type and install davfs2:
os_type() {
  if [ -f /usr/bin/yum ]; then  ## RH based distros
    yum -y install fuse-davfs2 davfs2
    ## Double check if davfs2 was installed (for some RH based systems):
    if [ ! -d /etc/davfs2 ]; then
     echo "ERROR: davfs2 was not found." 
     echo "Exiting without making any changes."
     exit 1
    fi
  elif [ -f /usr/bin/dpkg ]; then  ## Debian based distros
    apt -y install davfs2
    dpkg-reconfigure davfs2
  elif [ -f /usr/bin/zypper ]; then  ## openSuse
    zypper ar -G http://download.opensuse.org/repositories/filesystems/openSUSE_Factory /openSUSE_Factory-filesystems
    zypper -n install davfs2
  fi
}

echo "==========================================================="
echo "           This script will install davfs2"
echo "           and create a local mount point  "
echo "              for your WebDAV account."
echo "    **Choose Yes if asked to allow users to mount WebDAV**   "
echo "==========================================================="
echo ""
echo -n "Proceed with the installation? [Y/n]: "
read -p "$1" STARTINSTALL

if [ ! "$STARTINSTALL" == "Y" ]; then
  echo "Installation aborted."
  exit 1
else
  :
fi

## user input:
echo "Please enter your Email address: "
read -p "$1" EMAIL
echo -n "Please enter your Box password: "
read -s PASSWORD
echo ""
echo "==========================================================="

## check if davfs2 is installed:
if [ -d /etc/davfs2 ]; then 
  :
else
  os_type
fi

## check if Box dir exists in users' Home:
if [ -d /home/$auser/Box ]; then
  echo -n "Box already exists, would you like to update your login details? [Y\n]: "
  read ANSWER
  if [ ! "$ANSWER" == "Y" ]; then
    echo  "Nothing to do. Exiting.."
    exit 1
  else
    echo  "https://dav.box.com/dav $EMAIL $PASSWORD" > $uhome/.davfs2/secrets
    echo "Done. Exiting.."
    exit 0
  fi
else 
  ## add user the davfs2 group:
  echo "Adding $auser to davfs2 group.."
  usermod -a -G davfs2 $auser
  ## create folders:
  su - $auser -c "mkdir $uhome/.davfs2"
  mkdir /media/$auser@box
  ## write conf files:
  echo "writing configuration.."
  echo "dav_group	davfs2" > /etc/davfs2/davfs2.conf
  echo "use_locks	0" >> /etc/davfs2/davfs2.conf
  if [ -f /etc/lsb-release ]; then
    if grep --quiet Ubuntu /etc/lsb-release ; then
      echo "#ignore_home	kernoops" >> /etc/davfs2/davfs2.conf
    fi
  fi
  echo  "https://dav.box.com/dav $EMAIL $PASSWORD" > $uhome/.davfs2/secrets
  chown $auser:$auser $uhome/.davfs2/secrets
  chmod 600 $uhome/.davfs2/secrets
  ## write mount point to fstab:
  if grep --quiet /media/$auser@box /etc/fstab ; then
    :
  else
    echo "## Box" >> /etc/fstab
    echo "https://dav.box.com/dav /media/$auser@box davfs _netdev,defaults,rw,users,noauto 0 0" >> /etc/fstab
  fi
fi

## create rsync script
if [ -f $uhome/.boxsync ]; then
  :
else
   echo "#!/bin/bash" > $uhome/.boxsync
   echo "if grep --quiet box /etc/mtab ; then" >> $uhome/.boxsync
   echo "  :" >> $uhome/.boxsync
   echo "else" >> $uhome/.boxsync
   echo "  mount /media/$auser@box" >> $uhome/.boxsync
   echo "fi" >> $uhome/.boxsync
   echo "rsync -au /source /media/$auser@box" >> $uhome/.boxsync
fi

chown $auser:$auser $uhome/.boxsync
chmod +x $uhome/.boxsync

## Create a symlink
ln -s /media/$auser@box $uhome/Box
chown $auser:$auser $uhome/Box

##
echo "Done."
echo "==========================================================="
echo "       Re-login to apply the changes: su - $auser          " 
echo "         Then Mount your WebDAV folder by accessing        "
echo "       /media/$auser@box from your file manager.           "
echo "       a shortcut was created at /home/$auser/Box          "
echo "==========================================================="
echo "       a pre-configured script for rsync is at             "
echo "       $uhome/.boxsync              "
echo "       edit the source/destination path to suit your needs "
echo "==========================================================="


exit 0
