#!/bin/bash
# local path to https://github.com/concourse/concourse-bosh-deployment
if [ -z ${CONCOURSE_BOSH_DEPLOYMENT} ]; then
  CONCOURSE_BOSH_DEPLOYMENT=~/concourse-bosh-deployment
  echo  $CONCOURSE_BOSH_DEPLOYMENT 
fi

# export CONCOURSE_BOSH_Deployment ='/concourse/concourse-bosh-deployment'
if [ -z ${CONCOURSE_BOSH_DEPLOYMENT} ]; then
  echo 'Please set $CONCOURSE_BOSH_DEPLOYMENT to the LOCAL FOLDER-PATH /concourse/concourse-bosh-deployment.'
  exit 1
fi

# export CONCOURSE_HOST='concourse.example.com'
if [ -z ${CONCOURSE_HOST} ]; then
  echo 'Please set $CONCOURSE_HOST (dns or hostname).'
  exit 1
fi

bosh deploy -d concourse $CONCOURSE_BOSH_DEPLOYMENT/cluster/concourse.yml \
   -l $CONCOURSE_BOSH_DEPLOYMENT/versions.yml \
   -l versions.yml \
   -l secrets.yml \
   -v deployment_name=concourse \
   -v network_name=default \
   -v web_network_vm_extension=lb \
   -v web_network_name=default \
   -v external_host=${CONCOURSE_HOST} \
   -v external_url="https://${CONCOURSE_HOST}" \
   -v web_vm_type=large \
   -v db_vm_type=large \
   -v worker_vm_type=extra-large \
   -v db_persistent_disk_type=default \
   -o $CONCOURSE_BOSH_DEPLOYMENT/cluster/operations/basic-auth.yml \
   -o $CONCOURSE_BOSH_DEPLOYMENT/cluster/operations/privileged-http.yml \
   -o $CONCOURSE_BOSH_DEPLOYMENT/cluster/operations/privileged-https.yml \
   -o $CONCOURSE_BOSH_DEPLOYMENT/cluster/operations/tls.yml \
   -o $CONCOURSE_BOSH_DEPLOYMENT/cluster/operations/tls-vars.yml \
   -o $CONCOURSE_BOSH_DEPLOYMENT/cluster/operations/web-network-extension.yml \
   -o operations/add-credhub-uaa-to-web.yml \
   -o operations/enable-db-backups.yml \
   -o operations/backup-atc-db.yml \
   -o operations/backup-uaa-db.yml \
   -o operations/backup-credhub-db.yml
