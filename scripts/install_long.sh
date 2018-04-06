#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

#browser
install google-chrome

#languages

install ruby
gem install rdoc rspec bundler

install python
install python-pip

install scala sbt

# ansible
install ansible

#docker
install docker 
sudo systemctl enable docker
#sudo systemctl start docker
sudo usermod -aG docker vagrant
