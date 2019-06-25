#!/bin/bash

for i in istio-1.1.7/install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done

kubectl create ns istio-system

kubectl get crds | grep 'istio.io\|certmanager.k8s.io' | wc -l
