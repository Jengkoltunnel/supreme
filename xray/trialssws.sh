#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
export CHATID="1830342336"
export KEY="6320035110:AAE6otySdlNHPhKom2PNtp8yZn8X8rZS7LE"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
# Getting
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Jengkolonline/izinn/main/ip"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/Jengkol_Online"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282372139631"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear
domain=$(cat /etc/xray/domain)
PUB=$( cat /etc/slowdns/server.pub )
NS=`cat /etc/xray/dns`
tls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
Quota=1
masaaktif=1
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
sed -i '/#ssws$/a\##@ '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\##@ '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
#buat ss WEBSOCKET
sslinkws="ss://${shadowsocks_base64e}@${domain}:443?path=/ss-ws&security=tls&encryption=none&type=ws#${user}"
nonsslinkws="ss://${shadowsocks_base64e}@${domain}:80?path=/ss-ws&security=none&encryption=none&type=ws#${user}"

#buat ss GRPC
sslinkgrpc="ss://${shadowsocks_base64e}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=ssgrpc&sni=bug.com#${user}"
nonsslinkgrpc="ss://${shadowsocks_base64e}@${domain}:80?mode=gun&security=none&encryption=none&type=grpc&serviceName=ssgrpc&sni=bug.com#${user}"
systemctl restart xray
cat > /var/www/html/sodosokws-$user.txt <<-END

# Format Shadowsocks WS

{ 
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "${sts}"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}

# Format Shadowsocks gRPC

{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "${sts}"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}

-------------------------------------------------------
              Link Akun Shadowsocks 
-------------------------------------------------------
Link TLS      : ${shadowsockslink}
-------------------------------------------------------
Link NoneTLS  : ${shadowsockslink2}
-------------------------------------------------------
Link gRPC     : ${shadowsockslink1}
-------------------------------------------------------

END

systemctl reload xray >/dev/null 2>&1
service cron restart >/dev/null 2>&1
if [ ! -e /etc/shadowsocks ]; then
  mkdir -p /etc/shadowsocks
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/shadowsocks/${user}
fi
DATADB=$(cat /etc/shadowsocks/.shadowsocks.db | grep "^##@" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/shadowsocks/.shadowsocks.db
fi
echo "##@ ${user} ${exp} ${uuid}" >>/etc/shadowsocks/.shadowsocks.db
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "\\E[0;41;36m        Shadowsocks Account      \E[0m" 
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Remarks        : ${user}" 
echo -e "Domain         : ${domain}" 
echo -e "Host XrayDNS   : ${NS}" 
echo -e "Pub Key        : ${PUB}" 
echo -e "User Quota     : ${Quota} GB" 
echo -e "Wildcard       : (bug.com).${domain}" 
echo -e "Port TLS       : 443" 
echo -e "Port none TLS  : 80" 
echo -e "Port gRPC      : 443" 
echo -e "Port none gRPC : 80" 
echo -e "Port Openclash : 443" 
echo -e "Port Openclash : 80" 
echo -e "Port CDN       : 443" 
echo -e "Port NCDN      : 80" 
echo -e "Port CDN Grpc  : 443" 
echo -e "Password       : ${uuid}" 
echo -e "Ciphers        : ${cipher}" 
echo -e "HTTPS          : 2053, 2083, 2087, 2096, 8443" 
echo -e "HTTP           : 8080, 8880, 2052, 2082, 2086, 2095" 
echo -e "Network        : ws/grpc" 
echo -e "Path           : /ss-ws" 
echo -e "ServiceName    : ss-grpc" 
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Link TLS       : ${sslinkws}" 
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Link none TLS  : ${nonsslinkws}" 
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Link gRPC      : ${sslinkgrpc}" 
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link none gRPC : ${nonsslinkgrpc}" 
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link CDN & OpenClash   : https://${domain}:81/sodosokws-$user.txt"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Link Via Qris  :https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=${shadowsockslink}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "Aktif Selama     : 60 Menit"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "" | tee -a /etc/log-create-user.log
echo "killtrial ssws ${user}" | at now +60 minutes &> /dev/null
read -n 1 -s -r -p "Press any key to back on menu"
menu
