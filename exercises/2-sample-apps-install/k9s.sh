#!/bin/bash
curl -L -k https://ec2-15-207-229-119.ap-south-1.compute.amazonaws.com/k9s -O
chmod 775 k9s
sleep 1
echo "k9s installed , use ./k9s to open the terminal"

