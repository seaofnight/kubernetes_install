#!/bin/bash 

getenforce | grep Disabled || setenforce 0
echo "SELINUX=disabled" > /etc/sysconfig/selinux
