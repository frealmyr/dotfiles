#!/bin/bash

# Get the current profile
profile=$(tuned-adm active | awk '{print $4}')

if [[ $1 = "trigger" ]]; then
  case $profile in
  'desktop') tuned-adm profile balanced && profile=$(tuned-adm active | awk '{print $4}') icon="🚒" ;;
  'balanced') tuned-adm profile powersave && profile=$(tuned-adm active | awk '{print $4}') icon="🛵" ;;
  'powersave') tuned-adm profile desktop && profile=$(tuned-adm active | awk '{print $4}') icon="🚓 " ;;
  esac
  exit 0
else
  case $profile in
  'desktop') icon="🚒 " ;;
  'balanced') icon="🚙" ;;
  'powersave') icon="🛵" ;;
  esac
fi

printf '{"text":"%s %s"}' "$icon" "$profile"
