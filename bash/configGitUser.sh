 #!/bin/bash

# Check if two parameters are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <email> <username>"
    exit 1
fi

email=$1
username=$2

# Check if parameters are not empty
if [ -z "$email" ] || [ -z "$username" ]; then
    echo "Email and username cannot be empty"
    exit 1
fi

# Set git user email and username globally
git config --global user.email "$email"
git config --global user.name "$username"

# List new configurations
echo "New git configurations:"
git config --list
