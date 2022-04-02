#!/bin/bash

source .env

# Add A record to DNS
gcloud dns record-sets transaction start --zone=${ZONE_NAME} --project ${PROJECT}

gcloud dns record-sets transaction add ${IP} \
   --name=${DNS_NAME} \
   --ttl=300 \
   --type=A \
   --zone=${ZONE_NAME} \
   --project ${PROJECT}

gcloud dns record-sets transaction execute --zone=${ZONE_NAME} --project ${PROJECT}
