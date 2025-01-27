# Change Nic

### New version
```sh
NIC="eth0"
ip link show $NIC
ip link set dev $NIC down
ip link set dev $NIC address 00:11:22:33:44:55
ip link set dev $NIC up
```

### Change IP
```sh
NIC="eth0"
ip -c link $NIC
ip a add {ip_addres/mask} dev $NIC
```

### Old version
```sh
interface="eth0"
new_nic="00:11:22:33:44:55"
ifconfig $interface down
ifconfig $interface hw ether $new_nic
ifconfig $interface up
ifconfig $interface
```

- [Script example](../bash/changeNic.sh)
