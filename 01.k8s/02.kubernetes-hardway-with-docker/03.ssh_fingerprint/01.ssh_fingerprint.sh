#!/bin/bash

function generate_tmp_file_by_inventory(){

 FILE=../01.create_inventory/*.conf

 for f in $FILE; do
  cat $f >> ./hosts
 done

 cat ./hosts

 cat ./hosts | sort -u > ./hosts

}

function append_hosts_info(){

 echo "" >> /etc/hosts
 cat ./hosts >> /etc/hosts

}


function generate_ssh_key(){

 cat /dev/zero | ssh-keygen -q -N ""

}

function deploy_ssh_key_all_nodes(){

 for i in $(cat /etc/hosts | tail -n 3 | grep k8s | awk '{print $2}') ; do
  ssh-keyscan -t rsa "$i" >> ~/.ssh/known_hosts
  sshpass -p "vagrant" ssh-copy-id -i /root/.ssh/id_rsa.pub root@"$i"
  ssh "$i" hostname
 done

}

function remove_tmp_files(){
  rm -rf ./hosts
}

main(){

 generate_tmp_file_by_inventory && \
 append_hosts_info && \
 generate_ssh_key && \
 deploy_ssh_key_all_nodes

}

main
