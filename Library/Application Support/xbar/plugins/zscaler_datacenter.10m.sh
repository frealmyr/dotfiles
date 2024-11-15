#!/bin/bash
hostname=$(curl -Ls https://ip.zscaler.com/ | awk -v stamp="$(date +%Y%m%dT%H%M)" '/The Zscaler hostname for this proxy appears to be/ {FS="|" ; gsub(/<|>/, "|", $0) ; print $5}')
echo "$hostname"
