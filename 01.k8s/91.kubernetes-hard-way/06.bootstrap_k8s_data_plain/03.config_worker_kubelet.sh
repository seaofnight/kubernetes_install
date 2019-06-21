#!/bin/bash

{
  sudo cp ~/${HOSTNAME}-key.pem ~/${HOSTNAME}.pem /var/lib/kubelet/
  sudo cp ~/${HOSTNAME}.kubeconfig /var/lib/kubelet/kubeconfig
  sudo cp ~/ca.pem /var/lib/kubernetes/
}

cat <<EOF | sudo tee /var/lib/kubelet/kubelet-config.yaml
kind: KubeletConfiguration
address: 0.0.0.0
apiVersion: kubelet.config.k8s.io/v1beta1
authentication:
  anonymous:
    enabled: false
  webhook:
    enabled: true
  x509:
    clientCAFile: "/var/lib/kubernetes/ca.pem"
authorization:
  mode: Webhook
cgroupDriver: cgroupfs
cgroupsPerQOS: true
clusterDNS:
  - "10.32.0.10"
podCIDR: "10.200.0.0/16"
clusterDomain: "cluster.local"
resolvConf: "/etc/resolv.conf"
rotateCertificates: true
tlsCertFile: "/var/lib/kubelet/${HOSTNAME}.pem"
tlsPrivateKeyFile: "/var/lib/kubelet/${HOSTNAME}-key.pem"
contentType: application/vnd.kubernetes.protobuf
cpuCFSQuota: true
enableControllerAttachDetach: true
enableDebuggingHandlers: true
enforceNodeAllocatable:
  - "pods"
failSwapOn: false
hairpinMode: promiscuous-bridge
healthzBindAddress: 127.0.0.1
healthzPort: 10248
port: 10250
serializeImagePulls: true
staticPodPath: /etc/kubernetes/manifests
EOF

cat <<EOF | sudo tee /etc/systemd/system/kubelet.service
[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/kubernetes/kubernetes
After=docker.service
Requires=docker.service

[Service]
ExecStart=/usr/local/bin/kubelet \\
  --config=/var/lib/kubelet/kubelet-config.yaml \\
  --pod-cidr="10.244.0.0/16" \\
  --cni-bin-dir=/opt/cni/bin \\
  --cni-conf-dir=/etc/cni/net.d \\
  --image-pull-progress-deadline=2m \\
  --kubeconfig=/var/lib/kubelet/kubeconfig \\
  --network-plugin=cni \\
  --register-node=true \\
  --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
