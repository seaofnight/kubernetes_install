#!/bin/bash

sudo mkdir -p /etc/kubernetes/config

wget -q \
  "https://storage.googleapis.com/kubernetes-release/release/v1.11.4/bin/linux/amd64/kube-apiserver" \
  "https://storage.googleapis.com/kubernetes-release/release/v1.11.4/bin/linux/amd64/kube-controller-manager" \
  "https://storage.googleapis.com/kubernetes-release/release/v1.11.4/bin/linux/amd64/kube-scheduler" \
  "https://storage.googleapis.com/kubernetes-release/release/v1.11.4/bin/linux/amd64/kubectl"
