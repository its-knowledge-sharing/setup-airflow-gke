#!/bin/bash

source .env

# Create DNS managed zone
gcloud dns managed-zones create ${ZONE_NAME} --dns-name=${DNS_NAME} --project ${PROJECT}
