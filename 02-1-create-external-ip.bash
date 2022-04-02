#!/bin/bash

source .env

# Create IP
gcloud compute addresses create ${IP_NAME} \
--global \
--ip-version IPV4 \
--project ${PROJECT}

IP=$(gcloud compute addresses describe ${IP_NAME} --global --project=${PROJECT} | grep 'address:' | cut -d':' -f2)
