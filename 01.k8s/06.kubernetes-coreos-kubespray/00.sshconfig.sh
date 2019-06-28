#!/bin/bash

# backup and execute all node 
vagrant ssh core-01
sudo -i 
systemctl restart sshd 
passwd core 
core
core


