#!/bin/bash
echo "*********Uninstalling Aspenmesh*********"
sleep 1
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
#kubectl get clusterroles | grep aspen-mesh | awk kubectl '{print $1}' |xargs -n1 kubectl delete clusterrole
#sleep 3
#kubectl get clusterroles | grep istio | awk kubectl '{print $1}' |xargs -n1 kubectl delete clusterrole
#sleep 3
echo "*********Aspenmesh uninstalled - See you soon :) *********"
