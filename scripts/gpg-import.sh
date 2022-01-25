#!/bin/bash

# Bitwarden itemid of GPG entry
ITEM_ID=04b938f4-0034-4986-bce1-ae23015bab3c

#bw login --apikey
export BW_SESSION=$(bw unlock --raw)

GPG_PASS=$(bw get password $ITEM_ID)
GPG_PRIVATE=$(bw get attachment --itemid $ITEM_ID private.pgp --raw)
GPG_PUBLIC=$(bw get attachment --itemid $ITEM_ID public.pgp --raw)
GPG_OWNERTRUST=$(bw get attachment --itemid $ITEM_ID ownertrust.txt --raw)

echo "$GPG_PRIVATE" | gpg --passphrase $GPG_PASS --pinentry-mode loopback --import -
echo "$GPG_PUBLIC" | gpg --import -
echo "$GPG_OWNERTRUST" | gpg --import-ownertrust -
