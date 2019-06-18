#!/bin/bash

cat << EOF > kubespray/inventory/mycluster/hosts.ini
[all]
k8s-master1 ansible_host=10.0.3.2 ip=10.0.3.2 etcd_member_name=k8s-master1
k8s-worker1 ansible_host=10.0.3.3 ip=10.0.3.3
k8s-worker2 ansible_host=10.0.3.4 ip=10.0.3.4

[kube-master]
k8s-master1 

[kube-node]
k8s-master1 
k8s-worker1
k8s-worker2

[etcd]
k8s-master1 

[k8s-cluster:children]
kube-node
kube-master

EOF

cat kubespray/inventory/mycluster/hosts.ini
