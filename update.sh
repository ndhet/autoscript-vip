#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading File"
wget -q -O /usr/bin/add-ip-bot "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/add-ip-bot.sh" && chmod +x /usr/bin/add-ip-bot
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/m-trgo "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-trgo.sh" && chmod +x /usr/bin/m-trgo
wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/restore.sh" && chmod +x /usr/bin/restore
wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/addnoobz "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/bot/addnoobz.sh" && chmod +x /usr/bin/addnoobz
wget -q -O /usr/bin/cek-noobz "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/bot/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz
wget -q -O /usr/bin/m-noobz "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-noobz.sh" && chmod +x /usr/bin/m-noobz
wget -q -O /usr/bin/m-ip "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -q -O /usr/bin/m-bot "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/m-theme "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -q -O /usr/bin/m-vmess "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/m-vless "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/m-trojan "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/m-system "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -q -O /usr/bin/m-sshovpn "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/m-backup "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/m-backup.sh" && chmod +x /usr/bin/m-backup
wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/install/speedtest_cli.py" && chmod +x /usr/bin/speedtest
wget -q -O /usr/bin/bckpbot "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/bckpbot.sh" && chmod +x /usr/bin/bckpbot
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/bottelegram "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/bottelegram.sh" && chmod +x /usr/bin/bottelegram
wget -q -O /usr/bin/xraylimit "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/xraylimit.sh" && chmod +x /usr/bin/xraylimit
wget -q -O /usr/bin/trialvmess "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/trialvmess.sh" && chmod +x /usr/bin/trialvmess
wget -q -O /usr/bin/trialvless "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/trialtrojan.sh" && chmod +x /usr/bin/trialtrojan
wget -q -O /usr/bin/trialtrojan "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/trialvless.sh" && chmod +x /usr/bin/trialvless
wget -q -O /usr/bin/trialssh "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/trialssh.sh" && chmod +x /usr/bin/trialssh
wget -q -O /usr/bin/autocpu "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/install/autocpu.sh" && chmod +x /usr/bin/autocpu
wget -q -O /usr/bin/bantwidth "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/install/bantwidth" && chmod +x /usr/bin/bantwidth
wget -q -O /usr/bin/add-ssh "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/add-ssh.sh" && chmod +x /usr/bin/add-ssh
wget -q -O /usr/bin/add-vmess "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/add-vmess.sh" && chmod +x /usr/bin/add-vmess
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/add-vless.sh" && chmod +x /usr/bin/add-vless
wget -q -O /usr/bin/add-trojan "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/add-trojan.sh" && chmod +x /usr/bin/add-trojan
#wget -q -O /usr/bin/add-ss "https://raw.githubusercontent.com/ndhet/autoscript-vip/main/menu/add-ss.sh" && chmod +x /usr/bin/add-ss
echo -e " [INFO] Download File Successfully"
exit