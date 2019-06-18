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
      "C": "KO",
      "L": "Gangnam",
      "O": "system:nodes",
      "OU": "Kubernetes The Hard Way",
      "ST": "Seoul"
    }
  ]
}
EOF

INTERNAL_IP=$(cat /etc/hosts | grep ${instance} | grep -v 127.0 | tail -n 1 | awk '{print $1}' )

echo ${INTERNAL_IP} 

cfssl gencert \
  -ca=./pki/ca.pem \
  -ca-key=./pki/ca-key.pem \
  -config=./pki/ca-config.json \
  -hostname=${instance},${INTERNAL_IP} \
  -profile=kubernetes \
  ${instance}-csr.json | cfssljson -bare ${instance}

mv ${instance}* pki

done

ls -al pki | grep node
