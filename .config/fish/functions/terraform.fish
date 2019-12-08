#!/usr/bin/env fish

function terraform -d "Run terraform command"
  set mnt /root/terraform
  set cmd terraform

  set env_file
  if test -f .env
    set env_file "--env-file=.env"
  end

  docker run -it --rm \
    -v /tmp:/tmp \
    -v (pwd):$mnt \
    -v /Users/fredrick/.config/gcloud:/gcloud \
    -v ~/.helm:/root/.helm \
    -v ~/.kube:/root/.kube \
    -w /$mnt \
    -e TF_VAR_app_alertmanager_opsgenie_api_key \
    -e TF_VAR_app_alertmanager_slack_url \
    -e GOOGLE_APPLICATION_CREDENTIALS \
    -e VAULT_ADDR \
    -e VAULT_TOKEN \
    -e VAULT_CAPATH \
    -e GOOGLE_CREDENTIALS \
    -e GOOGLE_ENCRYPTION_KEY \
    $env_file \
    hashicorp/terraform:0.12.16 $argv
end


#(env | grep TF_ | cut -f1 -d= | sed 's/^/-e /') \
