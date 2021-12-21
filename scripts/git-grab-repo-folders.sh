#!/bin/zsh

# This script will fetch all Github repositories, without downloading any files.
# You will need a Github Personal Token (PAT), set it as the ACCESS_TOKEN variable before running this script.
# There is a limit for 100 items per page in the API, if your organization have more than 100 repositories, you will need to update the PAGE variable manually and re-run script.

#ACCESS_TOKEN={github_token};
CNTX={orgs}; NAME={bulderbank}; PAGE=1;

curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100&access_token=$ACCESS_TOKEN" |
  grep -e 'ssh_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone -n --depth 1
