#!/bin/bash
#Update
#Prequisite for apt-key adv
sudo apt install dirmngr -y
sudo apt update && sudo apt upgrade -y
#Autoremove
sudo apt autoremove -y && sudo apt autolean -y && sudo apt clean -y
#Git
sudo apt install git -y
git config --global user.email "ichbestimmtnicht@users.noreply.github.com"
git config --global user.name "ichbestimmtnicht"
#An other shell
sudo apt install zsh -y
#Change Defaul Shell to Zsh
sudo chsh -s /usr/bin/zsh
#ohmyzsh Commandline Tool
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#Get zsh configuration
curl -o /home/dietpi/.zshrc https://raw.githubusercontent.com/ichbestimmtnicht/automatic-memory/master/config/zsh/zshrc-desktop-kodi.md
sudo cp /home/dietpi/.zshrc /root/.zshrc

