#!/bin/bash 

#for instance in node0 node1 node2; do
for instance in k8s-master k8s-worker1 k8s-worker2; do
  scp ../config/${instance}.kubeconfig ../config/kube-proxy.kubeconfig ${instance}:~/
done
