#!/bin/bash

{

cat > kubernetes-csr.json <<EOF
{
  "CN": "kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "KO",
      "L": "Gangnam",
      "O": "Kubernetes",
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
  -hostname=10.0.3.2,10.0.3.3,10.0.3.4,127.0.0.1,kubernetes.default \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes

}

mv kubernetes* pki

ls -al | grep kubernetes*
