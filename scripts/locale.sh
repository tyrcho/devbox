#!/bin/sh

sudo su -

loadkeys fr

echo "KEYMAP=fr" > /etc/vconsole.conf

sed -i -e 's/^#\(en_US.UTF-8\)/\1/' /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8' >> /etc/environment
echo 'LANGUAGE=en_US.UTF-8' >> /etc/environment
echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment


ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime

localectl set-x11-keymap fr

