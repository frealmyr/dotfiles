#!/usr/bin/env fish

function helm -d "Run Helm commands"
  set cmd helm

  docker run --rm -ti \
    -e KUBE_EDITOR=vim \
    -v (pwd):(pwd) \
    -w (pwd) \
    -v $HOME/.config/gcloud:/root/.config/gcloud \
    -v $HOME/.kube:/root/.kube \
    frealmyr/cloud-sdk-editors:latest helm $argv
end
