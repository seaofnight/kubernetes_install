#!/bin/bash 

for instance in node0 node1 node2; do
  scp ../config/${instance}.kubeconfig ../config/kube-proxy.kubeconfig ${instance}:~/
done
