#!/bin/bash

if [ "${USERNAME}" = "" ]; then
  echo "No USERNAME given. NOT creating user account. Rely on root account."
  exit
else
  echo "USERNAME variable set to: "$USERNAME". Creating user account for "$USERNAME"."
  useradd -m $USERNAME
  echo "$USERNAME:$USERPASSWORD"|chpasswd
  exit
fi &

echo "root:$ROOTPASSWORD"|chpasswd &

/usr/bin/crond -n
