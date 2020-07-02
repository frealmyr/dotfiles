#!/usr/bin/env fish

function bbc -d "Run BulderBank CLI commands"
  set cmd bbc

  docker run --rm -it  \
    -v ~/.kube:/root/.kube \
    -v ~/.config/gcloud:/root/.config/gcloud \
    -e GOOGLE_APPLICATION_CREDENTIALS=/root/.config/gcloud/application_default_credentials.json \
    bulder-cli_bulder_cli:latest ./bulder $argv
end
