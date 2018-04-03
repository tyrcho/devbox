#!/bin/sh

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


mkdir /etc/systemd/system/docker.service.d/
cat <<EOT > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=proxy-internet.localnet:3128"
EOT

su vagrant <<EOF
cd 
echo ". ~/.proxy_env" >> .bashrc

mkdir ~/.m2
cat <<EOT > ~/.m2/settings.xml
<settings>
  <proxies>
   <proxy>
      <id>wl-proxy</id>
      <active>true</active>
      <protocol>http</protocol>
      <host>proxy-internet.localnet</host>
      <port>3128</port>
      <nonProxyHosts>*.priv.atos.fr</nonProxyHosts>
    </proxy>
  </proxies>
</settings>
EOT

EOF
