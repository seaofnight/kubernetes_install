#!/bin/bash 

kubectl delete -f ./config/sleep-istio.yaml

kubectl apply -f ./config/sleep-istio.yaml

kubectl delete -f ./config/nginx-istio.yaml

kubectl create -f ./config/nginx-istio.yaml


