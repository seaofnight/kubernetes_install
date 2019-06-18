#!/bin/bash

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: pod-case-01
  annotations:
    k8s.v1.cni.cncf.io/networks: macvlan-conf
spec:
  containers:
  - name: pod-case-01
    image: docker.io/centos/tools:latest
    command:
    - /sbin/init
EOF


