#!/bin/bash

{

cat > kube-scheduler-csr.json <<EOF
{
  "CN": "system:kube-scheduler",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "KO",
      "L": "Gangnam",
      "O": "system:kube-scheduler",
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
  kube-scheduler-csr.json | cfssljson -bare kube-scheduler

}

mv kube-sched* pki 
ls -al pki | grep kube-sched*
