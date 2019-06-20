#!/bin/bash

kubectl create configmap nginxconfigmap --from-file=./config/default.conf
