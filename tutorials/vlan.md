# VLAN

VLAN is a way to connect hosts by virtual networks, separating by
logical ports and ip addresses.

```sh

ip link add link eth0 name eth0.10 type vlan id 10

ip addr add 10.0.0.10/24 dev eth0.10

ip l set eth0.10 up

ip link delete eth0.10

ip -d link show type vlan

```
