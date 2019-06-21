#!/bin/bash 

#for instance in node0 node1 node2; do
for instance in k8s-master k8s-worker1 k8s-worker2; do
  scp ../pki/ca.pem ../pki/${instance}-key.pem ../pki/${instance}.pem ${instance}:~/
done
