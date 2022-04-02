#!/bin/bash

source .env

SECRET=google-oidc
NS=airflow
TMP=secret.tmp

cat << EOF > ${TMP}
apiVersion: v1
data:
  GOOGLE_OAUTH2_CLIENT_ID: "$(echo -n ${OIDC_CLIENT_ID} | base64 -w0)"
  GOOGLE_OAUTH2_SECRET: "$(echo -n ${OIDC_CLIENT_SECRET} | base64 -w0)"
kind: Secret
metadata:
  name: ${SECRET}
type: Opaque
EOF
