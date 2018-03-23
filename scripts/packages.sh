#!/bin/sh

sudo su -

pacman-key --init
pacman-key --populate archlinux
pacman-key --update

pacman -Syu --noconfirm

pacman -S git ansible  --noconfirm

# windows manager
pacman -S lightdm i3 xorg xorg-xinit --noconfirm

# gui programs
pacman -S terminator gvim rofi --noconfirm

#VirtualBox additions with X support
pacman -R virtualbox-guest-utils-nox --noconfirm
pacman -S virtualbox-guest-utils --noconfirm
