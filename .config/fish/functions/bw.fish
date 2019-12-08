#!/usr/bin/env fish

function bw -d "Run BitWarden CLI commands"
  set cmd bw

  docker run --rm -it  \
    -v /tmp:/tmp \
    -v bitwarden:/root/.config/ \
    frealmyr/bitwarden-cli-docker:latest bw $argv
end

 # bitwarden volume contains connection information,
 # without this you would need to login everytime.
