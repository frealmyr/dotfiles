#!/bin/zsh

CNTX={orgs}; NAME={bulderbank}; PAGE=1; ACCESS_TOKEN={github_token};
curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100&access_token=$ACCESS_TOKEN" |
  grep -e 'ssh_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone -n --depth 1
