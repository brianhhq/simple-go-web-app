# Deployment
This is to show you how to deploy an application

### Prerequisites
What things you need to install the software and how to install them.
* Download and install [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
* Download and install [kubernetes-cli](https://www.docker.com/get-started)
* [Configure kubectl for EKS](https://docs.aws.amazon.com/eks/latest/userguide/configure-kubectl.html)

### Config
* make sure aws cli region is the same as EKS region
* aws eks update-kubeconfig --name <EKS_Cluster_name>

### Usage
```
kubectl apply -f simple-go-web-app-controller.yml
kubectl apply -f simple-go-web-app-service.yml
kubectl get services -o wide
```
Get EXTERNAL-IP from the list. e.g: a852d60c44d5811e9a259065b0c5aa4c-1578097101.ap-northeast-1.elb.amazonaws.com
access it via browser
