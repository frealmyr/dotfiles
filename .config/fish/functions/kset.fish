#!/usr/bin/env fish

function kpull -d 'Change GKE cluster to run commands in'
  set cmd kpull

  docker run --rm -ti \
    -v $HOME/.config/gcloud:/root/.config/gcloud \
    -v $HOME/.kube:/root/.kube \
    frealmyr/cloud-sdk-editors:latest gcloud beta container clusters get-credentials $argv[1] --region europe-north1 --project $argv[2]
end
