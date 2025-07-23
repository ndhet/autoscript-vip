clear
domen=`cat /etc/xray/domain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
clear
until [[ $Login =~ ^[a-zA-Z0-9_.-]+$ && ${CLIENT_EXISTS} == '0' ]]; do
read -p "   Username : " Login
CLIENT_EXISTS=$(grep -w $Login /etc/xray/ssh | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
echo -e "Nama Duplikat Silahkan Buat Nama Lain."
fi
done
read -p "   Password : " Pass
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "   Expired : " masaaktif
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "   Limitip : " iplim
done
if [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
fi
if [ -z ${iplim} ]; then
iplim="0"
fi
echo "${iplim}" >/etc/xray/sshx/${Login}IP
IP=$(curl -sS ifconfig.me);
if [[ -e /etc/cloudfront ]]; then
cloudfront=$(cat /etc/cloudfront)
else
cloudfront="-"
fi
sleep 1
clear
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "### $Login $expi $Pass" >> /etc/xray/ssh
cat > /home/vps/public_html/ssh-$Login.txt <<-END
_______________________________
Format SSH OVPN Account
_______________________________
Username         : $Login
Password         : $Pass
Expired          : $exp
_______________________________
Host             : $domen
ISP              : $ISP
CITY             : $CITY
Login Limit      : ${iplim} IP
Port OpenSSH     : 22
Port Dropbear    : 143, 109
Port SSH WS      : 80, 7788, 8181, 8282
Port SSH SSL WS  : 443
Port SSL/TLS     : 8443, 8880
Port OVPN WS SSL : 2086
Port OVPN SSL    : 990
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200,
BadVPN UDP       : 7100, 7300, 7300
_______________________________
Host Slowdns    : $sldomain
Port Slowdns     : 80, 443, 53
Pub Key          : $slkey
_______________________________
SSH UDP VIRAL : $domen:1-65535@$Login:$Pass
_______________________________
HTTP COSTUM : $domen:80@$Login:$Pass
_______________________________
Payload WS/WSS   :
GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]
_______________________________
OpenVPN SSL      : http://$domen:89/ssl.ovpn
OpenVPN TCP      : http://$domen:89/tcp.ovpn
OpenVPN UDP      : http://$domen:89/udp.ovpn
_______________________________
END
if [[ -e /etc/cloudfront ]]; then
TEXT="
◇━━━━━━━━━━━━━━━━━◇
SSH Premium Account
◇━━━━━━━━━━━━━━━━━◇
Username        :  <code>$Login</code>
Password        :  <code>$Pass</code>
Expired On       :  $exp
◇━━━━━━━━━━━━━━━━━◇
ISP              :  $ISP
CITY             :  $CITY
Host             :  <code>$domen</code>
Login Limit      :  ${iplim} IP
Port OpenSSH    :  22
Port Dropbear    :  109, 143
Port SSH WS     :  80, 7788, 8181, 8282
Port SSH SSL WS :  443
Port SSL/TLS     :  8443,8880
Port OVPN WS SSL :  2086
Port OVPN SSL    :  990
Port OVPN TCP    :  1194
Port OVPN UDP    :  2200
Proxy Squid        :  3128
BadVPN UDP       :  7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
SSH UDP VIRAL : <code>$domen:1-65535@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
HTTP COSTUM WS : <code>$domen:80@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
Host Slowdns    :  <code>$sldomain</code>
Port Slowdns     :  80, 443, 53
Pub Key          :  <code> $slkey</code>
◇━━━━━━━━━━━━━━━━━◇
Payload WS/WSS   :
<code>GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]</code>
◇━━━━━━━━━━━━━━━━━◇
OpenVPN SSL      :  http://$domen:89/ssl.ovpn
OpenVPN TCP      :  http://$domen:89/tcp.ovpn
OpenVPN UDP      :  http://$domen:89/udp.ovpn
◇━━━━━━━━━━━━━━━━━◇
Save Link Account: http://$domen:89/ssh-$Login.txt
◇━━━━━━━━━━━━━━━━━◇
$author
◇━━━━━━━━━━━━━━━━━◇
"
else
TEXT="
◇━━━━━━━━━━━━━━━━━◇
SSH Premium Account
◇━━━━━━━━━━━━━━━━━◇
Username        :  <code>$Login</code>
Password        :  <code>$Pass</code>
Expired On       :  $exp
◇━━━━━━━━━━━━━━━━━◇
ISP              :  $ISP
CITY             :  $CITY
Host             :  <code>$domen</code>
Login Limit      :  ${iplim} IP
Port OpenSSH    :  22
Port Dropbear    :  109, 143
Port SSH WS     :  80, 7788, 8181, 8282
Port SSH SSL WS :  443
Port SSL/TLS     :  8443,8880
Port OVPN WS SSL :  2086
Port OVPN SSL    :  990
Port OVPN TCP    :  1194
Port OVPN UDP    :  2200
Proxy Squid        :  3128
BadVPN UDP       :  7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
SSH UDP VIRAL : <code>$domen:1-65535@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
HTTP COSTUM WS : <code>$domen:80@$Login:$Pass</code>
◇━━━━━━━━━━━━━━━━━◇
Host Slowdns    :  <code>$sldomain</code>
Port Slowdns     :  80, 443, 53
Pub Key          :  <code> $slkey</code>
◇━━━━━━━━━━━━━━━━━◇
Payload WS/WSS   :
<code>GET / HTTP/1.1[crlf]Host: [host][crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: ws[crlf][crlf]</code>
◇━━━━━━━━━━━━━━━━━◇
OpenVPN SSL      :  http://$domen:89/ssl.ovpn
OpenVPN TCP      :  http://$domen:89/tcp.ovpn
OpenVPN UDP      :  http://$domen:89/udp.ovpn
◇━━━━━━━━━━━━━━━━━◇
Save Link Account: http://$domen:89/ssh-$Login.txt
◇━━━━━━━━━━━━━━━━━◇
$author
◇━━━━━━━━━━━━━━━━━◇
"
fi
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
if [ ! -e /etc/tele ]; then
echo -ne
else
echo "$TEXT" > /etc/notiftele
bash /etc/tele
fi
user2=$(echo "$Login" | cut -c 1-3)
TIME2=$(date +'%Y-%m-%d %H:%M:%S')
TEXT2="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<b>   PEMBELIAN SSH SUCCES </b>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<b>DOMAIN  :</b> <code>${domain} </code>
<b>CITY    :</b> <code>$CITY </code>
<b>DATE    :</b> <code>${TIME2} WIB </code>
<b>DETAIL  :</b> <code>Trx SSH </code>
<b>USER    :</b> <code>${user2}xxx </code>
<b>IP      :</b> <code>${iplim} IP </code>
<b>DURASI  :</b> <code>$masaaktif Hari </code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<i>Notif Pembelian Akun Ssh..</i>"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT2&parse_mode=html" $URL >/dev/null
#clear
filessh="/home/vps/public_html/ssh-$Login.txt"
[ -f "$filessh" ] && echo "true" || echo "false"
