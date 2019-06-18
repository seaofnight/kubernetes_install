#!/bin/bash

# run only master node this script

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

kubectl get ds -n kube-system kube-flannel-ds-amd64

# master taint config
kubectl taint nodes --all node-role.kubernetes.io/master-
