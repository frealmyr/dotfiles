#!/usr/bin/env fish

function gkens -d 'Define k8s namespace as: kns [namespace]'
  set cmd gkens

  docker run --rm -ti \
    -v $HOME/.config/gcloud:/root/.config/gcloud \
    -v $HOME/.kube:/root/.kube \
    frealmyr/cloud-sdk-editors:latest kubectl config set-context (kubectl config current-context) --namespace $argv[1]
end
