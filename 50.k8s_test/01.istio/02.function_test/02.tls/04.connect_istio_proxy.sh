#!/bin/bash 

#kubectl exec -it $(kubectl get pod -l app=sleep -o jsonpath={.items..metadata.name}) -c istio-proxy /bin/bash


kubectl exec -it $(kubectl get pod -l app=sleep -o jsonpath={.items..metadata.name}) -c istio-proxy -- curl https://my-nginx -k -v 

