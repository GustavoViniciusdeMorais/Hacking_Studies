#!/bin/bash


if [ $# -lt 1 ]; then
    echo "Usage: $0 <interface> <address> <vlan_id>"
    exit 1
fi

interface=$1
address=$2
vlan_id=$3

ip link add link $interface name $interface.$vlan_id type vlan id $vlan_id
ip addr add $address dev $interface.$vlan_id
ip link set $interface.$vlan_id up

echo "VLAN $vlan_id configured for $interface with address $address"
# ./vlan_config.sh eth0 10.0.0.10/24 10
