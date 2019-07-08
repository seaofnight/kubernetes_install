#!/bin/bash -uxe

VERSION=2.7.13.2715
PACKAGE=ActivePython-${VERSION}-linux-x86_64-glibc-2.12-402695

# make directory
mkdir -p /opt/bin
cd /opt

wget http://downloads.activestate.com/ActivePython/releases/${VERSION}/${PACKAGE}.tar.gz
tar -xzvf ${PACKAGE}.tar.gz
