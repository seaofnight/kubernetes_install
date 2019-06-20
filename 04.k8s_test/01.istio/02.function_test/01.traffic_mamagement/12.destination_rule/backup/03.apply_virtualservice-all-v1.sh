#!/bin/bash

kubectl apply -f ../istio/samples/bookinfo/networking/virtual-service-all-v1.yaml

kubectl get vs -o yaml
