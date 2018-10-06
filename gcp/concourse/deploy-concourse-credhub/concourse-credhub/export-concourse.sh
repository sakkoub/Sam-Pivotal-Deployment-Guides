export CONCOURSE_BOSH_DEPLOYMENT=$PATH_To_CONCOURSE_BOSH_Deployment_Folder
export CREDHUB_CLIENT=director_to_credhub
export BOSH_URL=$BOSH_IP

export CONCOURSE_HOST=$CONCOURSE_HOST_IP
export CONCOURSE_URL=https://$CONCOURSE_HOST_IP

export CREDHUB_SERVER="$BOSH_URL:8844"
export BOSH_PATH=$PATH_To_BOSH_BOSH
export CREDHUB_SECRET="$(bosh int $BOSH_CREDS_PATH/creds.yml --path  /uaa_clients_director_to_credhub)"
