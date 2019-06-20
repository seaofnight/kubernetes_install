#!/bin/bash

istioctl kube-inject -f ../istio/samples/httpbin/sample-client/fortio-deploy.yaml > fortio-deploy-istio.yaml
kubectl apply -f fortio-deploy-istio.yaml

