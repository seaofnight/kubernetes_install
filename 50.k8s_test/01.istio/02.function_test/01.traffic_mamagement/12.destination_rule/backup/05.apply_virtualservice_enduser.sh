#!/bin/bash

kubectl apply -f ../istio/samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml

kubectl get vs -o yaml
