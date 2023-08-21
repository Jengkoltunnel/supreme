#!/bin/bash

NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
echo -n >/tmp/other.txt
data=($(cat /etc/xray/config.json | grep '^#%' | cut -d ' ' -f 2 | sort | uniq))
echo -e " \033[31m##########\033[33m##########\033[32m##########\033[34m##########\033[35m##########\033[36m##########\e[0m"
echo -e " \033[31m╭══════════════════════════════════════════════════════════╮\e[0m"
echo -e "         ${YB}Shadowsocks 2022 User Login Account${NC}        "
echo -e " \033[33m╰══════════════════════════════════════════════════════════╯\e[0m"

for akun in "${data[@]}"; do
if [[ -z "$akun" ]]; then
akun="Tidak Ada"
fi
echo -n >/tmp/ipvmess.txt
data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
for ip in "${data2[@]}"; do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >>/tmp/ipvmess.txt
else
echo "$ip" >>/tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo >/dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $akun"
echo "$jum2"
echo -e " \033[33m╰══════════════════════════════════════════════════════════╯\e[0m"
echo -e " \033[31m##########\033[33m##########\033[32m##########\033[34m##########\033[35m##########\033[36m##########\e[0m"
fi
rm -rf /tmp/ipvmess.txt
done
rm -rf /tmp/other.txt
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
