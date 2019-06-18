#!/bin/bash

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=./pki/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=./config/admin.kubeconfig

  kubectl config set-credentials admin \
    --client-certificate=./pki/admin.pem \
    --client-key=./pki/admin-key.pem \
    --embed-certs=true \
    --kubeconfig=./config/admin.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=admin \
    --kubeconfig=./config/admin.kubeconfig

  kubectl config use-context default --kubeconfig=./config/admin.kubeconfig
}

