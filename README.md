# My Hacking Study

Created by: Gustavo Vinicius

```markdown
# Hacking Tools Commands Cheat Sheet

## Nmap

1. Scan a single target:
```sh
nmap <target_ip>
```

2. Scan a range of IP addresses:
```sh
nmap <start_ip> -<end_ip>
```

3. Scan a specific port:
```sh
nmap -p <port_number> <target_ip>
```

4. Perform an aggressive scan:
```sh
nmap -A <target_ip>
```

5. Perform a stealthy scan (SYN scan):
```sh
nmap -sS <target_ip>
```

## Metasploit

1. Start Metasploit console:
```sh
msfconsole
```

2. Search for a specific exploit:
```sh
search <exploit_name>
```

3. Use an exploit:
```sh
use <exploit_path>
```

4. Set payload:
```sh
set PAYLOAD <payload_name>
```

5. Exploit a target:
```sh
exploit
```

## Social Engineering Toolkit (SET)

1. Start SET:
```sh
setoolkit
```

2. Perform a phishing attack:
```sh
1. Social-Engineering Attacks -> 3. Spear-Phishing Attack Vectors -> 2. Website Attack Vectors -> 3. Credential Harvester Attack Method
```

3. Create a malicious website:
```sh
2. Website Attack Vectors -> 1. Java Applet Attack Method
```

4. Create a payload:
```sh
1. Social-Engineering Attacks -> 2. Payload Creation -> 2. Psexec Payload Injector
```

5. Perform a SMS spoofing attack:
```sh
4. Wireless Access Point Attack Vectors -> 5. SMS Spoofing Attack Vector
```

## BeEF (Browser Exploitation Framework)

1. Start BeEF:
```sh
beef-xss
```

2. Access BeEF web interface:
```sh
http://localhost:3000/ui/panel
```

3. Hook browsers:
```sh
use recon/domains/extensions
```

4. Perform browser exploitation:
```sh
use exploit/unix/browser/mozilla_udev_netlink
```

5. Control hooked browsers:
```sh
use exploit/multi/browser/firefox_xpi_bootstrapped_extension
```

## Bettercap

1. Start Bettercap:
```sh
bettercap
```

2. Scan for devices on the network:
```sh
net.probe on
```

3. Perform ARP spoofing:
```sh
set arp spoof.targets <target_ip>
```

4. Intercept HTTP traffic:
```sh
set http.proxy.sslstrip true
```

5. Capture credentials:
```sh
set net.sniff.output <output_file>
```

## SQLMap

1. Identify SQL injection vulnerabilities:
```sh
sqlmap -u "<target_url>"
```

2. Specify POST data for injection:
```sh
sqlmap -u "<target_url>" --data="<post_data>"
```

3. Enumerate databases:
```sh
sqlmap -u "<target_url>" --dbs
```

4. Dump data from a specific database:
```sh
sqlmap -u "<target_url>" -D <database_name> --dump
```

5. Perform full database takeover:
```sh
sqlmap -u "<target_url>" --os-shell
```

```

These commands provide a starting point for using each of the mentioned hacking tools in Parrot OS. Always ensure that you have proper authorization and use these tools responsibly and ethically.
