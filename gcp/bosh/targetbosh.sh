

  export BOSH_ENVIRONMENT=$BOSH_IP
  bosh alias-env gcp -e $BOSH_IP --ca-cert <(bosh int /.creds/creds.yml --path /director_ssl/ca)
  export BOSH_CLIENT=admin
  export BOSH_CLIENT_SECRET=`bosh int $CREDS_PATH/creds.yml --path /admin_password`
  bosh -e gcp env
