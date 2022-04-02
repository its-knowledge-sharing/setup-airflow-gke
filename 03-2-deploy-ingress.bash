#!/bin/bash

source .env

NS=airflow

echo "####"
echo "#### Deploying ingress to [${NS}] ####"

OUTPUT_FILE=ingress/gcp-manage-certs-1.yaml
cp ${OUTPUT_FILE} ${OUTPUT_FILE}.tmp
sed -i "s#<<DOMAIN>>#${DNS_NAME}#g" ${OUTPUT_FILE}.tmp
kubectl apply -f ${OUTPUT_FILE}.tmp -n ${NS}

OUTPUT_FILE=ingress/ing-1.yaml
cp ${OUTPUT_FILE} ${OUTPUT_FILE}.tmp
sed -i "s#<<DOMAIN>>#${DNS_NAME}#g" ${OUTPUT_FILE}.tmp
kubectl apply -f ${OUTPUT_FILE}.tmp -n ${NS}
