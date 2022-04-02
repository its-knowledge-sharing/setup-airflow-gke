#!/bin/bash

source .env

NS=airflow
kubectl create ns ${NS}


helm repo add airflow https://airflow-helm.github.io/charts

helm template airflow airflow/airflow \
    -f airflows/airflow-1-basic.yaml \
    --version 8.5.3 \
    --namespace ${NS} > tmp-airflow.yaml

kubectl apply -n ${NS} -f tmp-airflow.yaml
