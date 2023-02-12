#!/bin/bash
# clean namespaces shortcut
kubectl -n app-tier delete vs,gw,dr,se --all
sleep 1
kubectl -n web-tier delete vs,gw,dr,se --all
sleep 1
kubectl -n test-tier delete vs,gw,dr,se --all
sleep 1
kubectl -n default delete vs,gw,dr,se --all
sleep 1
kubectl -n istio-system delete secret db-credential &>/dev/null
kubectl -n istio-system delete secret mtls-credential &>/dev/null
