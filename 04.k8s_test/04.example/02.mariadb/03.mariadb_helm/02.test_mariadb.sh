#!/bin/bash

PASSWD=$(kubectl get secret --namespace default mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 --decode)

kubectl run mariadb-client --rm -it --restart='Never' \
  --image docker.io/bitnami/mariadb:10.3.16-debian-9-r0 \
  --namespace default \
  --command \
    -- mysql -h mysql -h mariadb.default.svc.cluster.local -uroot -p${PASSWD} \
    -e "INSERT INTO my_database.test VALUES (1, '11');"

kubectl run mariadb-client --rm -it --restart='Never' \
  --image  docker.io/bitnami/mariadb:10.3.16-debian-9-r0 \
  --namespace default \
  --command \
  -- mysql -h mariadb-slave.default.svc.cluster.local -uroot -p${PASSWD} \
  -e "select * from my_database.test"
