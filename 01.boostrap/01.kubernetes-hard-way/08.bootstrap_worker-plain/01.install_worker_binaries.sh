#!/bin/bash

wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.12.0/crictl-v1.12.0-linux-amd64.tar.gz \
  https://storage.googleapis.com/kubernetes-the-hard-way/runsc-50c283b9f56bb7200938d9e207355f05f79f0d17 \
  https://github.com/opencontainers/runc/releases/download/v1.0.0-rc5/runc.amd64 \
  https://github.com/containernetworking/plugins/releases/download/v0.6.0/cni-plugins-amd64-v0.6.0.tgz \
  https://github.com/containerd/containerd/releases/download/v1.2.0-rc.0/containerd-1.2.0-rc.0.linux-amd64.tar.gz \
  https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kube-proxy \
  https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubelet
  
sudo mkdir -p \
  /etc/cni/net.d \
  /opt/cni/bin \
  /var/lib/kubelet \
  /var/lib/kube-proxy \
  /var/lib/kubernetes \
  /var/run/kubernetes
  
{
  sudo mv runsc-50c283b9f56bb7200938d9e207355f05f79f0d17 runsc
  sudo mv runc.amd64 runc
  chmod +x kubectl kube-proxy kubelet runc runsc
  sudo mv kubectl kube-proxy kubelet runc runsc /usr/local/bin/
  sudo tar -xvf crictl-v1.12.0-linux-amd64.tar.gz -C /usr/local/bin/
  sudo tar -xvf cni-plugins-amd64-v0.6.0.tgz -C /opt/cni/bin/
  sudo tar -xvf containerd-1.2.0-rc.0.linux-amd64.tar.gz -C /
}
