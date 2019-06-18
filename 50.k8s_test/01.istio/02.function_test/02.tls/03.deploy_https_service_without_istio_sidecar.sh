#!/bin/bash

kubectl apply -f ./config/nginx-app.yaml

istioctl kube-inject -f sleep.yaml > ./config/sleep-istio.yaml

kubectl apply -f ./config/sleep-istio.yaml

kubectl get po
