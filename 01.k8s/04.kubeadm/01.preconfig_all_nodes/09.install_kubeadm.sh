#!/bin/bash

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install -y kubeadm

# Optional cofig for vagrant local env

IPADDR=$(hostname -I | sed 's/10.0.2.15//' | awk '{print $1}')
sed -i "s/\(KUBELET_EXTRA_ARGS=\).*/\1--node-ip=${IPADDR}/" /etc/sysconfig/kubelet


