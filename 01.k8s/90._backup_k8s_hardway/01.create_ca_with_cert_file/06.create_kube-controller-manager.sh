#!/bin/bash

{

cat > kube-controller-manager-csr.json <<EOF
{
  "CN": "system:kube-controller-manager",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "KO",
      "L": "Gangnam",
      "O": "system:kube-controller-manager",
      "OU": "Kubernetes The Hard Way",
      "ST": "Seoul"
    }
  ]
}
EOF

cfssl gencert \
  -ca=./pki/ca.pem \
  -ca-key=./pki/ca-key.pem \
  -config=./pki/ca-config.json \
  -profile=kubernetes \
  kube-controller-manager-csr.json | cfssljson -bare kube-controller-manager

}

mv kube-controller* pki
ls -al pki | grep kube-controller
