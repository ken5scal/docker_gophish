#!/bin/bash

set -ex &&
    sudo /opt/google-cloud-sdk/bin/gcloud docker push asia.gcr.io/${PROJECT_NAME}/${CONTAINER_NAME}
