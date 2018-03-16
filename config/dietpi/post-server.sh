#!bin/bash

#Git
sudo apt install git -y
git config --global user.email "ichbestimmtnicht@users.noreply.github.com"
git config --global user.name "ichbestimmtnicht"

#Prequisite for Debian Backports apt-key adv
sudo apt install dirmngr -y
#Debian Stretch Backport Keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
#Debian backports Stretch
echo 'deb http://httpredir.debian.org/debian stretch-backports main contrib non-free' | sudo tee -a /etc/apt/sources.list.d/stretch-backports.list
sudo apt update

#Dont ask for anything
sudo DEBIAN_FRONTEND=noninteractive apt install -q -y rpi-chromium-mods
#An other shell
sudo apt install zsh -y
#ohmyzsh Commandline Tool
cd /home/dietpi/
su -l dietpi -c "wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh && sed -i.tmp 's:env zsh::g' install.sh && sed -i.tmp 's:chsh -s .*$::g' install.sh && sh install.sh"
#Get zsh configuration
sudo su -l dietpi -c "curl -o /home/dietpi/.zshrc https://raw.githubusercontent.com/ichbestimmtnicht/automatic-memory/master/config/zsh/zshrc-server.md"
cp /home/dietpi/.zshrc /root/.zshrc
#Nicotine
sudo apt install nicotine -y
#Picard Music tagger
sudo apt install picard -y
#Cleaning
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo clean -y
#sudo reboot
