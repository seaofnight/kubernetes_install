#!/bin/bash

PASSWD=$(kubectl get secret --namespace default mariadb -o jsonpath="{.data.mariadb-root-password}" | base64 --decode)

kubectl run mariadb-client --rm -it --restart='Never' \
  --image docker.io/bitnami/mariadb:10.3.16-debian-9-r0 \
  --namespace default \
  --command \
    -- mysql -h mysql -h mariadb.default.svc.cluster.local -uroot -p${PASSWD} \
    -e "CREATE TABLE my_database.test (id int not null, val varchar(255) not null);"

