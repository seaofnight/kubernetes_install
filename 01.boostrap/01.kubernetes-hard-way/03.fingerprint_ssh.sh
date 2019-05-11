#!/bin/bash

echo "10.0.3.2 k8s-master" >> /etc/hosts
echo "10.0.3.3 k8s-worker1" >> /etc/hosts
echo "10.0.3.4 k8s-worker2" >> /etc/hosts

#ssh-keygen

for i in $(cat /etc/hosts | tail -n 3 | awk '{print $2}') ; do 
 ssh-copy-id $i
done
