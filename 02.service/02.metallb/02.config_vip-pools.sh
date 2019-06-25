#!/bin/bash

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: k8s-cluster-ip-pools
      protocol: layer2
      addresses:
      - 10.0.3.237-192.168.11.239
EOF

