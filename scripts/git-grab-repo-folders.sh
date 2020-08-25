#!/bin/zsh

#ACCESS_TOKEN={github_token};

CNTX={orgs}; NAME={bulderbank}; PAGE=2; 
curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100&access_token=$ACCESS_TOKEN" |
  grep -e 'ssh_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone -n --depth 1
