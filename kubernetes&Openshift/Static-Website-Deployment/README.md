# Static Website Deployment with Kubernetes and Docker

This guide will walk you through the process of building a Docker image from a static website repository, pushing it to DockerHub, creating a Kubernetes deployment and service, setting up network policies, enabling NGINX Ingress controller, and creating an ingress resource and route in OpenShift.

## Prerequisites

- Docker
- Kubernetes (Minikube)
- kubectl
- OpenShift CLI (oc)

## Steps

### Step 1: Clone the Repository and Build the Docker Image

1. Clone the Repository:
    ```sh
    git clone https://github.com/ibrahimmAdel/static-website.git
    cd static-website
    ```

2. Build the Docker Image:
    ```sh
    docker build -t marwantarek11/nginx-custom .
    ```

3. Push the Docker Image to DockerHub:
    ```sh
    docker login
    docker push marwantarek11/nginx-custom
    ```

### Step 2: Create Kubernetes Deployment and Service

1. Create Deployment YAML (`deployment.yml`):
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: nginx-custom
    spec:
      replicas: 3
      selector:
        matchLabels:
          app: nginx-custom
      template:
        metadata:
          labels:
            app: nginx-custom
        spec:
          containers:
          - name: nginx-custom
            image: marwantarek11/nginx-custom:latest
            ports:
            - containerPort: 80
    ```

2. Create Service YAML (`nginx-service.yml`):
    ```yaml
    apiVersion: v1
    kind: Service
    metadata:
      name: nginx-service
      labels:
        app: nginx
    spec:
      selector:
        app: nginx-custom
      ports:
        - protocol: TCP
          port: 80
          targetPort: 80

    ```

3. Apply Deployment and Service:
    ```sh
    kubectl apply -f deployment.yml
    kubectl apply -f nginx-service.yml
    ```

### Step 3: Define Network Policy

1. Create Network Policy YAML (`network-policy.yml`):
    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: nginx-network-policy
    spec:
      podSelector:
        matchLabels:
          app: nginx-custom
      policyTypes:
      - Ingress
      ingress:
      - from:
        - podSelector:
            matchLabels:
              app: nginx-custom

    ```

2. Apply Network Policy:
    ```sh
    kubectl apply -f network-policy.yml
    ```

### Step 4: Enable NGINX Ingress Controller with Minikube

1. Enable Ingress Addon:
    ```sh
    minikube addons enable ingress
    ```

### Step 5: Create Ingress Resource

1. Create Ingress YAML (`nginx-ingress.yml`):
    ```yaml
    apiVersion: networking.k8s.io/v1
    kind: Ingress
    metadata:
      name: nginx-ingress
    spec:
      rules:
      - host: mydomain.com
        http:
          paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-service
                port:
                  number: 80

    ```

2. Apply Ingress:
    ```sh
    kubectl apply -f nginx-ingress.yml
    ```

### Step 6: Update /etc/hosts

1. Get Minikube IP:
    ```sh
    minikube ip
    ```

2. Edit /etc/hosts:
    ```sh
    sudo vim /etc/hosts
    ```

3. Add the following line:
    ```
    192.168.49.2 mydomain.com
    ```

### Step 7: Access the Service via Ingress

1. Access the website:
    Open your browser and go to `http://mydomain.com`.

### Step 8: Create Route in OpenShift

1. Log in to OpenShift:
    ```sh
    oc login
    ```

2. Create Route YAML (`route.yaml`):
    ```yaml
    apiVersion: route.openshift.io/v1
    kind: Route
    metadata:
      name: static-website-route
    spec:
      to:
        kind: Service
        name: static-website-service
      host: static-website.openshift.local
    ```

3. Apply Route:
    ```sh
    oc apply -f route.yaml
    ```

By following these steps, you will have created a custom NGINX image, deployed it to Kubernetes, set up an Ingress controller with Minikube, and created a route in OpenShift. This setup allows you to access the custom NGINX service via the Ingress endpoint using the specified domain name.

## mydomain.com
![Screenshot from 2024-06-04 01-58-49](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/47fd4206-6340-493b-822b-ab61c1fe45ab)

