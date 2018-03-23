#!/bin/sh

sudo su -

pacman-key --init
pacman-key --populate archlinux
pacman-key --update

pacman -Syu --noconfirm
pacman -S git ansible  --noconfirm

