#!/bin/bash

systemctl start docker  && systemctl enable docker
systemctl start kubelet && systemctl enable kubelet
