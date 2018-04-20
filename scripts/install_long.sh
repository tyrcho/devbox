#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

#browser
install google-chrome

#languages

install ruby
gem install rdoc rspec bundler

#python 2 & 3 with pip
install python
install python2
install python-pip
install python2-pip

install scala sbt

#haskell
install ncurses5-compat-libs
install ghc
install ghc-static
install cabal-install
ln -s /usr/lib/libtinfo.so.5 /usr/lib/libtinfo.so.6
cabal update

# ansible
install ansible

#docker
install docker
sudo systemctl enable docker
#sudo systemctl start docker
sudo usermod -aG docker vagrant
