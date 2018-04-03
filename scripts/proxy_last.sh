#!/bin/sh

su vagrant <<EOF
cat <<EOT >> /home/vagrant/.ssh/config

Host github.com gitlab.com
        ProxyCommand corkscrew proxy-internet.localnet 3128 %h %p
EOT

EOF
