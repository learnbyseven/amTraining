## Execute using Simple Script for Simple people :) 
## curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/builds/k8install/k8singleNode-install.sh | bash 
#!/bin/bash
echo "*********************************************"
echo "K8s vanilla installation begins using KubeADM"
echo "*********************************************"
sleep 1
apt-get clean
rm /var/lib/dpkg/lock    
rm /var/cache/apt/archives/lock
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF
sleep 1
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system
sleep 2
apt-get update -y 
sleep 1
export DEBIAN_FRONTEND=noninteractive
echo "********************************************************"
echo "DOCKER as a Contrainer run time installation in progress"
echo "********************************************************"
apt-get install -y libpq-dev apt-transport-https curl docker.io
sleep 1
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
sleep 1 
systemctl daemon-reload
systemctl restart docker
systemctl enable docker
sleep 1 
echo "*********************************"
echo "K8s PACKAGE INSTALLATION BEGINS"*
echo "*********************************"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sleep 1 
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sleep 1 
apt-get update
sleep 2
apt-get install -y kubelet=1.23.1-00 kubeadm=1.23.1-00 kubectl=1.23.1-00
swapoff -a
sleep 2
echo "*********************************"
echo "K8s PACKAGE INSTALLATION FINISHES"
echo "*********************************"
sleep 1
kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-bind-port=6443 
mkdir -p $HOME/.kube && cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl taint nodes --all node-role.kubernetes.io/master-
echo "**************************************"
echo "SDN - CALICO INSTALLATION STARTING NOW"
echo "**************************************"
sleep 1
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
sleep 1
echo "*************************************************"
echo "K8s Installation Finihed , RUN "kubectl get nodes"
echo "*************************************************"

## OPTIONAL
# **********
## FOR ADDING NODE
## curl -s https://raw.githubusercontent.com/learnbyseven/KUBERNETES-TRAINING/master/add_node_k8.sh | bash 

## Additional 
# echo "alias k='kubectl'" >> .bashrc && source .bashrc
## NOTE : KUBERNETES DOESN"T LIKE ANY KIND OF SWAP PARTITION, HENCE TO FIX THIS permanently DISABLE SWAP PARTITION FROM FSTAB FILE (/etc/fstab) 
