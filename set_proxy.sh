#!/bin/sh

# for terminal
export proxyserveraddr=123.123.123.123
export proxyserverport=8087
export HTTP_PROXY="http://$proxyserveraddr:$proxyserverport/"
export HTTPS_PROXY="https://$proxyserveraddr:$proxyserverport/"
export FTP_PROXY="ftp://$proxyserveraddr:$proxyserverport/"
export SOCKS_PROXY="socks://$proxyserveraddr:$proxyserverport/"
export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com,200.200..;11.11.0.0;"
export http_proxy="http://$proxyserveraddr:$proxyserverport/"
export https_proxy="https://$proxyserveraddr:$proxyserverport/"
export ftp_proxy="ftp://$proxyserveraddr:$proxyserverport/"
export socks_proxy="socks://$proxyserveraddr:$proxyserverport/"
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,200.200..;11.11.0.0;"

# for chrome,firefox
gsettings set org.gnome.system.proxy ignore-hosts "['localhost', '11.11.0.0/16', '200.200.0.0/16', '*.localdomain.com' ]"

# for apt-get
cat <<-EOF| sudo tee /etc/apt/apt.conf
Acquire::http::proxy "http://$proxyserveraddr:$proxyserverport/";
Acquire::https::proxy "https://$proxyserveraddr:$proxyserverport/";
Acquire::ftp::proxy "ftp://$proxyserveraddr:$proxyserverport/";
Acquire::socks::proxy "socks://$proxyserveraddr:$proxyserverport/";
EOF
