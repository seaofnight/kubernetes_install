#!/bin/bash



POD_NAME=$(kubectl get po --no-headers -l name=mongos1 -o custom-columns=":metadata.name")

kubectl exec -it ${POD_NAME} -- mongo mongodb://mongos1:27017

