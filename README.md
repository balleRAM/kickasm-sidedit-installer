# kickasm-SIDedit-installer

A quite straightforward and beginner-friendly Linux Bash installation script for [Kick Assembler v5.9](http://www.theweb.dk/KickAssembler/Main.html#frontpage), a cross-platform Commodore 64 assembler tool that runs on Java SDK. The installer also grabs along [nurpax's C64 SIDEdit GitHub repository](https://github.com/nurpax/c64-sid-edit) for a few fun C64 asm program code examples.

The C64 SIDedit package comes with KickAssembler-ready .asm source code examples for the Commodore 64, enabling a newcomer to get into C64 assembler and start tinkering with the C64's SID audio chip functionality in no time.

If you have the [VICE C64 emulator](http://vice-emu.sourceforge.net/) installed with its Monitor function and CPU History functionality enabled, adding this package to your toolbox creates a very nice setup to get started with Commodore 64 assembler coding and compiling in a Linux environment - even on a ARM/ARM64 based architecture such as the Raspberry Pi.

The installer script might seem a bit spoon-feeding childish for some advanced users, but it is really intended for those who want to get a working Commodore 64 assembler on their Linux setup as quickly and as painlessly as possible. The real anguish usually awaits on the other side once you get there, so let's make the first part of the journey smooth. :-D 

This installer is aimed for Raspbian Buster users who are using Raspberry Pi 4B and that is the platform the script has been tested on. It should however work within any mainstream Linux distribution as well. The overall point of this script is to "Keep it fast and simple, stupid."

The script itself is quite self-explanatory and step-by-step verbose. The user can change the installation directory during the script process. The script first initializes by looking for the necessary prerequisites and installs those not found, using apt-get and aptitude (aptitude will be installed if it's not found.)

### The script will automagically install prequisites if required, and:

- [Open Java SE JDK 13 kit](https://openjdk.java.net/projects/jdk/13/) via aptitude **(if required)**
- http://theweb.dk/KickAssembler/ - KickAssembler v5.9 for Java SDK
- https://github.com/nurpax/c64-sid-edit - C64 SID Edit by nurpax, with .asm source code examples

The installer script will also create a ~/.bashrc alias for the user called 'kickasm', which will enable the user to call the KickAssembler via the terminal command line interface just by typing 'kickasm'.

Installation
============

1. Open up your Linux terminal, ```sudo apt install git``` if you don't have git installed yet.
2. _Preferably, run the installation from your home directory. To make sure you're in there, type in ```cd```_
2. ```git clone https://github.com/balleRAM/kickassembler-SIDedit-installer```
3. After cloning, enter the git repo directory; ```cd kickassembler-SIDedit-installer/```
4. ```./kickasminstaller.sh``` and press ENTER to begin the installation.
5. Follow the instructions on screen. Missing dependencies will be downloaded as well as the program files.

Note that some of the commands that the script runs will require sudo (super user) privileges -- you will be prompted for your user password if elevated rights are needed during install.

Usage
=====

After installation, to compile your KickAsm source code, just type in terminal:

```kickasm mycode.asm -o myprogram.prg```

It's also possible to use the default Java command line phrase from the installation directory, which however is not as convenient, since the 'kickasm' alias works universally:

```java -jar KickAss.jar mycode.asm -o myprogram.prg```

Adding universal simplicity is the sole reason why I did the addition for the 'kickasm' alias to be added into ~/.bashrc. It also enables running KickAssembler easily from any desired directory from the command line.

All in all ... Couldn't be simpler! :-) Happy retro-coding!

TODO
====

- More installation choices and options for the user, error checks, installation package handling, etc, yadayada. 
- Will probably implement a grabber-installer for [Sidreloc](http://www.linusakesson.net/software/sidreloc/) as well, as it's quite essential for anybody who wants to probe into the realm of programming SID stuff for the C64.

Don't hold your breath on those, feel free to fork this one. Cheers.
