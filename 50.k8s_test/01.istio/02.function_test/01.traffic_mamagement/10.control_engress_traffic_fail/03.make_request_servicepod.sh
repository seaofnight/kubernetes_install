#!/bin/bash

SOURCE_POD=$(kubectl get pod -l app=sleep -o jsonpath={.items..metadata.name})

#kubectl exec -it $SOURCE_POD -c sleep -- curl -I https://www.google.com | grep  "HTTP/"; kubectl exec -it $SOURCE_POD -c sleep -- curl -I https://edition.cnn.com | grep "HTTP/"
kubectl exec -it $SOURCE_POD -c sleep -- curl -I https://www.google.com ; kubectl exec -it $SOURCE_POD -c sleep -- curl -I https://edition.cnn.com 


