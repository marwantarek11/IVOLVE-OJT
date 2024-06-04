# Setting Up Jenkins Deployment with Init Container and Probes

## Objective
The objective of this guide is to walk you through the process of deploying Jenkins on Kubernetes with an init container that sleeps for 10 seconds before the Jenkins container starts. We'll utilize readiness and liveness probes to monitor Jenkins and create a NodePort service to expose Jenkins outside the Kubernetes cluster.

## Prerequisites
Before you begin, ensure you have:
- A Kubernetes cluster set up and running.
- `kubectl` configured to manage your cluster.

## Step 1: Create Deployment
Create a Kubernetes deployment for Jenkins with an init container that sleeps for 10 seconds before starting the main Jenkins container and Add readiness and liveness probes to monitor the health of the Jenkins container.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins
spec:
  selector:
    matchLabels:
      app: jenkins
  replicas: 1
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
      - name: jenkins
        image: jenkins/jenkins
        ports:
        - containerPort: 8080
        readinessProbe:
          httpGet:
            path: /
            port: 8080
          initialDelaySeconds: 30
          periodSeconds: 10
        livenessProbe:
          httpGet:
            path: /
            port: 8080
          initialDelaySeconds: 180
          periodSeconds: 10
      - name: init-container
        image: busybox
        command: ['sh', '-c', 'sleep 10']

```

Apply the deployment YAML using the command:
```bash
kubectl apply -f jenkins-deployment.yaml
```


## Step 2: Expose Jenkins
Create a NodePort service to expose Jenkins outside the Kubernetes cluster. Here's an example YAML for the service:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: jenkins-service
spec:
  selector:
    app: jenkins
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
  type: NodePort

```

Apply the service YAML:
```bash
kubectl apply -f jenkins-service.yaml
```

## Step 3: Verification
1. Check the status of the deployment:
   ```bash
   kubectl get deployments
   ```

2. Verify the pods are running:
   ```bash
   kubectl get pods
   ```


3. Access Jenkins using the NodePort service. Open a web browser and go to: `http://localhost:8080`

![Screenshot from 2024-06-04 14-41-20](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/4270e8b8-eba1-4f8f-891f-363f3f2b194e)


You've successfully deployed Jenkins on Kubernetes with an init container, readiness, and liveness probes, and exposed it using a NodePort service.
