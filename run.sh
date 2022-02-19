#!/bin/bash

useradd -m marc &
#
echo "root:$ROOTPASSWORD"|chpasswd &
echo "$USERNAME:$USERPASSWORD"|chpasswd &

/usr/bin/crond -n
