#!/bin/bash

PASSWD=core
BECAME=core

function append_hosts_info(){
cat << EOF >> /etc/hosts

# kubernetes nodes
172.17.8.101 core-01
172.17.8.102 core-02
172.17.8.103 core-03

EOF
}


function generate_ssh_key(){

 cat /dev/zero | ssh-keygen -q -N ""

}

function deploy_ssh_key_all_nodes(){

 for i in $(cat /etc/hosts | grep core | awk '{print $2}') ; do
  ssh-keyscan -t rsa "$i" >> ~/.ssh/known_hosts
  sshpass -p $PASSWD ssh-copy-id -i /root/.ssh/id_rsa.pub $BECAME@"$i"
  ssh "$i" hostname
 done


}


main(){

# append_hosts_info
# generate_ssh_key
 deploy_ssh_key_all_nodes

}

main
