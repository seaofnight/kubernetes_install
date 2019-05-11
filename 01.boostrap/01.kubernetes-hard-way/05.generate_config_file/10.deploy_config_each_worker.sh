#!/bin/bash

for instance in $(cat /etc/hosts | tail -n 3 | grep -v master | awk '{print $2}') ; do 
  scp ${instance}.kubeconfig kube-proxy.kubeconfig ${instance}:~/
done 
