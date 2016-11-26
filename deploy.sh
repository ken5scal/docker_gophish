#!/bin/bash

set -e

cd /opt/google-cloud-sdk/bin

sudo gcloud docker push asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:latest
if [[ "$CIRCLE_TAG" =~ v[0-9]+(\.[0-9]+)* ]]; then
    docker tag asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:$CIRCLE_SHA1 asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:${CIRCLE_TAG}
    sudo gcloud docker push asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:$CIRCLE_TAG
fi
                                                              
sudo kubectl create -f gophish-deployment.yaml
sudo kubectl create -f gophish-node-service.yaml

#NodePort requires opening firewall configuration.
#gcloud compute --project "gophish-150317" firewall-rules create --network "default"
#POST https://www.googleapis.com/compute/v1/projects/gophish-150317/global/firewalls
#{
#    "kind": "compute#firewall",
#    "sourceRanges": [],
#    "sourceTags": [],
#    "targetTags": [],
#    "allowed": [],
#    "network": "projects/gophish-150317/global/networks/default"
#}
