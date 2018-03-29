#!/bin/sh

sudo su -

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

pacman-key --init
pacman-key --populate archlinux
pacman-key --update

pacman -Syu --noconfirm

# basics
cat <<EOT >> /etc/pacman.conf 
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/\$arch
EOT

pacman -Sy yaourt  --noconfirm

alias install="yaourt --noconfirm -S"

install git ansible base-devel binutils patch make fakeroot 

# windows manager
install lightdm i3 xorg-server xorg-xinit xorg-xrdb xorg-xfd  numix-themes-darkblue 

# fonts
install ttf-fira-sans ttf-hack  

# gui programs
install terminator gvim rofi

#VirtualBox additions with X support
pacman -R virtualbox-guest-utils-nox --noconfirm
install virtualbox-guest-utils 

#IDE
install jdk9-openjdk maven intellij-idea-community-edition


install docker 
systemctl enable docker
systemctl start docker
usermod -aG docker vagrant

