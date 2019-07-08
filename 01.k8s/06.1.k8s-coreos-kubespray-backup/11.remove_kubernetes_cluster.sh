#!/bin/bash

cd kubespray
ansible-playbook --become-user=root -i inventory/mycluster/hosts.ini remove-node.yml
