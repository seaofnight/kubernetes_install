#!/bin/bash

for instance in node0; do
  scp ../config/admin.kubeconfig ../config/kube-controller-manager.kubeconfig ../config/kube-scheduler.kubeconfig ${instance}:~/
done
