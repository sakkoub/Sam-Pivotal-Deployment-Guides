export CONCOURSE_BOSH_DEPLOYMENT=/home/sakkoub/concourse/concourse-bosh-deployment
export CONCOURSE_HOST=35.201.24.201
export CONCOURSE_URL=https://35.201.24.201
export CREDHUB_CLIENT=director_to_credhub
export BOSH_URL=10.152.0.10
export CREDHUB_SERVER="$BOSH_URL:8844"
export BOSH_PATH=/home/sakkoub/bosh

export CREDHUB_SECRET="$(bosh int /.creds/creds.yml --path  /uaa_clients_director_to_credhub)"
