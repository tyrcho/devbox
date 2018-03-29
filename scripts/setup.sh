#!/bin/sh

systemctl enable dhcpcd.service

cat <<EOT >> /etc/sudoers
Defaults env_keep += "http_proxy https_proxy no_proxy HTTP_PROXY HTTPS_PROXY NO_PROXY"
%wheel ALL=(ALL) NOPASSWD: ALL
EOT
