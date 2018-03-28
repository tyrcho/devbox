#!/bin/sh

su vagrant <<EOF
cd 

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

git clone https://github.com/tyrcho/dotfiles.git
cp -r dotfiles/. .

git config --global user.email "michel@daviot.info"
git config --global user.name "Michel Daviot"

EOF
