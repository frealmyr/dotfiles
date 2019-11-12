#!/usr/bin/fish

function blogin -d "GCP login bulder-edition"
  set -gx ENVIRONMENT $argv[1]

  # Unlock Bitwarden
  while test -z "$BW_SESSION"; or string match -q 'Invalid master password.' -- "$BW_SESSION";
    set -gx BW_SESSION (bw unlock | grep "export" | awk -F'"' '{ print $2 }')
  end

  # Fetching Cloud Credentials from bw attachment
  set -gx ITEM_ID (bw list items --search bulder-$ENVIRONMENT --session $BW_SESSION --pretty | grep "id" | sed -n '1p' | awk -F'"' '{ print $4 }')
  echo (bw get attachment cloudtoken-$ENVIRONMENT.json --output /tmp/cloudtoken-$ENVIRONMENT.json --raw  --itemid $ITEM_ID --session $BW_SESSION) > /dev/null 2>&1
  set -gx GOOGLE_CREDENTIALS (cat /tmp/cloudtoken-$ENVIRONMENT.json)
  rm /tmp/cloudtoken-$ENVIRONMENT.json

  if test $ENVIRONMENT = "prod"
    gcloud config set project bulder-$ENVIRONMENT
    set -gx GOOGLE_PROJECT bulder-$ENVIRONMENT
    set -gx TERRAFORM_ENVIRONMENT prod
    set -gx TERRAFORM_STATE_GCP_BUCKET bulder-$ENVIRONMENT-tf-state
    set -gx GOOGLE_ENCRYPTION_KEY (bw get password bulder-prod --session $BW_SESSION)
  else if test $ENVIRONMENT = "shared"
    set -gx TERRAFORM_ENVIRONMENT shared
    set -gx TF_VAR_prod_sa_fireback sa-fireback@bulder-prod-firebase.iam.gserviceaccount.com
    set -gx TF_VAR_test_sa_fireback sa-fireback@bulder-test-firebase.iam.gserviceaccount.com
    set -gx TERRAFORM_STATE_GCP_BUCKET bulder-$ENVIRONMENT-tf-state
    # Shared requires init/refresh due to required token & cert for Terraforming
    terraform init -reconfigure -backend-config="bucket=$TERRAFORM_STATE_GCP_BUCKET"
    terraform refresh -var-file=env/$ENVIRONMENT/(/bin/ls env/$ENVIRONMENT)
    set -gx VAULT_TOKEN (terraform output root_token_decrypt_command | /bin/bash)
    terraform output vault-cert-self-signed-pem > /tmp/ca.cert && set -gx VAULT_CAPATH /tmp/ca.cert
    set -ge GOOGLE_ENCRYPTION_KEY
  else if test $ENVIRONMENT = "test"
    set -gx TERRAFORM_ENVIRONMENT test
    set -gx TERRAFORM_STATE_GCP_BUCKET bulder-$ENVIRONMENT-tf-state
    set -ge GOOGLE_ENCRYPTION_KEY
  end

  # Closing Bitwarden session
  set -ge BW_SESSION

  echo ""
  echo "Terraform environment variables ready for: bulder-$ENVIRONMENT!"
  echo ""

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

echo ""
echo "  (\.   \      ,/)"
echo "   \(   |\     )/    Yer done!"
echo "   //\  | \   /\\"
echo "  (/ /\_#oo#_/\ \)   Happy Terraforming!"
echo "   \/\  ####  /\/"
echo "        `##'"
echo ""

end
