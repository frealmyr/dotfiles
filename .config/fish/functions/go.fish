#!/usr/bin/env fish

function go -d "Run Golang commands"
  set cmd go

  docker run --rm -ti \
    -v (pwd):(pwd) \
    -w (pwd) \
    golang:1.13 go $argv
end

