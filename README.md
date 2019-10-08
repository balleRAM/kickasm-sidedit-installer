# kickasm-sidedit-installer

A quite straightforward Linux Bash installation script for KickAssembler v5.9 (a Commodore 64 assembler tool that runs on Java SDK), also included are nurpax's C64 SIDEdit Git repo that comes with KickAssembler .asm source code examples which are extremely easy to compile. 

If you have VICE installed as well, this makes a very nice combo in getting started with Commodore 64 assembler in Linux. 

The script might seem a bit spoon-feeding childish, but it is really intended for those who want to get a working Commodore 64 assembler on their Linux setup.

This script is aimed for Raspbian Buster users who are using Raspberry Pi 4B and that is the platform the script has been tested on. It should however work for any mainstream Linux distro users as well. The overall point in the script is to "Keep it simple, stupid."

The script itself is quite self-explanatory and step-by-step verbose. It first looks for necessary prerequisites and installs what is not found using apt-get and aptitude (aptitude will be installed if not found).

Main packages that are included installation processes:

Open Java SE13 kit via aptitude
http://theweb.dk/KickAssembler/ - KickAssembler v5.9 for Java SDK
https://github.com/nurpax/c64-sid-edit - C64 SID Edit package by nurpax (comes with assembler source code examples for the Commodore 64 that are great for any beginner who wants to learn how to code the C64 SID sound module functionality using assembly.)

The installer script will also create a ~/.bashrc alias for the user called 'kickasm', which will enable the user to call the KickAssembler via the terminal command line interface just by typing 'kickasm'.

Installation
============

## 1. Save the 'kickasminstaller.sh' file preferably into your home directory ( /home/<your username>/ )
## 2. Open up your Linux terminal
## 3. Type in the following command: ```chmod +x kickasminstaller.sh``` and press ENTER.
## 4. Type in the following command: ```./kickasminstaller.sh``` and press ENTER.
## 5. Follow the instructions on screen.
##
## Note that some of the commands that the script runs will require sudo privileges -- you will be prompted for that if needed.

Usage
=====
```kickasm mycode.asm -o myprogram.prg```

It's also possible to use the default Java command line phrase, which is not as convenient:
```java -jar KickAss.jar mycode.asm -o myprogram.prg```

That's the reason why I added the 'kickasm' alias to be added into ~/.bashrc. It also enables running KickAssembler easily from any desired directory.

All in all ... Couldn't be simpler! :-)

