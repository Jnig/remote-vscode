#!/bin/bash

echo "nameserver 1.1.1.1" > /etc/resolv.conf

dind dockerd
