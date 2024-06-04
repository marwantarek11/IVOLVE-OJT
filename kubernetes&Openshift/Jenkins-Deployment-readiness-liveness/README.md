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
  name: jenkins-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jenkins
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
        - containerPort: 50000
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
          initialDelaySeconds: 60
          periodSeconds: 10

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
  type: NodePort
  selector:
    app: jenkins
  ports:
    - protocol: TCP
      port: 8080
      nodePort: 30000
    - protocol: TCP
      port: 50000
      nodePort: 30001
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


3. Access Jenkins using the NodePort service. Open a web browser and go to: `http://<node-ip>:30000`

## Conclusion
You've successfully deployed Jenkins on Kubernetes with an init container, readiness, and liveness probes, and exposed it using a NodePort service.

---

Feel free to customize the steps according to your environment or requirements. Let me know if you need further assistance!
