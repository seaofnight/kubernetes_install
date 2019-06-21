#!/bin/bash

ENCRYPTION_KEY=$(head -c 32 /dev/urandom | base64)

cat > encryption-config.yaml <<EOF
kind: EncryptionConfig
apiVersion: v1
resources:
  - resources:
      - secrets
    providers:
      - aescbc:
          keys:
            - name: key1
              secret: ${ENCRYPTION_KEY}
      - identity: {}
EOF

#for instance in node0; do
for instance in k8s-master; do
  scp encryption-config.yaml ${instance}:~/
done

mv enc* ../config

ls -al ../config/enc*
