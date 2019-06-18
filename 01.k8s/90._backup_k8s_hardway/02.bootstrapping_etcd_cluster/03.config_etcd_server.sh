#!/bin/bash

{
  sudo mkdir -p /etc/etcd /var/lib/etcd
  sudo cp ~/ca.pem ~/kubernetes-key.pem ~/kubernetes.pem /etc/etcd/
  ls -al /etc/etcd
}
