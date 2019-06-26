#!/bin/bash

# calico network
kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/calico.yaml

# kubedns 
kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/manifests/kubedns.yaml
