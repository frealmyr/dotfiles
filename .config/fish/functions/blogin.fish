#!/usr/bin/fish

function blogin -d "GCP login bulder-edition"
  set -gx PROJECT $argv[1]
  set -gx BW_CHECK (bw login --check)

  echo "Checking if you are logged in..."
  while string match -q '*is locked*' -- ( bw login --check );
    bw login
  end

  printf '\e[1;32m%-6s\e[m' "You are logged in."
  echo ""

  # Loop if variable is not set or if it contains a string value with space.
  while test -z "$BW_SESSION"; or string match -q '* *' -- "$BW_SESSION";
    printf "%b" "Enter master password to unlock: \e[1;33m[input is hidden]\e[0m\n"
    set -gx BW_SESSION (bw unlock --raw | sed -n '1!p')
  end

  printf '\e[1;32m%-6s\e[m' "Bitwarden session initiated!"
  echo ""

  echo "Syncing bitwarden vault..."
  echo (bw sync --session $BW_SESSION) > /dev/null 2>&1

  echo "Fetching credentials..."
  set -gx ITEM_ID (bw list items --search $PROJECT --session $BW_SESSION --pretty | grep "id" | sed -n '1p' | awk -F'"' '{ print $4 }')
  echo (bw get attachment $PROJECT.json --output /tmp/$PROJECT.json --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
  set -gx GOOGLE_APPLICATION_CREDENTIALS /tmp/$PROJECT.json

  # Similar environment variables between projects
  echo "Exporting shared environment variables..."
  gcloud config set project $PROJECT
  set -gx GOOGLE_PROJECT $PROJECT
  set -gx TERRAFORM_PROJECT $PROJECT
  set -gx TERRAFORM_STATE_GCP_BUCKET $PROJECT-tf-state
  
  if test $PROJECT = "bulder-prod"

    set -gx ENVIRONMENT "prod"
    gcloud beta container clusters get-credentials apps --region europe-north1 --project $PROJECT

    echo "Populating TF_VARS from vault..."
    echo (bw get attachment slack_api_key --output /tmp/slack_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    echo (bw get attachment opsgenie_api_key --output /tmp/opsgenie_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    set -gx TF_VAR_app_alertmanager_slack_url (cat /tmp/slack_api_key)
    set -gx TF_VAR_app_alertmanager_opsgenie_api_key (cat /tmp/opsgenie_api_key)
    rm /tmp/slack_api_key /tmp/opsgenie_api_key
    
    echo "Fetching google encryption key from vault..."
    set -gx GOOGLE_ENCRYPTION_KEY (bw get password $PROJECT --session $BW_SESSION)

  else if test $PROJECT = "bulder-test"

    set -gx ENVIRONMENT "test"
    gcloud beta container clusters get-credentials apps --region europe-north1 --project $PROJECT

    echo "Populating TF_VARS from vault..."
    echo (bw get attachment slack_api_key --output /tmp/slack_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    echo (bw get attachment opsgenie_api_key --output /tmp/opsgenie_api_key --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
    set -gx TF_VAR_app_alertmanager_slack_url (cat /tmp/slack_api_key)
    set -gx TF_VAR_app_alertmanager_opsgenie_api_key (cat /tmp/opsgenie_api_key)
    rm /tmp/slack_api_key /tmp/opsgenie_api_key

    # Remove encryption key if it is set by another project
    set -ge GOOGLE_ENCRYPTION_KEY

  else if test $PROJECT = "bulder-shared"

    set -gx ENVIRONMENT "shared"
    gcloud beta container clusters get-credentials vault --region europe-north1 --project $PROJECT
    
    echo "Fetching hashicorp outputs for this project..."
    terraform init -reconfigure -upgrade -backend-config="bucket=$TERRAFORM_STATE_GCP_BUCKET"
    set -gx VAULT_ADDR (printf "https://"(terraform output address | tr -d '\r\n' ))
    set -gx VAULT_TOKEN (terraform output root_token_decrypt_command | fish)
    terraform output vault-cert-self-signed-pem > /tmp/ca.cert &&set -gx VAULT_CAPATH /tmp/ca.cert
    terraform refresh -var-file=env/$ENVIRONMENT/(/bin/ls env/$ENVIRONMENT)
    
    # Remove encryption key if it is set by another project
    set -ge GOOGLE_ENCRYPTION_KEY

  else if test $PROJECT = "bulder-prod-data"
    set -gx ENVIRONMENT "prod"

  else if test $PROJECT = "bulder-test-data"
    set -gx ENVIRONMENT "test"

  end

  echo "Closing bitwarden session..."
  set -ge BW_SESSION

  echo ""
  printf "%b" "Terraform environment is ready for: \e[1;32m$PROJECT\e[0m\n"
  echo ""

  if test $PROJECT != "bulder-shared"
    if read_confirm "Do ye wish to run init?"
      terraform workspace select $ENVIRONMENT
      echo ""
      terraform init -reconfigure -upgrade -backend-config="bucket=$TERRAFORM_STATE_GCP_BUCKET"
      echo ""
    end

    if read_confirm "Do ye wish to run refresh?"
      terraform refresh -var-file=env/$ENVIRONMENT/(/bin/ls env/$ENVIRONMENT)
      echo ""
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
