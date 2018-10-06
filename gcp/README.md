
# Sam-Pivotal-Deployment-Guides
y Bosh, Concourse and Pivotal PAS

## Deploy Bosh

1. Reserve 2 External IP addresses.

2. Export Bosh variables
Use the export bosh file to [Export Bosh](https://github.com/sakkoub/Sam-Pivotal-Deployment-Guides/blob/master/gcp/bosh/exports.sh) to set all the required bosh create environment command variables.
#

3. Run the [deploy Bosh with Credhub](https://github.com/sakkoub/Sam-Pivotal-Deployment-Guides/blob/master/gcp/bosh/deploy-bosh-with-credhub.sh) command to create bosh environment with credhub.
#

4. Upload the required stemcell
```
bosh upload-stemcell https://bosh.io/d/stemcells/bosh-google-kvm-ubuntu-xenial-go_agent
```

5. Clone [Concourse Bosh Deployment Repo](https://github.com/concourse/concourse-bosh-deployment)
#

6. Clone [Concourse Credub Repo](https://github.com/pivotalservices/concourse-credhub) and Set the CONCOURSE_BOSH_DEPLOYMENT to the concourse bosh deployment folder in previous step.

#

7. Run [deploy-concourse](https://github.com/pivotalservices/concourse-credhub/blob/master/deploy-concourse.sh)

#

9. Export the below variables as [this](https://github.com/sakkoub/Sam-Pivotal-Deployment-Guides/blob/master/gcp/concourse/deploy-concourse-credhub/concourse-credhub/export-concourse.sh)
```
export CONCOURSE_BOSH_DEPLOYMENT=$PATH_To_CONCOURSE_BOSH_Deployment_Folder
export CREDHUB_CLIENT=director_to_credhub # this is fixed value
export BOSH_URL=$BOSH_IP

export CONCOURSE_HOST=$CONCOURSE_HOST_IP
export CONCOURSE_URL=https://$CONCOURSE_HOST_IP

export CREDHUB_SERVER="$BOSH_URL:8844"
export BOSH_PATH=$PATH_To_BOSH_BOSH
export CREDHUB_SECRET="$(bosh int $BOSH_CREDS_PATH/creds.yml --path  /uaa_clients_director_to_credhub)"
```

10. Run [target concourse credhub](https://github.com/pivotalservices/concourse-credhub/blob/master/target-concourse-credhub.sh)

11. 
