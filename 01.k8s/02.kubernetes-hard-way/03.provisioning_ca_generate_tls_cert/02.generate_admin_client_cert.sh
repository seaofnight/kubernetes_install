#!/bin/bash

{

cat > admin-csr.json <<EOF
{
  "CN": "admin",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "US",
      "L": "Portland",
      "O": "system:masters",
      "OU": "Kubernetes The Hard Way",
      "ST": "Oregon"
    }
  ]
}
EOF

cfssl gencert \
  -ca=../pki/ca.pem \
  -ca-key=../pki/ca-key.pem \
  -config=../pki/ca-config.json \
  -profile=kubernetes \
  admin-csr.json | cfssljson -bare admin

mv admin* ../pki

ls -al ../pki/admin*

}
