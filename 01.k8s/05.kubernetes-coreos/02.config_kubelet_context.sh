#!/bin/bash

kubectl config set-cluster vagrant-cluster --server=http://172.18.18.101:8080
kubectl config set-context vagrant-system --cluster=vagrant-cluster
kubectl config use-context vagrant-system
