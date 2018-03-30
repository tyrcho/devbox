#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

install base-devel 
install binutils patch make fakeroot
install git

# windows manager
install lightdm i3 xorg-server xorg-xinit xorg-xrdb xorg-xfd  
install lxappearance-gtk3
install numix-themes-darkblue 

#VirtualBox additions with X support
sudo pacman -R virtualbox-guest-utils-nox --noconfirm
install virtualbox-guest-utils 

# fonts
install ttf-fira-sans ttf-hack

fc-cache

# gui programs
install terminator 
install gvim 
install rofi


