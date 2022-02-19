#!/bin/bash

useradd -m $USERNAME &

echo "root:$ROOTPASSWORD"|chpasswd &
echo "$USERNAME:$USERPASSWORD"|chpasswd &

/usr/bin/crond -n
