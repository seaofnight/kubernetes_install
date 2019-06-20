#!/bin/bash

INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')

for num in {0..9}
do
  curl $INGRESS_HOST:$INGRESS_PORT/productpage -s -o /dev/null 
done

SLEEP_TIME_SEC=5
SINCE_TIME=10s
PRODUCTPAGE_POD_NAME=$(kubectl -n default get pods --no-headers -l app=productpage -o custom-columns=":metadata.name")
REVIEWS_V1_POD_NAME=$(kubectl -n default get po --no-headers -l app=reviews,version=v1 -o custom-columns=":metadata.name")
REVIEWS_V2_POD_NAME=$(kubectl -n default get po --no-headers -l app=reviews,version=v2 -o custom-columns=":metadata.name")
REVIEWS_V3_POD_NAME=$(kubectl -n default get po --no-headers -l app=reviews,version=v3 -o custom-columns=":metadata.name")
INGRESS_GATEWAY_POD_NAME=$(kubectl -n istio-system get po -l app=istio-ingressgateway -o custom-columns=":metadata.name")
ISTIO_PROXY="istio-proxy"

sleep ${SLEEP_TIME_SEC}

echo -e "===== ingress-gateway log ======================================================="
kubectl -n istio-system logs ${INGRESS_GATEWAY_POD_NAME} -c ${ISTIO_PROXY} --since=${SINCE_TIME} | wc -l

echo -e "===== productpage istio-proxy log ==============================================="
kubectl -n default logs ${PRODUCTPAGE_POD_NAME} -c ${ISTIO_PROXY} --since=${SINCE_TIME} | grep product | wc -l

echo -e "===== review v1 istio-proxy log ================================================="
kubectl -n default logs ${REVIEWS_V1_POD_NAME} -c ${ISTIO_PROXY} --since=${SINCE_TIME} | grep review | wc -l

echo -e "===== review v2 istio-proxy log ================================================="
kubectl -n default logs ${REVIEWS_V2_POD_NAME} -c ${ISTIO_PROXY} --since=${SINCE_TIME} | grep review | wc -l

echo -e "===== review v3 istio-proxy log ================================================="
kubectl -n default logs ${REVIEWS_V3_POD_NAME} -c ${ISTIO_PROXY} --since=${SINCE_TIME} | grep review | wc -l


