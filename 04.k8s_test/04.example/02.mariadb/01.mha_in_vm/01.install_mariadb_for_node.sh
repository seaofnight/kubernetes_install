#!/bin/bash

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash && \
  yum install -y MariaDB-server.x86_64 && \ 
  sudo systemctl start mysql 
