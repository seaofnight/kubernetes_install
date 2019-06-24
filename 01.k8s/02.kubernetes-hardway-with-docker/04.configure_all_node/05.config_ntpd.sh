#!/bin/bash

cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime
timedatectl set-timezone Asia/Seoul
systemctl start ntpd && systemctl enable ntpd


