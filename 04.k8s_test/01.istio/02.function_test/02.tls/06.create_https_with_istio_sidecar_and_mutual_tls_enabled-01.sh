#!/bin/bash 

kubectl delete -f ./istio/install/kubernetes/istio-demo.yaml

kubectl get po -n istio-system

kubectl apply -f ./istio/install/kubernetes/istio-demo-auth.yaml


