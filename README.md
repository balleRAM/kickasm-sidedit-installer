# kickasm-SIDedit-installer

A quite straightforward and beginner-friendly Linux Bash installation script for KickAssembler v5.9 (a Commodore 64 .PRG assembler tool that runs on Java SDK). The script also grabs nurpax's C64 SIDEdit GitHub repository along for code examples.

The C64 SIDedit package comes with KickAssembler-ready .asm source code examples for the Commodore 64, enabling a newcomer to get into C64 assembler and start tinkering with the C64's SID audio chip functionality in no time.

If you have the VICE C64 emulator ( http://vice-emu.sourceforge.net/ ) installed with the VICE Monitor function and CPU History functionality enabled in VICE, adding this package to your toolbox creates a very nice setup to get started with Commodore 64 assembler coding and compiling in a Linux environment. 

The script might seem a bit spoon-feeding childish for some advanced users, but it is really intended for those who want to get a working Commodore 64 assembler on their Linux setup as quickly and as painlessly as possible. The real anguish usually awaits on the other side once you get there, so let's make the first part of the journey smooth. :-D 

This script is aimed for Raspbian Buster users who are using Raspberry Pi 4B and that is the platform the script has been tested on. It should however work within any mainstream Linux distribution as well. The overall point of this script is to "Keep it fast and simple, stupid."

The script itself is quite self-explanatory and step-by-step verbose. The user can change the installation directory during the script process. The script first initializes by looking for the necessary prerequisites and installs those not found, using apt-get and aptitude (aptitude will be installed if it's not found.)

Main packages that are included in the list that script grabs from the Internet and installs:

- Open Java SE13 kit via aptitude
- http://theweb.dk/KickAssembler/ - KickAssembler v5.9 for Java SDK
- https://github.com/nurpax/c64-sid-edit - C64 SID Edit package by nurpax

The lastmentioned comes with assembler source code examples for the Commodore 64 that are great for any beginner who wants to learn how to code the C64 SID sound module functionality using C64 assembly.

The installer script will also create a ~/.bashrc alias for the user called 'kickasm', which will enable the user to call the KickAssembler via the terminal command line interface just by typing 'kickasm'.

Installation
============

1. Save the 'kickasminstaller.sh' file preferably into your home directory ( /home/your-username/ )
2. Open up your Linux terminal and make sure you're in the directory with ```kickasminstaller.sh``` file in it.
3. Type in the following command: ```chmod +x kickasminstaller.sh``` and press ENTER.
4. Type in the following command: ```./kickasminstaller.sh``` and press ENTER.
5. Follow the instructions on screen.

Note that some of the commands that the script runs will require sudo (super user) privileges -- you will be prompted for that if it's needed.

Usage
=====

In terminal after installation, to compile your KickAsm source code, just type:
```kickasm mycode.asm -o myprogram.prg```

It's also possible to use the default Java command line phrase, which is not as convenient:
```java -jar KickAss.jar mycode.asm -o myprogram.prg```

That's the reason why I added the 'kickasm' alias to be added into ~/.bashrc. It also enables running KickAssembler easily from any desired directory.

All in all ... Couldn't be simpler! :-) Happy retro-coding!

