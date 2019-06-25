#!/bin/bash 

curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.1.7 sh -

export PATH=$PWD/bin:$PATH
