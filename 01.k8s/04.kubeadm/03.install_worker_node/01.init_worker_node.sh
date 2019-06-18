#!/bin/bash

IPADDR=10.0.3.2
TOKEN=abcdef.0123456789abcdef
kubeadm join --token ${TOKEN} --discovery-token-unsafe-skip-ca-verification ${IPADDR}:6443

# Optional config at vagrant env

#kubectl patch node ${HOSTNAME} --patch='{"metadata": {"labels": {"node-role.kubernetes.io/node": ""}}}'

#kubeadm token create --print-join-command 
#kubeadm join --discovery-token-unsafe-skip-ca-verification --token=102952.1a7dd4cc8d1f4cc5 172.17.0.7:6443

