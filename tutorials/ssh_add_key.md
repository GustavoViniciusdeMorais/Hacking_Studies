# Add key
```bash
ssh-keygen -t ed25519
cat /root/.ssh/id_client.pub
rlogin -l msfadmin 10.0.0.6
echo "ssh key" >> /root/.ssh/authorized_keys
```
# With server control
The server owner has to create the user account and give it bash access.
#### At server:
```bash
useradd -g root -s /bin/bash gustavo
passwd gustavo
service ssh start
netstat -ntlp
```
#### At client:
```bash
ssh-keygen -t ed25519
# creates at the /root/.ssh/, could be every name or path
# send key
ssh-copy-id -i /root/.ssh/id_ed25519.pub -p 2222 user@[hostname or ip]
# runs command in remote
ssh -p 2222 gustavo@10.0.0.3 'netstat -ntlp'
```
