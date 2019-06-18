#!/bin/bash 

cat << FOE >> ~/.bashrc 

# rook ceph tool box
alias rt='sh /root/k8s/bin/ceph/run_ceph_toolbox.sh'
FOE 
source ~/.bashrc 

