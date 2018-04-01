# Automatic provisioning of an ArchLinux devbox

## Use Cases

- edit perso.sh for a different dotfiles repository
- run either 
  * rebuild.bat (minimalist box)
  * rebuild-full.bat (with IntelliJ, Chrome ...) which takes longer to install

## :sparkles: Features

- detects if HTTP_PROXY is set on the host, only run proxy configuration on the guest if it is the case
- copy ssh private key from host to guest
- can install IntelliJ with your favorite plugins and configuration (from a git repository)

## Requirements

- Vagrant
- VirtualBox

## TODO

- use same proxy configuration on the guest system (at the moment you have to edit the proxy.sh file if your environment differs)
- CI to publish the box
- nice to have: change the username of the guest
