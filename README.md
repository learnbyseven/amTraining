# amTraining
Istio AM Foundation Training 

### Application Architecture
<img width="777" alt="image" src="https://user-images.githubusercontent.com/34051943/218299128-8ce3ba32-21a4-4542-9ec0-3314c4324bfe.png">

- Frontend Application Service 
```css
web-tier-svc.web-tier.svc.cluster.local
```
- Backend Application Service
```css
app-tier-svc.app-tier.svc.cluster.local
```
### Envoy Internals 

<img width="700" alt="image" src="https://user-images.githubusercontent.com/34051943/218376912-0ddc4c92-f83c-42bf-b509-c53907cd8ac9.png">


## BUILDs Optional 


### K8s Install Single Node Cluster 
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/builds/k8install/k8singleNode-install.sh | bash
```
### k8s Uninstall
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/builds/k8-uninstall/k8-uninstall.sh | bash
```
## Exercise 1 AM deployment UDF


### aM-Install-UDF 
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/1-am-install/udf/udf-install_Aspenmesh.sh | bash 
```
### aM-Install-ALL-Components-UDF
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/1-am-install/3-am-all-components-install/udf_install_Aspenmesh_all.sh | bash
```
## Exercise 1 AM deployment BYOK

### aM-Install 
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/1-am-install/1-am-install/install_Aspenmesh.sh | bash
```
### aM-Install-ALL-Components
```css
curl -s https://raw.githubusercontent.com/learnbyseven/amTraining/main/exercises/1-am-install/3-am-all-components-install/install_Aspenmesh_all.sh | bash
```



### Traffic-Management 
<img width="331" alt="image" src="https://user-images.githubusercontent.com/34051943/218301323-80fa19e9-fc03-48b5-99e4-703ef71fd308.png">

### Ingress Gateway
<img width="331" alt="image" src="https://user-images.githubusercontent.com/34051943/218301397-9592d809-3673-4089-b744-295276b2fb1b.png">

### Egress-Gateway
<img width="331" alt="image" src="https://user-images.githubusercontent.com/34051943/218301430-04bddc84-8b62-4137-9d64-00ab4ec07df3.png">

### Security 
<img width="331" alt="image" src="https://user-images.githubusercontent.com/34051943/218301449-e37a7ab5-77fb-4475-bd92-36ae9ebeea5e.png">

###
Blueprint
https://udf.f5.com/b/a8a49894-9532-44e7-be9e-accbf9118ddd#documentation.




