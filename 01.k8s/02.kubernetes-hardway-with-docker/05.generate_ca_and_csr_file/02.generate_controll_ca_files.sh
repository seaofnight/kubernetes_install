#!/bin/bash 

# generate System Admin CA CSR File

cd ../81.tmp_pki_files
sed 's/__CN__/admin/g;s/__O__/system:masters/g' ../01.create_inventory/csr.txt > ca-csr.json

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=kubernetes \
  admin-csr.json | cfssljson -bare admin



# generate kube-controller-manager CA CSR File

sed 's/__CN__/system:kube-controller-manager/g;s/__O__/system:kube-controller-manager/g' ../01.create_inventory/csr.txt > kube-controller-manager-csr.json 
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=kubernetes \
  kube-controller-manager-csr.json | cfssljson -bare kube-controller-manager



# generate kube-scheduler CA CSR File

sed 's/__CN__/system:kube-scheduler/g;s/__O__/system:kube-scheduler/g' ../01.create_inventory/csr.txt > kube-scheduler-csr.json
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=kubernetes \
  kube-scheduler-csr.json | cfssljson -bare kube-scheduler



# generate kube-apiserver CA CSR File

KUBERNETES_PUBLIC_ADDRESS=10.0.2.15
KUBERNETES_SERVICE_ADDRESS=10.32.0.1
#KUBERNETES_EXTERNAL_ADDRESS=

sed 's/__CN__/kubernetes/g;s/__O__/kubernetes/g' ../01.create_inventory/csr.txt > kube-apiserver-csr.json
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=10.0.3.2,10.0.3.3,10.0.3.4,${KUBERNETES_PUBLIC_ADDRESS},${KUBERNETES_SERVICE_ADDRESS},127.0.0.1,kubernetes.default \
  -profile=kubernetes \
  kube-apiserver-csr.json | cfssljson -bare kube-apiserver



# generate Service Account CA CSR File

sed 's/__CN__/service-accounts/g;s/__O__/kubernetes/g' ../01.create_inventory/csr.txt > service-account-csr.json
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=kubernetes \
  service-account-csr.json | cfssljson -bare service-account




ls -al ../81.tmp_pki_files

