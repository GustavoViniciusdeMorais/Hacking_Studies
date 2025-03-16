#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

# -nn is for no name resolution
# -q is less verbose output
# -A is for IP address resolution
# -r is for reading from a file
if [ "$1" == "read" ]; then
    tcpdump -nn -q ip -A -r /var/log/monitoring.pcap
    exit 1
fi

port=$1

if nc -z 127.0.0.1 $port; then
    echo "Port $port is open."
    echo "Start monitoring..."
    tcpdump -i any port $port -w /var/log/monitoring.pcap
else
    echo "Port $port is closed."
    exit 1
fi
