#!/bin/bash

kubectl apply -f ../istio/samples/sleep/sleep.yaml

SOURCE_POD=$(kubectl -n default get pod -l app=sleep -o jsonpath={.items..metadata.name})

kubectl get configmap istio -n istio-system -o yaml | grep -o "mode: ALLOW_ANY"



