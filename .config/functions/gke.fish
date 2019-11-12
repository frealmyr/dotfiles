#!/usr/bin/env fish

function gke -d "Run Google Kubernetes Engine commands"
  set cmd gke

  if not test -n $DOCKER_RAND_ID
    set -gx DOCKER_RAND_ID id(random)
  end

  docker run --name "$DOCKER_RAND_ID" --rm -ti \
    -e KUBE_EDITOR=vim \
    -v $HOME/.config/gcloud:/root/.config/gcloud \
    -v $HOME/.kube:/root/.kube \
    frealmyr/cloud-sdk-editors:latest kubectl $argv
end
