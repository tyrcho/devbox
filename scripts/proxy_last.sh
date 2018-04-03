#!/bin/sh

cat <<EOT >> /home/vagrant/.ssh/config

Host github.com gitlab.com
        ProxyCommand corkscrew proxy-internet.localnet 3128 %h %p
EOT

echo "--proxy-pac-url=http://proxyconf.localnet/awl.pac" >> ~/.config/chrome-flags.conf
