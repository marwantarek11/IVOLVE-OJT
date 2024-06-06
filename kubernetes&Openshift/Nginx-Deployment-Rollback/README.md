# NGINX Deployment and Rollback Task

This guide outlines steps to deploy NGINX with 3 replicas, create a service to expose NGINX deployment, use port forwarding to access NGINX service locally, update NGINX image to Apache, view deployment's rollout history, and roll back NGINX deployment to the previous image version. Additionally, it covers monitoring pod status to confirm successful rollback.

## Prerequisites

- Kubernetes cluster configured and accessible via kubectl.
- Docker installed on your local machine.

## Step-by-Step Guide

1. **Deploy NGINX with 3 Replicas:**
   - Use the following YAML manifest to deploy NGINX with 3 replicas:
     ```yaml
     # nginx-deployment.yaml
     apiVersion: apps/v1
     kind: Deployment
     metadata:
       name: nginx-deployment
     spec:
       replicas: 3
       selector:
         matchLabels:
           app: nginx
       template:
         metadata:
           labels:
             app: nginx
         spec:
           containers:
           - name: nginx
             image: nginx
             ports:
             - containerPort: 80
     ```
   - Apply the manifest using `kubectl apply -f nginx-deployment.yaml`.

2. **Create a Service to Expose NGINX Deployment:**
   - Create a service to expose NGINX deployment using the yaml command:
      ```yaml
      apiVersion: v1
      kind: Service
      metadata:
        name: nginx-service
      spec:
        selector:
          app: nginx
        ports:
          - protocol: TCP
            port: 80
            targetPort: 80
        ```

3. **Use Port Forwarding to Access NGINX Service Locally:**
   - Forward local port 8080 to NGINX service using the following command:
     ```bash
     kubectl port-forward service/nginx-deployment 8080:80
     ```
   - NGINX service can now be accessed locally via `http://localhost:8080`.

4. **Update NGINX Image to Apache:**
   - Update NGINX image to Apache using the following command:
      ```yaml
     # nginx-deployment.yaml
     apiVersion: apps/v1
     kind: Deployment
     metadata:
       name: nginx-deployment
     spec:
       replicas: 3
       selector:
         matchLabels:
           app: nginx
       template:
         metadata:
           labels:
             app: nginx
         spec:
           containers:
           - name: nginx
             image: httpd
             ports:
             - containerPort: 80
           ```  
   - Apply the manifest using
   - ```bash
     kubectl apply -f nginx-deployment.yaml
     kubectl port-forward service/nginx-deployment 8080:80
     ```

5. **View Deployment's Rollout History:**
   - View the rollout history of the NGINX deployment using the following command:
     ```bash
     kubectl rollout history deployment/nginx-deployment
     ```

6. **Roll Back NGINX Deployment to Previous Image Version:**
   - Roll back NGINX deployment to the previous image version using the following command:
     ```bash
     kubectl rollout undo deployment/nginx-deployment
     ```

7. **Monitor Pod Status to Confirm Successful Rollback:**
   - Monitor pod status to confirm the successful rollback using the following command:
     ```bash
     kubectl get pods -w
     ```

## Results&Outputs
1- Apply the manifest using `kubectl apply -f nginx-deployment.yaml`.

   ![Screenshot from 2024-06-02 22-12-12](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/4ebb38f6-7c65-4e1c-a3de-5df09991e0cb)
   ![Screenshot from 2024-06-02 22-10-54](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/559b58e6-a42a-49c7-8aa4-4fb64455537e)

2- Update NGINX Image to Apache:

   ![Screenshot from 2024-06-02 22-16-14](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/ba56f597-a207-46de-8c79-88d615092c1e)

3- Roll Back NGINX Deployment to Previous Image Version:

   ![Screenshot from 2024-06-02 22-19-00](https://github.com/marwantarek11/IVOLVE_Training/assets/167176241/b28cd950-d7b8-41bc-a729-7167c7a6bbf7)


By following these steps, you have successfully deployed NGINX with 3 replicas, exposed it via a service, updated the NGINX image to Apache, viewed deployment's rollout history, rolled back to the previous image version, and monitored pod status to confirm the rollback.
