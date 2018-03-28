#!/bin/sh

sudo su -

cat <<EOT > ~/.proxy_env
#!/bin/sh

export PROXY_SERVER="proxy-internet.localnet"
export PROXY_PORT="3128"

export http_proxy="\${PROXY_SERVER}:\${PROXY_PORT}"
export HTTP_PROXY="\${http_proxy}"
export https_proxy="\${http_proxy}"
export HTTPS_PROXY="\${http_proxy}"
export ftp_proxy="\${http_proxy}"
export FTP_PROXY="\${http_proxy}"
export rsync_proxy="\${http_proxy}"
export RSYNC_PROXY="\${http_proxy}"
export no_proxy="localhost,127.0.0.1,priv.atos.fr"
export NO_PROXY="\${no_proxy}"
EOT

cp ~/.proxy_env ~vagrant/.proxy_env
chown vagrant:vagrant ~vagrant/.proxy_env

su vagrant <<EOF
cd 
echo ". ~/.proxy_env" >> .bashrc
EOF
