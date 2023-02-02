# NMAP

```

nmap -sS -O -p80,8080 10.0.0.3 // check if ports are opened

nmap -sn 10.0.0.0/16 // without ports

nmap 10.0.0.0/16 // with ports

nmap -sS 10.0.0.0/16 // discover ports

nmap -sT 10.0.0.0/16 // lives a trace in the other machine

nmap -sU 10.0.0.0/16 // send the package without any assurence

nmap -sA 10.0.0.0/16 // check if port is opened

nmap -pn -sI 10.0.0.1:455 10.0.0.3 // atack using a zombi host

nmap -sV 10.0.0.3 // show services running at host

nmap -O 10.0.0.3 // show host OS

nmap -A 10.0.0.3 -oN export // creates the export file with the command result

```