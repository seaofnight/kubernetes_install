#!/bin/bash


for instance in node1 node2 node0; do
  scp \
    ./pki/${instance}-key.pem \
    ./pki/${instance}.pem \
    ./pki/ca-key.pem \
    ./pki/ca.pem \
    ./config/kube-proxy.kubeconfig \
    ${instance}:~/
done

