#!/bin/bash 

KUBERNETES_PUBLIC_ADDRESS=10.0.3.2

for instance in node0 node1 node2; do
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../pki/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-credentials system:node:${instance} \
    --client-certificate=../pki/${instance}.pem \
    --client-key=../pki/${instance}-key.pem \
    --embed-certs=true \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:node:${instance} \
    --kubeconfig=${instance}.kubeconfig

  kubectl config use-context default --kubeconfig=${instance}.kubeconfig
done

mkdir ../config 

mv *.kubeconfig ../config 

ls -al ../config/*.kubeconfig
