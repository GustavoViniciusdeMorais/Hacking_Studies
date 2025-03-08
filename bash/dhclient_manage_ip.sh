#!/bin/bash
# echo $#; exit 1
if [ $# -lt 1 ]; then
    echo "Usage: $0 <interface>"
    exit 1
fi

interface=$1

ip_address=$(ip a show dev $1 | grep "inet")

if [ -z "$ip_address" ]; then
    echo "No IP address found for $interface. Requesting DHCP..."
    dhclient $interface
    ip_address=$(ip a show dev $1 | grep "inet")
    echo "New IP $ip_address"
else
    echo "IP address found for $interface: $ip_address"
fi
