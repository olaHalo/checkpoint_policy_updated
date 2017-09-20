#!/bin/bash


# Collect username, ssh, & enable passwords

echo "Enter the username: "
read -e user
echo "Enter the SSH password: "
read -e password
echo "Enter the Enable password: "
read -e enable

# Must have a seperate device list
# Open device list & send the collected information to script
for device in `cat config-IP-list`; do
./script.sh $device $user $password $enable ;
done

# -r to hide input commands
