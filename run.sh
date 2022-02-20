#!/bin/bash

if [ "${USERNAME}" = "" ]; then
  echo "No USERNAME given. NOT creating user account. Rely on root account."
  exit
else
  echo "Variable is: $USERNAME. Creating user account."
  useradd -m $USERNAME
  echo "$USERNAME:$USERPASSWORD"|chpasswd
  exit
fi &

echo "root:$ROOTPASSWORD"|chpasswd &

/usr/bin/crond -n
