#!/bin/bash 

cd ../81.tmp_pki_files

sed 's/__CN__/Kubernetes/g;s/__O__/Kubernetes/g' ../01.create_inventory/csr.txt > ca-csr.json

cat > ca-config.json <<EOF
{
  "signing": {
    "default": {
      "expiry": "8760h"
    },
    "profiles": {
      "kubernetes": {
        "usages": ["signing", "key encipherment", "server auth", "client auth"],
        "expiry": "8760h"
      }
    }
  }
}
EOF

cfssl gencert -initca ca-csr.json | cfssljson -bare ca

ls -al  ca* 

