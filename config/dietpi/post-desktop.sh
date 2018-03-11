#!bin/bash
#Git
sudo apt install git -y
git config --global user.email "ichbestimmtnicht@users.noreply.github.com"
git config --global user.name "ichbestimmtnicht"
#gvfs-backends
sudo apt install gvfs-backends -y
#Delete Firefox
sudo apt purge firefox-esr -y
#Alacarte .Dekstop Editor
sudo apt install alacarte -y
#Guake Terminal Panel
sudo apt install guake -y
sudo apt install guake-indicator -y
#An other shell
sudo apt install zsh -y
#Change Defaul Shell to Zsh
sudo chsh -s /usr/bin/zsh
#ohmyzsh Commandline Tool
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#Prequisite for apt-key adv
sudo apt install dirmngr -y
#Debian Stretch Backport Keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
#Debian backports Stretch
echo 'deb http://httpredir.debian.org/debian stretch-backports main contrib non-free' | sudo tee -a /etc/apt/sources.list.d/stretch-backports.list
sudo apt update
#Telegram Messenger
sudo apt install telegram-desktop -y
#Dont ask for anythin
export DEBIAN_FRONTEND=noninteractive
#Better Youtube
sudo apt install -q -y rpi-chromium-mods
#Autoremove
sudo apt autoremove -y && sudo apt autolean -y
