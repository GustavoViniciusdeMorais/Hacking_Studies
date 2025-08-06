# Add key
```
ssh-keygen -t ed25519
cat /root/.ssh/id_client.pub
rlogin -l msfadmin 10.0.0.6
echo "ssh key" >> /root/.ssh/authorized_keys
```
