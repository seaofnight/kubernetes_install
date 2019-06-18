#!/bin/bash

{
  sudo systemctl daemon-reload
  sudo systemctl enable kube-apiserver kube-controller-manager kube-scheduler
  sudo systemctl start kube-apiserver kube-controller-manager kube-scheduler
}

kubectl --kubeconfig ~/admin.kubeconfig get componentstatuses
mv ~/admin.kubeconfig /var/lib/kubernetes
