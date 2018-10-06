

  export BOSH_ENVIRONMENT=10.152.0.10
  bosh alias-env gcp -e 10.152.0.10 --ca-cert <(bosh int /.creds/creds.yml --path /director_ssl/ca)
  export BOSH_CLIENT=admin
  export BOSH_CLIENT_SECRET=`bosh int /.creds/creds.yml --path /admin_password`
  bosh -e gcp env
