# Container Orchestration with Kubernetes Operators

## Objective

The aim of this task is to understand and utilize Kubernetes Operators for deploying and managing applications. Specifically, we will focus on deploying ArgoCD and the ELK stack (Elasticsearch, Logstash, and Kibana) using Operators, and explore the capabilities of Operators in application lifecycle management.

## What is a Kubernetes Operator?

A Kubernetes Operator is a method of packaging, deploying, and managing a Kubernetes application. Operators extend Kubernetes functionality by adding custom resources and controllers. They leverage Kubernetes' API and custom resource definitions (CRDs) to automate tasks beyond the built-in Kubernetes capabilities.

Operators follow the Kubernetes principles, notably the control loop, to simplify complex application management tasks. They encapsulate operational knowledge in code, enabling automated management of application components and lifecycle events such as deployment, scaling, upgrades, and failure recovery.

## Prerequisites

- Kubernetes cluster (version 1.16 or later)
- kubectl command-line tool
- Helm (for installing some of the Operators)
- Basic knowledge of Kubernetes concepts and commands

## Steps to Deploy ArgoCD and ELK using Operators

### 1. Deploying ArgoCD using an Operator

ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes.

1. **Install the ArgoCD Operator:**
   - Add the ArgoCD Operator Helm repository:
     ```bash
     helm repo add argo https://argoproj.github.io/argo-helm
     ```
   - Update your Helm repositories:
     ```bash
     helm repo update
     ```
   - Install the ArgoCD Operator:
     ```bash
     kubectl create ns argocd
     helm install argocd-operator argo/argo-cd -n argocd
     ```
      ![1](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/d23c4bcc-f3b0-4544-a540-d33ee631a707)

     ```bash
     kubectl get all -n argocd
     ```
     ![2](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/54f5b194-2c4f-4dd7-929d-7eb36c91363d)
     
      Expose argocd service by run port forward to argocd service
        ```bash
        kubectl port-forward service/argocd-operator-server -n argocd 8080:443
        ```
      ![3](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/3a61751a-5849-4b28-b135-7e7a91dd2afb)
   
      Login by admin on ArgoCD console and get password by the following command
      ```bash
      kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
      ```
      ![4](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/429834e1-99ed-4c18-8937-2c492a1ad65e)
      ![5](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/7c25e458-74ac-430f-9dbc-b8ec5f6f4270)


### 2. Deploying the Elasticsearch using an Operator

The ELK stack (Elasticsearch) is used for searching, analyzing, and visualizing log data in real time.

1. **Install the Elastic Operator:**
   - Add the Elastic Helm repository:
     ```bash
     helm repo add elastic https://helm.elastic.co
     ```
   - Update your Helm repositories:
     ```bash
     helm repo update
     ```
   - Install the Elastic Operator:
     ```bash
     kubectl create ns elastic-system
     helm install elastic-operator elastic/eck-operator -n elastic-system
     ```
     ![7](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/a2888948-d90b-4ee3-95e0-8cd5e25d4f06)

   
2. **Deploy Elasticsearch**
   - Create and apply Elasticsearch instance:
     ```yaml
     apiVersion: elasticsearch.k8s.elastic.co/v1
      kind: Elasticsearch
      metadata:
        name: quickstart
        namespace: elastic-system
      spec:
        version: 7.10.0
        nodeSets:
        - name: default
          count: 1
          config:
            node.store.allow_mmap: false
     ```
     ```bash
     kubectl apply -f ELK.yml
     ```
   **Verify Elasticsearch Deployment**
      ```bash
      kubectl get all -n elastic-system
      ```
      ![8](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/bf9257f5-ddfb-4459-9ffe-9331386d75ec)
