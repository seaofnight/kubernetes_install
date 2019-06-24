#!/bin/bash 

for i in $(cat /etc/hosts | tail -n 3 | grep k8s | awk '{print $2}') ; do

 ssh root@$i  yum install -y epel-release wget ntp jq net-tools bind-utils moreutils

done

