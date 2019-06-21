#!/bin/bash


kubectl create deployment nginx --image=nginx

kubectl get deploy -w
