#!/bin/bash

kubectl delete destinationrule httpbin
kubectl delete deploy httpbin fortio-deploy
kubectl delete svc httpbin

