#!/bin/bash

#cat ./multus-cni/images/{multus-daemonset.yml,flannel-daemonset.yml} | kubectl apply -f -
cat ./multus-cni/images/multus-daemonset.yml | kubectl apply -f -
