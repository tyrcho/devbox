#!/bin/sh

loadkeys fr

sudo su -

echo "KEYMAP=fr" > /etc/vconsole.conf

sed -i -e 's/^#\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8' >> /etc/environment
echo 'LANGUAGE=en_US.UTF-8' >> /etc/environment
echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment


ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

systemctl enable dhcpcd.service

pacman-key --init
pacman-key --populate archlinux
pacman-key --update


pacman -Syu --noconfirm
pacman -S git ansible  --noconfirm

cat <<EOT >> /etc/sudoers
Defaults env_keep += "http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY"
%wheel ALL=(ALL) NOPASSWD: ALL
EOT

ssh-keyscan gitlab.com  >> ~/.ssh/known_hosts
