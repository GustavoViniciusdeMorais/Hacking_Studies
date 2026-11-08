### nmcli spoof
tutorial is not finished
```bash
# View connection name (NAME column)
nmcli connection show

myconname=""

# find the ethernet name
nmcli connection show $myconname
# it is 802-11-wireless

myether="802-11-wireless"

# Set MAC randomization and disable hostname sending (replace "YourConnectionName" and "eth0" as needed)
nmcli connection modify $myconname $myether.cloned-mac-address random
nmcli connection modify $myconname ipv4.dhcp-send-hostname no
nmcli connection modify $myconname ipv6.dhcp-send-hostname no

# 3. Reactivate the connection for changes to take effect
nmcli connection up $myconname
```
