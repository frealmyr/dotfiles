#!/usr/bin/env fish

function gsutil -d "Run Google Storage commands"
  set cmd gsutil

  docker run --rm -ti \
    -v (pwd):(pwd) \
    -v $HOME/.config/gcloud:/root/.config/gcloud \
    -v $HOME/.kube:/root/.kube \
    frealmyr/cloud-sdk-editors:latest gsutil $argv
end

