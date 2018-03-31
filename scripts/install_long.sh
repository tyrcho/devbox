#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

# ansible
install ansible

# Java IDE
install jdk9-openjdk maven ttf-liberation intellij-idea-community-edition

#browser
install google-chrome

#languages

install ruby
install python

#docker
install docker 
sudo systemctl enable docker
#sudo systemctl start docker
sudo usermod -aG docker vagrant

#TODO: Proxy configuration
#Create a Drop-in snippet with the following content:
#
#/etc/systemd/system/docker.service.d/proxy.conf
#[Service]
#Environment="HTTP_PROXY=192.168.1.1:8080"
#Environment="HTTPS_PROXY=192.168.1.1:8080"
