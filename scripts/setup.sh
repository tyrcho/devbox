#!/bin/sh

systemctl enable dhcpcd.service

cat <<EOT >> /etc/sudoers
Defaults env_keep += "http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY"
%wheel ALL=(ALL) NOPASSWD: ALL
EOT

#autologin

mkdir -p /etc/systemd/system/getty@tty1.service.d

cat <<EOT > /etc/systemd/system/getty@tty1.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin vagrant --noclear %I $TERM
EOT

pacman-key --init
pacman-key --populate archlinux
pacman-key --update

pacman -Syu --noconfirm

pacman -Sy git --noconfirm
pacman -S --noconfirm binutils patch make fakeroot

