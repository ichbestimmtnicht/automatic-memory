#!bin/bash

#Update
#Prequisite for apt-key adv
sudo apt install dirmngr -y
#Debian Stretch Backport Keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
#Debian backports Stretch
echo 'deb http://httpredir.debian.org/debian stretch-backports main contrib non-free' | sudo tee -a /etc/apt/sources.list.d/stretch-backpor$
sudo apt update && sudo apt upgrade -y
#Autoremove
sudo apt autoremove -y && sudo apt autolean -y && sudo apt clean -y

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
#Telegram Messenger
sudo apt install telegram-desktop -y
#Dont ask for anything
sudo DEBIAN_FRONTEND=noninteractive apt install -q -y rpi-chromium-mods

#An other shell
sudo apt install zsh -y
#Change Defaul Shell to Zsh
sudo chsh -s /usr/bin/zsh
#ohmyzsh Commandline Tool
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#Get zsh configuration
curl -o /home/dietpi/.zshrc https://raw.githubusercontent.com/ichbestimmtnicht/automatic-memory/master/config/zsh/zshrc-desktop-lxde.md
sudo cp /home/dietpi/.zshrc /root/.zshrc
