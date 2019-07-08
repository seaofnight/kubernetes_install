#!/bin/bash

# network plugin 변경 : calico -> weave net 
# Choose network plugin (cilium, calico, contiv, weave or flannel. Use cni for generic cni plugin)
#sed -i 's/kube_network_plugin: calico/kube_network_plugin: weave/' kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml
#sed -i 's/kube_network_plugin: calico/kube_network_plugin: flannel/' kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml
sed -i 's/kube_network_plugin: flannel/kube_network_plugin: calico/' kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml
# api port open 추후에 ha 세팅을 할 수 있으니 변경처리함 
sed -i 's/#kube_read_only_port: 10255/kube_read_only_port: 10255/' kubespray/inventory/mycluster/group_vars/all/all.yml

# external ip setting, 외부에서 kubelet에서 요총을 받을 호스트를 설정해준다. 
# 현재는 di07-03,4,5 설정, 하려했는데 뭔가 수정이 안됬음
if !(grep -q '219.250.188.74,219.250.188.73,219.250.188.53' kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml) ;  then 
 echo -e "supplementary_addresses_in_ssl_keys: [219.250.188.74,219.250.188.73,219.250.188.53]" >> kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml
fi

# multius config change required
sed -i 's/kube_network_plugin_multus: false/kube_network_plugin_multus: true/' kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml

cat kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml | grep "kube_network_plugin: "
cat kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml | grep kube_network_plugin_multus
cat kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml | grep supplementary_addresses_in_ssl_keys
cat kubespray/inventory/mycluster/group_vars/all/all.yml | grep kube_read_only_port

