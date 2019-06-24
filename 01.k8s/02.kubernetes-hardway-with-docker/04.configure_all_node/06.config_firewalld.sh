#!/bin/bash

systemctl restart sshd  
systemctl stop firewalld  
systemctl disable firewalld

