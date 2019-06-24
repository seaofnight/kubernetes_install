#!/bin/bash

# generate Kubelet CA CSR File

cd ../81.tmp_pki_files

for i in $(cat ../01.create_inventory/data.conf | tail -n 3 | grep k8s | awk '{print $2}') ; do

INTERNAL_IP=$(cat /etc/hosts | grep ${i} | grep -v 127.0 | tail -n 1 | awk '{print $1}' )
EXTERNAL_IP=127.0.0.1,localhost

  sed 's/__CN__/'"system:node:"${i}'/g;s/__O__/system:nodes/g' ../01.create_inventory/csr.txt > ${i}-csr.json
  cfssl gencert \
    -ca=ca.pem \
    -ca-key=ca-key.pem \
    -config=ca-config.json \
    -hostname=${i},${EXTERNAL_IP},${INTERNAL_IP} \
    -profile=kubernetes \
    ${i}-csr.json | cfssljson -bare ${i}

done 




# generate kube-proxy CA CSR File 


sed 's/__CN__/system:kube-proxy/g;s/__O__/system:kube-proxy/g' ../01.create_inventory/csr.txt > kube-proxy-csr.json
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=kubernetes \
  kube-proxy-csr.json | cfssljson -bare kube-proxy

ls -al k8s-*
ls -al kube-proxy*
