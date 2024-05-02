## Execute using Simple Script for Simple people :) 
## curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/builds/k8install/k8singleNode-install.sh | bash 
#!/bin/bash
sudo echo "*********************************************"
sudo echo "K8s vanilla installation begins using KubeADM"
sudo echo "*********************************************"
sudo sleep 1
sudo apt-get clean
sudo rm /var/lib/dpkg/lock    
sudo rm /var/cache/apt/archives/lock
sudo cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF
sleep 1
sudo cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system
sleep 2
sudo apt-get update -y 
sleep 1
sudo export DEBIAN_FRONTEND=noninteractive
sudo echo "********************************************************"
sudo echo "DOCKER as a Contrainer run time installation in progress"
sudo echo "********************************************************"
sudo apt-get install -y apt-transport-https ca-certificates curl gpg docker.io
sudo sleep 1
sudo cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
sudo sleep 1 
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker
sudo sleep 1 
sudo echo "*********************************"
sudo echo "K8s PACKAGE INSTALLATION BEGINS"*
sudo echo "*********************************"
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo sleep 1 
sudo echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo sleep 1 
sudo apt-get update
sudo sleep 2
sudo apt-get install -y kubelet kubeadm kubectl
# For specific version //sudo apt-get install -y kubelet=1.25.10-00 kubeadm=1.25.10-00 kubectl=1.25.10-00
sudo apt-mark hold kubelet kubeadm kubectl
sudo swapoff -a
sudo sleep 2
sudo echo "*********************************"
sudo echo "K8s PACKAGE INSTALLATION FINISHES"
sudo echo "*********************************"
sudo sleep 1
sudo kubeadm init --pod-network-cidr=192.168.0.0/16 
sudo mkdir -p $HOME/.kube && sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl taint nodes --all node-role.kubernetes.io/control-plane-
sudo echo "k8s control plane installation finished over here, In case you would like to install calico as a CNI then press "1" to start the CNI installation, other wise press "0"
#sudo echo "**************************************"
#sudo echo "SDN - CALICO INSTALLATION STARTING NOW"
#sudo echo "**************************************"
#sudo sleep 1
#sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml
#sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/custom-resources.yaml
#sudo sleep 1
#sudo echo "*************************************************"
#sudo echo "K8s Installation Finihed , RUN "kubectl get nodes"
#sudo echo "*************************************************"

## OPTIONAL
# **********
## FOR ADDING NODE
##sudo curl -s https://raw.githubusercontent.com/learnbyseven/KUBERNETES-TRAINING/master/add_node_k8.sh | bash 

## Additional 
#sudo echo "alias k='kubectl'" >> .bashrc && source .bashrc
## NOTE : KUBERNETES DOESN"T LIKE ANY KIND OF SWAP PARTITION, HENCE TO FIX THIS permanently DISABLE SWAP PARTITION FROM FSTAB FILE (/etc/fstab) 
