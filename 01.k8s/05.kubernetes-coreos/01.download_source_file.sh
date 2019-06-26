#!/bin/bash

curl -O https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/vagrant/Vagrantfile
curl -O https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/vagrant/master-config.yaml
curl -O https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/vagrant/node-config.yaml

vagrant up
