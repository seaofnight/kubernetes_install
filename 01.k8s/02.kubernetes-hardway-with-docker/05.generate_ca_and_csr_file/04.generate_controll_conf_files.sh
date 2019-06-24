#!/bin/bash

OUTPUT=../82.tmp_config_files/kube-controller-manager.kubeconfig

cd ../81.tmp_pki_files/


# generate kube-controller-manager context config

kubectl config set-cluster kubernetes-the-hard-way \
  --certificate-authority=ca.pem \
  --embed-certs=true \
  --server=https://127.0.0.1:6443 \
  --kubeconfig=$OUTPUT

  kubectl config set-credentials system:kube-controller-manager \
    --client-certificate=kube-controller-manager.pem \
    --client-key=kube-controller-manager-key.pem \
    --embed-certs=true \
    --kubeconfig=$OUTPUT

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-controller-manager \
    --kubeconfig=$OUTPUT

  kubectl config use-context default --kubeconfig=$OUTPUT



# generate kube-scheduler context config 

OUTPUT=../82.tmp_config_files/kube-scheduler.kubeconfig

  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=$OUTPUT

  kubectl config set-credentials system:kube-scheduler \
    --client-certificate=kube-scheduler.pem \
    --client-key=kube-scheduler-key.pem \
    --embed-certs=true \
    --kubeconfig=$OUTPUT

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-scheduler \
    --kubeconfig=$OUTPUT

  kubectl config use-context default --kubeconfig=$OUTPUT




# generate kube-apiserver context config 

OUTPUT=../82.tmp_config_files/service-account.kubeconfig

  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=$OUTPUT

  kubectl config set-credentials admin \
    --client-certificate=service-account.pem \
    --client-key=service-account-key.pem \
    --embed-certs=true \
    --kubeconfig=$$OUTPUT

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=admin \
    --kubeconfig=$$OUTPUT

  kubectl config use-context default --kubeconfig=$$OUTPUT



# generate encription file

cat > ../82.tmp_config_files/encryption-config.yaml <<EOF
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



ls -al ../82.tmp_config_files



