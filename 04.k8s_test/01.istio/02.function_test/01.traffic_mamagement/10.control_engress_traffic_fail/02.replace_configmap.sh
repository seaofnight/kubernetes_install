#!/bin/bash

kubectl get configmap istio -n istio-system -o yaml | sed 's/mode: REGISTRY_ONLY/mode: ALLOW_ANY/g' | kubectl replace -n istio-system -f -

kubectl get configmap istio -n istio-system -o yaml | grep -o "mode: ALLOW_ANY"

