#!/bin/bash

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=./pki/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=./config/kube-scheduler.kubeconfig

  kubectl config set-credentials system:kube-scheduler \
    --client-certificate=./pki/kube-scheduler.pem \
    --client-key=./pki/kube-scheduler-key.pem \
    --embed-certs=true \
    --kubeconfig=./config/kube-scheduler.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-scheduler \
    --kubeconfig=./config/kube-scheduler.kubeconfig

  kubectl config use-context default --kubeconfig=./config/kube-scheduler.kubeconfig
}
