#!/bin/bash
echo "*********Starting Aspen Mesh Installation*********"
sleep 2
curl -L -k https://ec2-15-207-229-119.ap-south-1.compute.amazonaws.com/aspenmesh-carrier-grade-1.14.5-am1-linux.tar.gz  | tar -xz
sleep 2
cd aspenmesh-carrier-grade-1.14.5-am1 
cat > values.yaml <<EOF
aspen-mesh-controlplane:
  enabled: none
  clusterId: cluster1
  userAuth:
    type: none
aspen-mesh-dashboard:
  enabled: false
aspen-mesh-secure-ingress:
  enabled: false
traffic-claim-enforcer:
  enabled: false
aspen-mesh-metrics-collector:
  enabled: false
aspen-mesh-event-storage:
  enabled: false
cert-manager:
  enabled: false
external-dns:
  enabled: false
citadel:
  enabled: false
jaeger:
  enabled: false
aspen-mesh-packet-inspector:
  enabled: false
pilot:
  autoscaleMin: 1
  autoscaleMax: 1
  replicaCount: 1
  resources:
    requests:
      cpu: 500m
      memory: 2048Mi
global:
  certificateCustomFields: true
  proxy:
    resources:
      requests:
        cpu: 100m
        memory: 128Mi
      limits:
        cpu: 2000m
        memory: 1024Mi
  meshID: mesh1
  multiCluster:
    clusterName: cluster1
  network: network1
gateways:
  istio-ingressgateway:
    type: NodePort
    autoscaleMin: 1
  istio-egressgateway:
    autoscaleMin: 1
EOF
sleep 1
kubectl create ns istio-system
sleep 3
helm install istio-base --namespace istio-system manifests/charts/base
sleep 3
kubectl get crds | grep 'istio.io'
sleep 3 
helm install istiod manifests/charts/istio-control/istio-discovery  --namespace istio-system --values values.yaml
sleep 3
helm install istio-egress manifests/charts/gateways/istio-egress --namespace istio-system --values values.yaml
sleep 3
helm install istio-ingress manifests/charts/gateways/istio-ingress --namespace istio-system --values values.yaml
sleep 3
echo "*********Aspenmesh Installation Ends*********"
