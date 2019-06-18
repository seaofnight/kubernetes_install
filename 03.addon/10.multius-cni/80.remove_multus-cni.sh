#!/bin/bash

cat ./multus-cni/images/multus-daemonset.yml | kubectl delete -f -
