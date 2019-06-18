#!/bin/bash 

for instance in node0; do
  scp \
    ./config/encryption-config.yaml \
    ./config/admin.kubeconfig \
    ./config/kube-proxy.kubeconfig \
    ./config/kube-scheduler.kubeconfig \
    ./config/kube-controller-manager.kubeconfig \
    ./pki/ca-key.pem \
    ./pki/ca.pem \
    ./pki/service-account-key.pem \
    ./pki/service-account.pem \
    ./pki/kubernetes-key.pem \
    ./pki/kubernetes.pem \
    ${instance}:~/
done

