#!/bin/bash

#echo "Install prerequisites packages.."
#sudo apt-get install -y git ansible unzip
#ansible-galaxy collection install community.general
ansible-galaxy install git+https://github.com/c0sco/ansible-modules-bitwarden

echo "Bitwarden: download bitwarden-cli.."
curl -L -o bw-linux.zip "https://vault.bitwarden.com/download/?app=cli&platform=linux" \
  && unzip bw-linux.zip \
  && rm bw-linux.zip \
  && chmod +x bw \
  && sudo mv ./bw /usr/bin/bw

echo "Bitwarden: login and unlock bitwarden-cli.."
bw login --apikey
export BW_SESSION=$(bw unlock --raw)

#ansible-pull -U https://github.com/frealmyr/dotfiles.git main.yml
