#!/bin/bash

wget -q \
  https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.11.1/crictl-v1.11.1-linux-amd64.tar.gz \
  https://github.com/containernetworking/plugins/releases/download/v0.6.0/cni-plugins-amd64-v0.6.0.tgz \
  https://storage.googleapis.com/kubernetes-release/release/v1.11.4/bin/linux/amd64/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v1.11.4/bin/linux/amd64/kube-proxy \
  https://storage.googleapis.com/kubernetes-release/release/v1.11.4/bin/linux/amd64/kubelet

sudo mkdir -p \
  /etc/cni/net.d \
  /opt/cni/bin \
  /var/lib/kubelet \
  /var/lib/kube-proxy \
  /var/lib/kubernetes \
  /var/run/kubernetes \
  /etc/kubernetes/manifests

{
  chmod +x kubectl kube-proxy kubelet
  sudo mv kubectl kube-proxy kubelet /usr/local/bin/
  tar -xvf crictl-v1.11.1-linux-amd64.tar.gz
  sudo mv crictl /usr/local/bin/
  sudo tar -xvf cni-plugins-amd64-v0.6.0.tgz -C /opt/cni/bin/
  sudo chown root:root /usr/local/bin/crictl
}

{
  sudo mv ~/${HOSTNAME}-key.pem ~/${HOSTNAME}.pem /var/lib/kubelet/
  sudo mv ~/${HOSTNAME}.kubeconfig /var/lib/kubelet/kubeconfig
  sudo mv ~/ca.pem /var/lib/kubernetes/
}


