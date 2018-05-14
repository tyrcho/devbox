#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

install base-devel
install binutils patch make fakeroot
install git wget unzip vifm dos2unix corkscrew tk fzf 
install ack thefuck htop lftp aria2 nnn

# windows manager
install lightdm i3 xorg-server xorg-xinit xorg-xrdb xorg-xfd xorg-xprop
install lxappearance-gtk3 numlockx

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

# json in shell
install jq


