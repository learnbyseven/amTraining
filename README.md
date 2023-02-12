# amTraining
Istio AM Foundation Training 

### Application Architecture
<img width="777" alt="image" src="https://user-images.githubusercontent.com/34051943/218299128-8ce3ba32-21a4-4542-9ec0-3314c4324bfe.png">

- WEB-TIER Frontend Application Service 
```css
web-tier-svc.web-tier.svc.cluster.local
```
- APP-TIER Backend Application Service
```css
app-tier-svc.app-tier.svc.cluster.local
```
### Envoy Internals 
<img width="750" alt="image" src="https://user-images.githubusercontent.com/34051943/218009834-8471f1b7-2fde-4d1a-9f52-3f0d80fdd1c7.png">

## BUILDs Optional 


### K8s Install Single Node Cluster 
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/builds/k8install/k8singleNode-install.sh | bash
```
### k8s Uninstall
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/builds/k8-uninstall/k8-uninstall.sh | bash
```
## Exercise 1 AM deployment

### aM-Install 
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/ex1-am-install/1-am-install/install_Aspenmesh.sh | bash
```
### aM-Install-UDF 
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/ex1-am-install/1-am-install/udf-install_Aspenmesh.sh | bash
```
### aM-Uninstall
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/ex1-am-install/2-am-uninstall/uninstall_Aspenmesh.sh | bash
```
### aM-Install-ALL-Components
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/ex1-am-install/3-am-all-components-install/install_Aspenmesh_all.sh | bash
```
### aM-Install-ALL-Components-UDF
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/ex1-am-install/3-am-all-components-install/udf_install_Aspenmesh_all.sh | bash
```
### aM-Uninstall-ALL-Components
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/ex1-am-install/4-am-all-components-uninstall/uninstall_Aspenmesh_all.sh | bash
```
### Traffic-Management 
<img width="331" alt="image" src="https://user-images.githubusercontent.com/34051943/218301323-80fa19e9-fc03-48b5-99e4-703ef71fd308.png">





