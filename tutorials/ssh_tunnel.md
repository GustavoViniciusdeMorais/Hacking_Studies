### SSH Tunnel
```bash
# Requirements
apt install openssh-server -y
apt install curl -y
apt install nginx -y
apt install tcpdump -y

# Start services
service nginx start
service ssh start

# Check ports
ss -ntlp | grep -E ":22|:80"

# Open tunnel, must be in foreground
# ssh -L [local port]:target_host:[remote server port] user@ssh_server
ssh -L 8080:target_host:80 user@ssh_server

# -i is interface, -A is ASC, -l is line buffered,
tcpdump -i lo -A -l 'tcp port 8080' | grep --line-buffered -E 'GET|HTTP'

# curl to see the request encrypts
curl -Ik localhost:8080

```
