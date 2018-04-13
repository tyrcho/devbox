#!/bin/sh

cat <<EOT >> /home/vagrant/.ssh/config

Host github.com gitlab.com
        ProxyCommand corkscrew \$PROXY_SERVER \$PROXY_PORT %h %p
EOT

#chrome does not understand environment variable here
echo "--proxy-pac-url=$PROXY_PAC" >> ~/.config/chrome-flags.conf
