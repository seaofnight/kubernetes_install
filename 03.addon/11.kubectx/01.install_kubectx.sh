#!/bin/bash

sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

cat << EOF >> ~/.bashrc

# kubectl alias
alias k="kubectl "
alias kn="kubens "
alias ke="kubectl exec -it "
EOF

source ~/.bashrc 
