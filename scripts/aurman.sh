#!/bin/sh

git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si
cd ..
rm -rf aurman

