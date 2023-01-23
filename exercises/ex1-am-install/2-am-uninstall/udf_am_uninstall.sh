#!/bin/bash
echo "*********Uninstalling Aspenmesh*********"
sleep 1
cp -r /home/ubuntu/.kube .
sleep 3
helm -n istio-system uninstall istio-egress
sleep 3
helm -n istio-system uninstall istio-ingress
sleep 3
helm -n istio-system uninstall istiod
sleep 3
helm -n istio-system uninstall istio-base
sleep 3
kubectl -n istio-system delete crd --all
sleep 3
kubectl -n istio-system delete jobs --all
sleep 3
kubectl delete ns istio-system 
sleep 3
echo "*********Aspenmesh uninstalled - See you soon :) *********"
