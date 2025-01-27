 #!/bin/bash

# Check if two parameters are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <interface> <new_nic>"
    exit 1
fi

interface=$1
new_nic=$2

# Check if parameters are not empty
if [ -z "$interface" ] || [ -z "$new_nic" ]; then
    echo "Interface and new_nic cannot be empty"
    exit 1
fi

echo "Changing $interface to $new_nic\n"

# Rename interface
ifconfig $interface down
ifconfig $interface hw ether $new_nic
ifconfig $interface up
ifconfig $interface
