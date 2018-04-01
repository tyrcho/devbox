#!/bin/sh

[[ -f ~/.proxy_env ]] && . ~/.proxy_env

alias install="yaourt --noconfirm -S"

mkdir -p ~/Downloads
echo "TMPDIR=~/Downloads" > ~/.yaourtrc

install jdk9-openjdk maven ttf-liberation
sudo su <<EOT
echo "export JAVA_HOME=/usr/lib/jvm/java-9-openjdk" >> /etc/bash.bashrc
EOT

install intellij-idea-ultimate-edition #intellij-idea-community-edition

# .IdeaIC2018.1 for community editio
configFolder="/home/vagrant/.IntelliJIdea2018.1/config"
pluginFolder="$configFolder/plugins/"
settingsFolder="$configFolder/settingsRepository/repository"

mkdir -p $pluginFolder

download() {
    pluginId=$1
    file=$(curl -s https://plugins.jetbrains.com/plugin/updates?pluginId=$pluginId | jq -r .updates[0].file)
    url=https://plugins.jetbrains.com/files/$file
    wget -P $pluginFolder $url
}

download   631 # python
download  1293 # ruby
download  1347 # scala
download  4230 # bash
download  7138 # frame switcher
download  7253 # Pegdown doclet
download  7345 # presentation assistant
download  8182 # rust
download  9792 # Key Promoter X
download 10037 # csv
download 10315 # gitmoji

cd $pluginFolder
for f in *.zip; do unzip $f ; rm $f ; done



mkdir -p $settingsFolder
git clone https://github.com/tyrcho/idea-settings.git $settingsFolder
cd $settingsFolder
cp .gitignore .git/info/exclude
