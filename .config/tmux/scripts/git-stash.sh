#!/bin/sh
if [[ $(git stash list | wc -l) -gt 0 ]]; then
  echo "stashed files!"
fi
