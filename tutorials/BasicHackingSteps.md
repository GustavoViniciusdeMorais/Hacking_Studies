# Hacking Basic Steps

### Change MAC Address
- [nmcli spoof](./nmcli.md)
```bash
# New version
NIC="eth0"
ip link show $NIC
ip link set dev $NIC down
ip link set dev $NIC address 00:11:22:33:44:55
ip link set dev $NIC up

ifconfig
sudo ifconfig wlp3s0 down
sudo ifconfig wlp3s0 hw ether 00:11:22:33:44:55
sudo ifconfig wlp3s0 up
```

### Get Network Access

* [**Aircrack-ng**](https://www.aircrack-ng.org/doku.php?id=cracking_wpa)

### Openvpn connect
```bash
apt install openvpn -y
nano gustavocop14dos-regular.ovpn
nano auth.txt
openvpn --config gustavocop14dos-regular.ovpn --auth-user-pass auth.txt &

nmap -v -sC -sV -T5 [ip] -p 60000-65535
```
### Update the vpn connection file
- Remove the lines and leave just auth-user-pass
- Create the auth.txt and save the two lines with the hashes
```xml
auth-user-pass
<auth-user-pass>
6a13***78d97#######
457e7########3dcefbd2########
</auth-user-pass>
```

### Proxychain
Proxychains are essentially a combination of proxies that reroute a TCP connection to any server using different protocols, such as HTTP, HTTPS, SOCK4 & SOCKS5, making the connection secure and making it nearly impossible for an observer to figure out what you are looking for up online and where you are.
- [proxychain ips](https://raw.githubusercontent.com/proxy-free/free-proxy-list/main/socks5.txt)
- [proxychain ips 2](https://www.proxynova.com/proxy-server-list/anonymous-proxies/)
```bash
apt search proxychain
# or proxychains4
apt install proxychains -y
nano /etc/proxychains.conf
# Uncomment the dynamic_chain and comment the strict_chain to use random
# Used hidemy.name website to get proxies
# Make sense only if random_chain
chain_len = 3
# add proxy here ...
socks5 49.13.22.249 10808

proxychains nmap -sV -PS [ip] # scan with proxy
proxychains firefox google.com # only opens in normal cli tab, no root

pkill -f proxychains

# should not be requesting the host directly
tcpdump -i any -n host scanme.nmap.org
```

### Reconnaissance
- [nmap](./NMAP.md)
```bash
# nmap scanme.nmap.org
# nmap -sV -p 21,22,80 -T4 scanme.nmap.org
# operating system and default scripts -O -sC
# nmap -Pn -sV -p 80,22 -T4 --script=http-waf-detect scanme.nmap.org
nmap -v -Pn [IP]

nmap -v -sV -p [port number] {IP}

nmap -p- --min-rate 1000 -sV {IP}
```

### Choose the Exploit
- [msfconsole](./pentest/msfconsole_metasploitable2.md)
For example, if the ftp 21 port is open, sometimes you can connect with the ftp client using the anonymous user name and no password. This is where one should become curious, study and seek for possibilities.
