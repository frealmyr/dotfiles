#!/usr/bin/fish

function blogin -d "GCP login bulder-edition"
  set -gx ENVIRONMENT $argv[1]

  # Unlock Bitwarden vault, retry on wrong password.
  while test -z "$BW_SESSION"; or string match -q 'Invalid master password.' -- "$BW_SESSION";
    set -gx BW_SESSION (bw unlock | grep "export" | awk -F'"' '{ print $2 }')
  end

  # Fetching Cloud Credentials from bw attachment, store cloud token to /tmp
  set -gx ITEM_ID (bw list items --search bulder-$ENVIRONMENT --session $BW_SESSION --pretty | grep "id" | sed -n '1p' | awk -F'"' '{ print $4 }')
  echo (bw get attachment cloudtoken-$ENVIRONMENT.json --output /tmp/cloudtoken-$ENVIRONMENT.json --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
  set -gx GOOGLE_APPLICATION_CREDENTIALS /tmp/cloudtoken-$ENVIRONMENT.json

  # Similar environment variables between projects
  gcloud config set project bulder-$ENVIRONMENT
  set -gx GOOGLE_PROJECT bulder-$ENVIRONMENT
  set -gx TERRAFORM_ENVIRONMENT $ENVIRONMENT
  set -gx TERRAFORM_STATE_GCP_BUCKET bulder-$ENVIRONMENT-tf-state
  terraform workspace select $ENVIRONMENT
  
  if test $ENVIRONMENT = "prod"
    
    # Set k8s kubectl
    gcloud beta container clusters get-credentials apps --region europe-north1 --project bulder-$ENVIRONMENT

    # Populate TF_VARS with values from bitwarden
    echo (bw get attachment slack_api_key --output /tmp/slack_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    echo (bw get attachment opsgenie_api_key --output /tmp/opsgenie_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    set -gx TF_VAR_app_alertmanager_slack_url (cat /tmp/slack_api_key)
    set -gx TF_VAR_app_alertmanager_opsgenie_api_key (cat /tmp/opsgenie_api_key)
    rm /tmp/slack_api_key /tmp/opsgenie_api_key
    
    # Provide encryption key for remote state file
    set -gx GOOGLE_ENCRYPTION_KEY (bw get password bulder-$ENVIRONMENT --session $BW_SESSION)

  else if test $ENVIRONMENT = "shared"
    
    # Set k8s kubectl
    gcloud beta container clusters get-credentials vault --region europe-north1 --project bulder-$ENVIRONMENT
    
    # Shared requires init/refresh due to required token & cert for Terraforming
    terraform init -reconfigure -upgrade -backend-config="bucket=$TERRAFORM_STATE_GCP_BUCKET"
    set -gx VAULT_ADDR (printf "https://"(terraform output address | tr -d '\r\n' ))
    set -gx VAULT_TOKEN (terraform output root_token_decrypt_command | fish)
    terraform output vault-cert-self-signed-pem > /tmp/ca.cert &&set -gx VAULT_CAPATH /tmp/ca.cert
    terraform refresh -var-file=env/$ENVIRONMENT/(/bin/ls env/$ENVIRONMENT)
    
    # Remove encryption key if it is set by another project
    set -ge GOOGLE_ENCRYPTION_KEY

  else if test $ENVIRONMENT = "test"
    
    # Set k8s kubectl
    gcloud beta container clusters get-credentials apps --region europe-north1 --project bulder-$ENVIRONMENT
    
    # Populate TF_VARS with values from bitwarden
    echo (bw get attachment slack_api_key --output /tmp/slack_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    echo (bw get attachment opsgenie_api_key --output /tmp/opsgenie_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    set -gx TF_VAR_app_alertmanager_slack_url (cat /tmp/slack_api_key)
    set -gx TF_VAR_app_alertmanager_opsgenie_api_key (cat /tmp/opsgenie_api_key)
    rm /tmp/slack_api_key /tmp/opsgenie_api_key
    
    # Remove encryption key if it is set by another project
    set -ge GOOGLE_ENCRYPTION_KEY
  end

  # Closing Bitwarden session
  set -ge BW_SESSION

  echo ""
  echo "Terraform environment variables ready for: bulder-$ENVIRONMENT!"
  echo ""

  if test $ENVIRONMENT != "shared"
    if read_confirm "Do ye wish to run init?"
      terraform init -reconfigure -upgrade -backend-config="bucket=$TERRAFORM_STATE_GCP_BUCKET"
      echo ""
      echo "Initialized Terraform!"
    end

    if read_confirm "Do ye wish to run refresh?"
      terraform refresh -var-file=env/$ENVIRONMENT/(/bin/ls env/$ENVIRONMENT)
      echo ""
      echo "Refreshed Terraform!"
    end
  end


echo ""
echo "  (\.   \      ,/)"
echo "   \(   |\     )/    Yer done!"
echo "   //\  | \   /\\"
echo "  (/ /\_#oo#_/\ \)   Happy Terraforming!"
echo "   \/\  ####  /\/"
echo "        `##'"
echo ""

end
