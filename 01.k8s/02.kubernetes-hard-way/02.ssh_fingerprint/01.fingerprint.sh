#!/bin/bash 

function append_hosts_info(){
cat << EOF >> /etc/hosts

# kubernetes nodes
10.0.3.2 node0
10.0.3.3 node1
10.0.3.4 node2
EOF
}


function generate_ssh_key(){

 cat /dev/zero | ssh-keygen -q -N ""

}

function deploy_ssh_key_all_nodes(){

 for i in $(cat /etc/hosts | tail -n 3 | awk '{print $2}') ; do
  ssh-keyscan -t rsa "$i" >> ~/.ssh/known_hosts
  sshpass -p "vagrant" ssh-copy-id -i /root/.ssh/id_rsa.pub root@"$i"
  ssh "$i" hostname
 done


}


main(){

 append_hosts_info
 generate_ssh_key
 deploy_ssh_key_all_nodes

}

main

