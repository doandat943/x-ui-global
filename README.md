## x-ui-global

Project: Bring English to [x-ui](https://github.com/vaxilu/x-ui)
- [x] Introduction (English)
- [x] Support multi-users on the same port :tada:
- [x] Translate web interface to English

## What is x-ui

- It's xray panel with multi-protocol, multi-user support
- You can create your own "private VPN server" with this

## Features

- System status monitoring
- Support multi-user, multi-protocol, web visualization operation
- Supported protocols: vmess, vless, trojan, shadowsocks, dokodemo-door, socks, http
- Support to configure more transmission configurations
- Traffic statistics, limit traffic, limit expiration time
- Support https access panel (need domain + ssl certificate)
- Customizable xray configuration templates
- For more advanced configuration items, see the panel for details

## System Requirements

- CPU Architecture: `amd64`, `arm64`
- CentOS 7+
- Ubuntu 16+
- Debian 8+

## Install & Upgrade

### 1. Auto install & upgrade

```
bash <(curl -Ls https://raw.githubusercontent.com/doandat943/x-ui-global/main/x-ui.sh)
```
### 2. Manual install & upgrade

1. Check your cpu architecture to chose package (`x86_64 = amd64`, `aarch64 = arm64`)
```
uname -m
```
2. Get package link from: https://github.com/doandat943/x-ui-global/releases
3. Use `root` user to log in to your server

> Tips: Usually, `amd64` appears on most computers and servers, while `arm64` will appear on products like Raspberry Pi, Orange Pi, etc

```
cd /root/
rm -rf x-ui/ /usr/local/x-ui/ /usr/bin/x-ui /etc/systemd/system/x-ui.service

wget -N --no-check-certificate -O /usr/local/x-ui-linux.tar.gz [package link]

tar zxvf x-ui-linux.tar.gz
chmod +x x-ui/x-ui x-ui/bin/xray-linux-* x-ui/x-ui.sh
mv x-ui/x-ui.sh /usr/bin/x-ui
mv -f x-ui/x-ui.service /etc/systemd/system/
mv x-ui/ /usr/local/
systemctl daemon-reload
systemctl enable x-ui
systemctl restart x-ui
```
## SSL - bring HTTPS to your server - more secure

> You can using any SSL certificate content of any domain, recommended using certificate content if you don't want to apply SSL/HTTPS to your web interface, only apply to connect

#### Get new SSL certificate - file will be stored in **/root/cert** directory

```
apt-get update
apt-get install -y certbot
certbot certonly
```
## Telegram Notification Bot

> This function and tutorial are provided by [FranzKafkaYu](https://github.com/FranzKafkaYu)

Instructions:

- Telegram Bot Token
- Telegram Channel/Group ChatID
- Telegram Bot cycle runtime (crontab syntax)

Reference syntax:
```
- * * * * *     // At every minute
- */10 * * * *  // At every 10th minute.
- 30 * * * *    // At minute 30 (**recommended**)
- @hourly       // At minute 0
- @daily        // At 00:00
- @every 8h     // At minute 0 past every 8th hour
```
Notification content:
- Node traffic usage
- Panel login reminder
- Node expiration reminder
- Traffic warning reminder

Change time zone (to get correctly time in your country):
```
ln -sf /usr/share/zoneinfo/{Your time zone} /etc/localtime
```

Ex: vietnam
```
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
```
