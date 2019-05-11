#!/bin/bash

CA=../.CA


wget  "https://github.com/coreos/etcd/releases/download/v3.3.9/etcd-v3.3.9-linux-amd64.tar.gz"
  
{
  tar -xvf etcd-v3.3.9-linux-amd64.tar.gz
  sudo mv etcd-v3.3.9-linux-amd64/etcd* /usr/local/bin/
}

{
  sudo mkdir -p /etc/etcd /var/lib/etcd
  sudo cp ../.CA/ca.pem ../.CA/kubernetes-key.pem ../.CA/kubernetes.pem /etc/etcd/
}
  
