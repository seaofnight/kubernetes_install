#!/bin/bash

cd kubespray

#yum install -y epel-release ansible python-pip && \
#	pip2 install jinja2 --upgrade && \
#	yum install -y python36 && \
#	pip install -r requirements.txt 

/opt/bin/bin/pip install jinja2 --upgrade
/opt/bin/bin/pip install -r requirements.txt


cp -r inventory/sample/ inventory/mycluster

