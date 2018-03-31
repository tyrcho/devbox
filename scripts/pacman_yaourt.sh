#!/bin/sh

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
