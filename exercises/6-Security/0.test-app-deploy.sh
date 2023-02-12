#!/bin/bash
kubectl create -f https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/ex2-sample-apps-install/1-sample-apps-deployment/test.yaml
sleep 1
echo "Test namespace and app deployed"
sleep 2
echo "Verifying"
sleep 1
kubectl -n test get po 

