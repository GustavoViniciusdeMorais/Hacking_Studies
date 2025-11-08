# Add key
```bash
ssh-keygen -t ed25519
cat /root/.ssh/id_client.pub
rlogin -l msfadmin 10.0.0.6
echo "ssh key" >> /root/.ssh/authorized_keys
```
# Send pub key to server admin
```bash
ssh-keygen -t ed25519 -C "gustavo@email.com"
eval "$(ssh-agent -s)"
ssh-add /root/.ssh/id_hack

cat /root/.ssh/id_hack.pub

# In server
mkdir /home/gustavo/.ssh/
touch /home/gustavo/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH..." >> /home/gustavo/.ssh/authorized_keys
service ssh restart

# At client
ssh gustavo@[ip] -p [port]
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
# send key, use the previous created user of name gustavo
ssh-copy-id -i /root/.ssh/id_ed25519.pub -p 2222 user@[hostname or ip]
# runs command in remote
ssh -p 2222 gustavo@10.0.0.3 'netstat -ntlp'
```
