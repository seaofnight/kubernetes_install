#!/bin/bash

#for instance in node0 ; do
for instance in k8s-master ; do
  scp ../pki/ca.pem ../pki/ca-key.pem ../pki/kubernetes-key.pem ../pki/kubernetes.pem \
    ../pki/service-account-key.pem ../pki/service-account.pem ${instance}:~/
done
