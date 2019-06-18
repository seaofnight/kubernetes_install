#!/bin/bash

kubectl create -f rook/cluster/examples/kubernetes/ceph/common.yaml
kubectl create -f rook/cluster/examples/kubernetes/ceph/operator.yaml
