#!/bin/bash

kubectl delete -f rook/cluster/examples/kubernetes/ceph/common.yaml
kubectl delete -f rook/cluster/examples/kubernetes/ceph/operator.yaml
