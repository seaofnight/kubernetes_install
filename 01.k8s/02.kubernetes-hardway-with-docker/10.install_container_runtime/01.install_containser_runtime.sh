#!/bin/bash

for i in $(cat ../01.create_inventory/data.conf | tail -n 3 | grep k8s | awk '{print $2}') ; do
  
 #ssh root@${i} 'yum install -y yum-utils device-mapper-persistent-data lvm2'
 #ssh -t root@${1}  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
 #ssh root@${1} yum install -y docker-ce docker-ce-cli containerd.io 
 #ssh root@${1} systemctl start docker && systemctl enable docker 
done

# manually install on each host

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
  yum install -y docker-ce docker-ce-cli containerd.io && \
  systemctl start docker && systemctl enable docker && docker ps
