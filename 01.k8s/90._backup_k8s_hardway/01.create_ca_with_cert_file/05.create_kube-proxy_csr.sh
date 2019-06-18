#!/bin/bash

{

cat > kube-proxy-csr.json <<EOF
{
  "CN": "system:kube-proxy",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "KO",
      "L": "Gangnam",
      "O": "system:node-proxier",
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
  kube-proxy-csr.json | cfssljson -bare kube-proxy

}

mv kube-proxy* pki 
ls -al pki | grep kube-proxy
