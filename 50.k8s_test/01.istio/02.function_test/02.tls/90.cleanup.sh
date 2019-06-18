#!/bin/bash 


kubectl delete -f samples/sleep/sleep.yaml
kubectl delete -f samples/https/nginx-app.yaml
kubectl delete configmap nginxconfigmap
kubectl delete secret nginxsecret

