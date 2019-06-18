#!/bin/bash

kubectl apply -f ../istio/samples/bookinfo/networking/virtual-service-ratings-test-delay.yaml

kubectl get vs ratings -o yaml
