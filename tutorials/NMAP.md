# NMAP

Network foundations:
- [tcp ip protocol](../TCP_IP_Study/TCP_IP.md)

```bash
# -sn: Ping Scan - disable port scan
# -n: Never do DNS resolution
nmap -v -sn -n 192.168.0.31-40

# -v verbose
# -sV port service version info
# -p ports
nmap -v -sV -p 80,21,22 192.168.0.40

# check if ports are opened
nmap -sS -O -p80,8080 10.0.0.3

# without ports
nmap -sn 10.0.0.0/16 

# with ports
nmap 10.0.0.0/16 

# discover ports
nmap -sS 10.0.0.0/16 

# lives a trace in the other machine
nmap -sT 10.0.0.0/16

# send the package without any assurence
nmap -sU 10.0.0.0/16

# check if port is opened
nmap -sA 10.0.0.0/16

# atack using a zombi host
nmap -pn -sI 10.0.0.1:455 10.0.0.3

# show host OS
nmap -O 10.0.0.3

# creates the export file with the command result
nmap -A 10.0.0.3 -oN export

cd /usr/share/nmap/scripts

nmap --script-help [script_name]

#  nmap --script port-states 10.0.0.3
nmap --script [script_name] [host ip]

docker run -d -p 21:21 alpine

```