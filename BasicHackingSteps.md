# Hacking Basic Steps

## Change MAC Address

```
ifconfig
sudo ifconfig wlp3s0 down
sudo ifconfig wlp3s0 hw ether 00:11:22:33:44:55
sudo ifconfig wlp3s0 up
```

## Get Network Access

* [**Aircrack-ng**](https://www.aircrack-ng.org/doku.php?id=cracking_wpa)

## Connect to a VPN

```
sudo openvpn connectionFile.ovpn
```

## Proxychain

```
sudo apt install proxychains4
```

Proxychains are essentially a combination of proxies that reroute a TCP connection to any server using different protocols, such as HTTP, HTTPS, SOCK4 & SOCKS5, making the connection secure and making it nearly impossible for an observer to figure out what you are looking for up online and where you are.

Configs at `etc/proxychains.conf` file

## Reconnaissance

```
sudo nmap -v -Pn [IP]
```

* `-v` is verbose
* It is going to show the ports

Then

```
sudo nmap -v -sV -p[port number] {IP}
```

Other

```
nmap -p- --min-rate 1000 -sV {IP}
```

## Choose the Exploit

For example, if the ftp 21 port is open, sometimes you can connect with the ftp client using the anonymous user name and no password. This is where one should become curious, study and seek for possibilities.
