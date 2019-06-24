#!/bin/bash

# generate kubelet context config

KUBERNETES_PUBLIC_ADDRESS=10.0.3.2

cd ../81.tmp_pki_files

#for instance in node0 node1 node2; do
for i in $(cat ../01.create_inventory/data.conf | tail -n 3 | grep k8s | awk '{print $2}') ; do

OUTPUT=../82.tmp_config_files/${i}.kubeconfig

  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=$OUTPUT

  kubectl config set-credentials system:node:${instance} \
    --client-certificate=${i}.pem \
    --client-key=${i}-key.pem \
    --embed-certs=true \
    --kubeconfig=$OUTPUT

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:node:${i} \
    --kubeconfig=$OUTPUT

  kubectl config use-context default --kubeconfig=$OUTPUT

done



# generate kube-proxy context config 

OUTPUT=../82.tmp_config_files/kube-proxy.kubeconfig

  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=$OUTPUT

  kubectl config set-credentials system:kube-proxy \
    --client-certificate=kube-proxy.pem \
    --client-key=kube-proxy-key.pem \
    --embed-certs=true \
    --kubeconfig=$OUTPUT

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-proxy \
    --kubeconfig=$OUTPUT

  kubectl config use-context default --kubeconfig=$OUTPUT

ls -al ../82.tmp_config_files/k8s*.kubeconfig
