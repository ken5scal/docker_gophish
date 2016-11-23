#!/bin/bash

set -e

sudo /opt/google-cloud-sdk/bin/gcloud docker push asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:latest
if [[ "$CIRCLE_TAG" =~ v[0-9]+(\.[0-9]+)* ]]; then
    docker tag asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:$CIRCLE_SHA1 asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:${CIRCLE_TAG}
    sudo gcloud docker push asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}:$CIRCLE_TAG
fi
