#!/bin/bash

for instance in node0 node1 node2; do
cat > ${instance}-csr.json <<EOF
{
  "CN": "system:node:${instance}",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "US",
      "L": "Portland",
      "O": "system:nodes",
      "OU": "Kubernetes The Hard Way",
      "ST": "Oregon"
    }
  ]
}
EOF

INTERNAL_IP=$(cat /etc/hosts | grep ${instance} | grep -v 127.0 | tail -n 1 | awk '{print $1}' )
EXTERNAL_IP=127.0.0.1,localhost


cfssl gencert \
  -ca=../pki/ca.pem \
  -ca-key=../pki/ca-key.pem \
  -config=../pki/ca-config.json \
  -hostname=${instance},${EXTERNAL_IP},${INTERNAL_IP} \
  -profile=kubernetes \
  ${instance}-csr.json | cfssljson -bare ${instance}

done


mv node* ../pki

ls -al ../pki/node*
