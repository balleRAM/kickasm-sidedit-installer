#!/bin/bash

## kickassembler-c64-devkit-installer
##
## To run:
## 1. Save this file preferably into your home directory ( /home/<username>/)
## 2. Open up your terminal
## 3. Type in:    chmod +x kickasminstaller.sh
## 4. Type in: ./kickasminstaller.sh
## 5. Follow the instructions on screen.

### xterm -e 'bash -c "
cd
echo &&
echo &&
echo -e "\e[1m::: Welcome to KickAssembler + Nurpasoft's c64 SID edit assisted installation! (ThanatOS)\e[0m"&&
echo -e "::: [Script date Oct.08 2019 / Version: 3.0]\e[0m"&& 
echo &&
echo -e "\e[1mKeep in mind that this script is intended to be run in Raspbian Buster and is meant primarily for those who are mostly illiterate with base-level Linux functionality. Whoever wishes any more complications to this script can probe freely into the script code and do any necessary changes themselves.\e[0m"
echo &&
echo -e "\e[1mThis script will install KickAssembler along with its prerequisites if required (such as wget, unzip and OpenJava Developer Kit) in a directory named 'kickassembler' under the home directory of the current user, as well as a 'kickasm' alias to make KickAssembler easily available from any directory inside the Linux terminal.\e[0m"
echo &&
echo -e "\e[1mNote: You can also press CTRL-C to cancel and quit at any point (not recommended during installation.)\e[0m" &&
echo &&
echo -e "Press any keyboard key to continue with the setup process."
read -r -s -n1
echo &&
echo -e "\e[1m::: Enter your sudo password below (if asked) to continue\e[0m"&&
sudo echo &&
echo &&
echo -e "\e[1mRunning apt update & upgrade to stay on track...\e[0m"&&
echo &&
sudo apt update &&
sudo apt upgrade &&
echo &&
echo -e "\e[1mChecking to see that you have essential prerequisites...\e[0m"&&
echo &&
sudo apt install wget -y&&
sudo apt install unzip -y&&
echo &&
echo -e "\e[1mChecking that aptitude is installed, install if not or if outdated...\e[0m"&&
echo &&
sudo apt install aptitude -y
echo &&
echo -e "\e[1mInstalling Java SE 13 (needed for Kick Assembler v.5.9)...\e[0m"&&
echo &&
sudo aptitude install openjdk-11-dbg openjdk-11-doc openjdk-11-jdk openjdk-11-jdk-headless openjdk-11-jre openjdk-11-jre-headless -y
echo &&
echo -e "\e[1mInstallation path for the packages?\e[0m"
read -p "[Press ENTER for recommended default: /home/$USER/kickasm ]" QUERYKICKASMPATH
if [ ${#KICKASMPATH} -eq 0 ]; then
  echo &&
  echo -e "Using default install location. [ /home/$USER/kickasm ]"
  KICKASMPATH="/home/$USER/kickasm"
  KICKAPATH="default"
	else
  echo &&
  echo -e "Using user selected location: $QUERYKICKASMPATH"
  KICKASMPATH="$QUERYKICKASMPATH"
fi
echo &&
echo -e "\e[1mInstalling Kick Assembler v.5.9...\e[0m"
echo -e "\e[1mIt will be located in $KICKASMPATH .\e[0m"&&
echo &&
mkdir $KICKASMPATH
cd $KICKASMPATH
wget http://theweb.dk/KickAssembler/KickAssembler.zip
unzip KickAssembler.zip  

echo &&
echo -e "\e[1mGitting C64 SID Edit package by nurpax...\e[0m"
echo &&
git clone https://github.com/nurpax/c64-sid-edit
echo &&
sudo echo &&
echo -e "\e[1mCreating an alias for Kick Assembler\e[0m"&&
echo -e "\e[1mYou can then use 'kickasm' command to call out the Kick Assembler.\e[0m"&&
echo &&
echo -e "\e[1mExample:\e[0m"&&
echo -e "\e[1mkickasm <inputfile.asm> -o <outputfile.prg>\e[0m"&&
echo &&

if ! egrep -q "alias kickasm" ~/.bashrc; then
    echo -e "\e[1mThe 'kickasm' alias was unset in ~/.bashrc, it will be added there now.\e[0m"	
    echo "alias kickasm='java -jar $KICKASMPATH/KickAss.jar'" >> ~/.bashrc
    echo
    echo -e "\e[1mAlias added, now reloading config.\e[0m"
    sudo ldconfig
else
    echo -e "\e[5m\e[1m\e[91m'kickasm' alias already in ~/.bashrc !\e[0m"
    echo -e "\e[1m\e[91mThe string will not be added as it's already in ~/.bashrc.\e[0m"
fi

echo &&
echo -e "\e[1mWhen everything is ready with the install, you can type in 'kickasm' to see if the kickasm alias works OK.\e[0m"&&
echo &&
echo -e "\e[1mPress any keyboard key to continue with a quick test compile.\e[0m" &&
read -r -s -n1
echo &&
echo -e "\e[1mNow test-compiling the included Assembler intro program by nurpax (from: startup.asm => to: sidedit.prg)...\e[0m" &&
echo -e "The command for this is: java -jar KickAss.jar c64-sid-edit/startup.asm -o sidedit.prg" &&
echo -e "Or, even simpler using the added 'kickasm' alias:" &&
echo -e "kickasm c64-sid-edit/startup.asm -o sidedit.prg" &&
echo &&
java -jar KickAss.jar c64-sid-edit/startup.asm -o sidedit.prg
echo &&
echo -e "\e[1mTo launch the just-now-compiled SIDedit by nurpax in VICE, type:\e[0m"&&
echo &&
echo -e "\e[1mx64 sidedit.prg\e[0m"&&
echo &&
echo -e "\e[1mThat wasn't too hard, was it?\e[0m"&&
echo -e "For starters, take a peek into the 'c64-sid-edit' subdirectory under your main installation directory ( $KICKASMPATH )."
## x64 sidedit.prg -silent
echo &&
echo -e "PDF manual for KickAssembler is located at \e[1m$KICKASMPATH/KickAssembler.pdf \e[0m."
echo -e "Please take your time to read it through." &&
echo &&
echo -e "\e[1mThe syntax for KickAssembler compiling (write it down):\e[0m"&&
echo -e "Inside $KICKASMPATH directory, type: java -jar <input>.asm -o <output>.prg\e[0m"&&
echo &&
echo -e "\e[1mOr, if the .bashrc alias was successfully installed, simply type:\e[0m"&&
echo -e "\e[1mkickasm <input>.asm -o <output>.prg\e[0m"&&
echo -e "The 'kickasm' alias should work regardless of your current directory location, but you may have to close and reopen this terminal before it is usable."&&
echo &&
echo -e "\e[1mAll is done. Farewell.\e[0m"&&
echo &&
echo -e "\e[1mPress any keyboard key to quit.\e[0m" &&
read -r -s -n1
