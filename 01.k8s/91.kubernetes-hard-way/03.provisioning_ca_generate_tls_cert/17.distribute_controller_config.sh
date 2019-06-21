#!/bin/bash

#for instance in node0; do
for instance in k8s-master; do
  scp ../config/admin.kubeconfig ../config/kube-controller-manager.kubeconfig ../config/kube-scheduler.kubeconfig ${instance}:~/
done
