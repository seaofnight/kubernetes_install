#!/bin/bash

for i in $(cat ../01.create_inventory/controller.conf | tail -n 3 | grep k8s | awk '{print $2}') ; do
  ssh root@$i mkdir -p /etc/kubernetes/pki
  cd ../81.tmp_pki_files/
  scp \
	ca.pem \
	ca-key.pem \
	kube-apiserver-key.pem \
	kube-apiserver.pem \
	service-account-key.pem \
	service-account.pem \
  ${i}:/etc/kubernetes/pki
  ssh root@$i ls -al /etc/kubernetes/pki
done


for i in $(cat ../01.create_inventory/data.conf | tail -n 3 | grep k8s | awk '{print $2}') ;  do
  ssh root@$i mkdir -p /etc/kubernetes/pki
  scp \
	ca.pem \
	${i}-key.pem \
	${i}.pem \
  ${i}:/etc/kubernetes/pki
  ssh root@$i ls -al /etc/kubernetes/pki
done


