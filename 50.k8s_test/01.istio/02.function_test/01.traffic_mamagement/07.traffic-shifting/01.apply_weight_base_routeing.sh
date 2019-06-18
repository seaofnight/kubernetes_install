#!/bin/bash

kubectl apply -f ../istio/samples/bookinfo/networking/virtual-service-all-v1.yaml

kubectl apply -f ../istio/samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml

kubectl get virtualservice reviews -o yaml
