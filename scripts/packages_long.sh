#!/bin/sh

sudo su -

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

install ansible


#IDE
install jdk9-openjdk maven intellij-idea-community-edition

#docker
install docker 
systemctl enable docker
systemctl start docker
usermod -aG docker vagrant

