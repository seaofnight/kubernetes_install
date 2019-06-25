#!/bin/bash

# install go 
function install_go_language(){

 wget https://dl.google.com/go/go1.12.2.linux-amd64.tar.gz
 tar -xzf go1.12.2.linux-amd64.tar.gz
 mv go /usr/local
 export GOROOT=/usr/local/go
 export PATH=$GOROOT/bin:$PATH
 go version

}

function remove_go_download_file(){

rm -rf go1*

}

# build cni 
function download_and_build_cni_plugins(){

git clone https://github.com/containernetworking/plugins.git
cd plugins 
./build_linux.sh

}

# deploy all node cni binary
function deploy_cni_plugins_all_nodes(){
 for i in $(cat /etc/hosts | grep k8s| tail -n 3 | awk '{print $2}') ; do
  scp -r ./plugins/bin/* ${i}:/opt/cni/bin
 done
}

#install_go_language
#remove_go_download_file
#download_and_build_cni_plugins
deploy_cni_plugins_all_nodes



