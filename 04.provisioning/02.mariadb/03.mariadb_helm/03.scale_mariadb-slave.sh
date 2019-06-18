#!/bin/bash

kubectl patch sts mariadb-slave -p '{"spec":{"replicas":5}}';

#kubectl scale --replicas=1 sys/mariadb-slave
