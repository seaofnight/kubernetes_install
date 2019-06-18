#!/bin/bash

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install docker-ce docker-ce-cli containerd.io -y

#cat >> /etc/docker/daemon.json <<EOF
#{
#  "exec-opts": ["native.cgroupdriver=systemd"],
#  "log-driver": "json-file",
#  "log-opts": {
#    "max-size": "100m"
#  },
#  "storage-driver": "overlay2"
#}
#EOF

mkdir -p /etc/systemd/system/docker.service.d

systemctl start docker && systemctl enable docker


## add systemd 
#ExecStart=/usr/bin/dockerd \
#          --exec-opt native.cgroupdriver=systemd
