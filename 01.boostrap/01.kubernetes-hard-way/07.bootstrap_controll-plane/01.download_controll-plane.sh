#!/bin/bash

CA=../.CA
CONFIG=../.KUBECONFIG

sudo mkdir -p /etc/kubernetes/config

wget  \
  "https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kube-apiserver" \
  "https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kube-controller-manager" \
  "https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kube-scheduler" \
  "https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubectl"
 
{
  chmod +x kube-apiserver kube-controller-manager kube-scheduler kubectl
  sudo mv kube-apiserver kube-controller-manager kube-scheduler kubectl /usr/local/bin/
}

{
  sudo mkdir -p /var/lib/kubernetes/

  sudo mv $CA/ca.pem $CA/ca-key.pem $CA/kubernetes-key.pem $CA/kubernetes.pem \
    $CA/service-account-key.pem $CA/service-account.pem \
    $CONFIG/encryption-config.yaml /var/lib/kubernetes/
}


