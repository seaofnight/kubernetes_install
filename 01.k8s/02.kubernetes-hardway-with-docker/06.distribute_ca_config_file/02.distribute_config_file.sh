#!/bin/bash

# distribute master node config file

cd ../82.tmp_config_files/

for i in $(cat ../01.create_inventory/controller.conf | tail -n 3 | grep k8s | awk '{print $2}') ; do
  scp \
	admin.kubeconfig \
	kube-controller-manager.kubeconfig \
	kube-scheduler.kubeconfig \
        encryption-config.yaml \
  ${i}:/etc/kubernetes
done



# distribute worker node config file

for instance in k8s-master k8s-worker1 k8s-worker2; do
  scp \
	${instance}.kubeconfig \
	kube-proxy.kubeconfig \
  ${instance}:/etc/kubernetes
done

