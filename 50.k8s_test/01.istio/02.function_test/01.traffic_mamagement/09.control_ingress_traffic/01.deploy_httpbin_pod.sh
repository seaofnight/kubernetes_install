#!/bin/bash

istioctl kube-inject -f ../istio/samples/httpbin/httpbin.yaml > httpbin-istio.yaml

kubectl apply -f httpbin-istio.yaml

kubectl get svc istio-ingressgateway -n istio-system

kubectl -n default get deploy httpbin -w
