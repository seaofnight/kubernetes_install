#!/bin/bash 

cat reference-deployment/multus-calico/{multus-daemonset.yml,calico-daemonset.yml} | kubectl apply -f -
