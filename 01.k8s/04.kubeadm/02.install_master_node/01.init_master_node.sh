#!/bin/bash

IPADDR=10.0.3.2
TOKEN=abcdef.0123456789abcdef 
POD_CIBR=10.244.0.0/16

kubeadm init \
        --pod-network-cidr ${POD_CIBR} \
        --apiserver-advertise-address ${IPADDR} \
        --token ${TOKEN}

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config


