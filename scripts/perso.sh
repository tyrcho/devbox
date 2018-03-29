#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

git init
git remote add origin  https://github.com/tyrcho/dotfiles.git
git fetch
git branch --set-upstream-to=origin/master
git reset --hard origin/master
echo * > .git/info/exclude

git config --global user.email "michel@daviot.info"
git config --global user.name "Michel Daviot"
