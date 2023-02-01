#!/bin/bash
kubectl create ns myapp
kubectl label ns myapp istio-injection=enabled
kubectl get namespace -L istio-injection
kubectl -n myapp create secret tls myapp-certs --key exercises/ex4-ingress-Gateway/certs/server.key --cert exercises/ex4-ingress-Gateway/certs/server.crt
kubectl -n myapp create configmap myapp-configmap --from-file=nginx.conf=exercises/ex4-ingress-Gateway/3-myapp-deployment/nginx.conf
kubectl -n myapp create -f exercises/ex4-ingress-Gateway/3-myapp-deployment/myapp_deployment.yaml
