# Comparison between Deployment and StatefulSet

This README provides a step-by-step guide to comparing Deployment and StatefulSet in Kubernetes and creating YAML files for configuring MySQL StatefulSet and defining a service for the MySQL StatefulSet.

## Table of Contents
1. [Introduction](#introduction)
2. [Comparison between Deployment and StatefulSet](#comparison)
3. [Configuring MySQL StatefulSet](#configuring-mysql-statefulset)
4. [Defining a Service for MySQL StatefulSet](#defining-a-service-for-mysql-statefulset)

## Introduction

Deployment and StatefulSet are both Kubernetes resources used for managing and scaling containerized applications. While Deployment is suitable for stateless applications, StatefulSet is designed for stateful applications where each instance requires stable, unique identifiers and stable storage.

## Comparison between Deployment and StatefulSet

| Feature              | Deployment                                       | StatefulSet                                      |
|----------------------|--------------------------------------------------|--------------------------------------------------|
| Scaling              | Scales horizontally by increasing or decreasing the number of replicas. | Maintains a sticky identity for each pod, enabling scaling and self-healing for stateful applications. |
| Pod Management       | Pods are replaceable and not tied to any persistent identity. | Pods have a stable, unique identifier and maintain their identity across rescheduling. |
| Ordering and Identity | Pods can be created, terminated, and replicated in any order. | Pods are created sequentially with stable, unique identities. |
| Storage              | Generally uses temporary, non-persistent storage. | Supports persistent storage, each pod getting its own volume. |
| Use Cases            | Suitable for stateless applications.             | Ideal for stateful applications like databases.   |

## Configuring MySQL StatefulSet

### Step 1: Create a YAML file for MySQL StatefulSet configuration

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql-statefulset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: mysql
  serviceName: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:latest
        ports:
        - containerPort: 3306
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "ivolve"
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-persistent-storage
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
```
## Defining a Service for MySQL StatefulSet:
### Step 2: Write a YAML file to define a service for the MySQL StatefulSet
```yaml
apiVersion: v1
kind: Service
metadata:
  name: mysql
spec:
  selector:
    app: mysql
  ports:
    - protocol: TCP
      port: 3306
      targetPort: 3306
```
Ensure you replace "ivolve" with your desired MySQL root password in the StatefulSet configuration.
