#!/bin/bash 

{

KUBERNETES_PUBLIC_ADDRESS=10.0.2.15
KUBERNETES_SERVICE_ADDRESS=10.32.0.1


cat > kubernetes-csr.json <<EOF
{
  "CN": "kubernetes",
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
  -hostname=10.0.3.2,10.0.3.3,10.0.3.4,${KUBERNETES_PUBLIC_ADDRESS},${KUBERNETES_SERVICE_ADDRESS},127.0.0.1,kubernetes.default \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes

mv kube* ../pki

ls -al ../pki/kubernetes*

}
