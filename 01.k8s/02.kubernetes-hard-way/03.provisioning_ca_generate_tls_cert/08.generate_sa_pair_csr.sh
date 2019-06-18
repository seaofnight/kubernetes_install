#!/bin/bash

{

cat > service-account-csr.json <<EOF
{
  "CN": "service-accounts",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "US",
      "L": "Portland",
      "O": "Kubernetes",
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
  service-account-csr.json | cfssljson -bare service-account

mv service* ../pki

ls -al ../pki/service*

}
