#!/bin/bash

source .env

SECRET=google-oidc
NS=airflow

cat << EOF | kubectl apply -n ${NS} -f -
apiVersion: v1
data:
  GOOGLE_OAUTH2_CLIENT_ID: $(base64 ${OIDC_CLIENT_ID})
  GOOGLE_OAUTH2_SECRET: $(base64 ${OIDC_CLIENT_SECRET})
kind: Secret
metadata:
  name: ${SECRET}
type: Opaque
EOF
