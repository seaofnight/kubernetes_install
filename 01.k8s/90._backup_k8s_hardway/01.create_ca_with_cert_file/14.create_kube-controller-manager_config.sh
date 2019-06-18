#!/bin/bash

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=./pki/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=./config/kube-controller-manager.kubeconfig

  kubectl config set-credentials system:kube-controller-manager \
    --client-certificate=./pki/kube-controller-manager.pem \
    --client-key=./pki/kube-controller-manager-key.pem \
    --embed-certs=true \
    --kubeconfig=/config/kube-controller-manager.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-controller-manager \
    --kubeconfig=./config/kube-controller-manager.kubeconfig

  kubectl config use-context default --kubeconfig=./config/kube-controller-manager.kubeconfig
}
