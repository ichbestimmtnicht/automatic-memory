#!bin/bash
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean -y
#Github
sudo apt install git -y
git config --global user.email "ichbestimmtnicht@users.noreply.github.com"
git config --global user.name "ichbestimmtnicht"
#Delete Firefox
sudo apt purge firefox-esr -y
#Guake Terminal Panel
sudo apt install guake -y
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
#Dont ask for anything -q -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y -q rpi-chromium-mods
#What did i just typed?
sudo apt install python3-dev python3-pip -y
pip3 install thefuck
pip3 install thefuck --upgrade
#An other shell
sudo apt install zsh -y
#Change Defaul Shell to Zsh
sudo chsh -s /usr/bin/zsh
#ohmyzsh Commandline Tool
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#Get zsh configuration
curl -o /home/dietpi/.zshrc https://raw.githubusercontent.com/ichbestimmtnicht/automatic-memory/master/config/zsh/zshrc-desktop-gnustep.md
sudo cp /home/dietpi/.zshrc /root/.zshrc
