#!/bin/sh

echo "To create a new personal token visit https://github.com/settings/tokens/new"
echo "Use a unique name for your client, and use only the 'read:packages' permission."
echo ""

read -p "Github Username: " username
stty -echo
read -p "Github Personal Token: " token
stty echo
echo ""

echo $token | docker login https://docker.pkg.github.com -u "$username" --password-stdin
