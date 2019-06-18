#!/bin/bash 

kubectl exec -it mongod-0 -c mongod-container mongo
db.getSiblingDB("admin").createUser({
      user : "main_admin",
      pwd  : "abc123",
      roles: [ { role: "root", db: "admin" } ]
 });

db.getSiblingDB('admin').auth("main_admin", "abc123");
use test;
db.testcoll.insert({a:1});
db.testcoll.insert({b:2});
db.testcoll.find();

kubectl exec -it mongod-1 -c mongod-container mongo

db.getMongo().setSlaveOk()
use test;
db.testcoll.find();
