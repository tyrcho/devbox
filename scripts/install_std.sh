#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

install git base-devel binutils patch make fakeroot

# windows manager
install lightdm i3 xorg-server xorg-xinit xorg-xrdb xorg-xfd  numix-themes-darkblue 

# fonts
install ttf-fira-sans ttf-hack

fc-cache

# gui programs
install terminator gvim rofi

#VirtualBox additions with X support
sudo pacman -R virtualbox-guest-utils-nox --noconfirm
install virtualbox-guest-utils 
