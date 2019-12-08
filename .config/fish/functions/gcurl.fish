#!/usr/bin/env fish

function gcurl -d "Run Google Cloud commands"
  set cmd gcurl

  docker run --rm -ti \
    -v (pwd):(pwd) \
    -v $HOME/.config/gcloud:/root/.config/gcloud \
    -v $HOME/.kube:/root/.kube \
    frealmyr/cloud-sdk-editors:latest gcurl $argv
end
