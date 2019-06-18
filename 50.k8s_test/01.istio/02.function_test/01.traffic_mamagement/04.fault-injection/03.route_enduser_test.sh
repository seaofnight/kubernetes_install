#!/bin/bash

INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')

#curl -v -H "end-user: jason" 192.168.11.238:80/productpage -o /dev/null
# browser check 
# jason session value to end-user header / productpage 
curl -v $INGRESS_HOST:$INGRESS_PORT/productpage  -o /dev/null
