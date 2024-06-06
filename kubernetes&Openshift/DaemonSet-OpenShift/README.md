# DaemonSet, Taints, Tolerations, and Node Affinity in Kubernetes

## Objective
This repository contains YAML files and instructions to understand and implement DaemonSet, Taints, Tolerations, and Node Affinity in Kubernetes, specifically using Minikube and OpenShift. 

## What is DaemonSet?
A DaemonSet ensures that all (or some) nodes run a copy of a pod. It is typically used for deploying pods that provide node-level services like log collection, monitoring, etc., on every node.

## What is it used for?
DaemonSets are useful for deploying system daemons such as log collectors, monitoring agents, and other system-level utilities to each node in a Kubernetes cluster.

## Prerequisites
- Minikube installed
- OpenShift installed
- Basic knowledge of Kubernetes concepts

## Instructions
1. **DaemonSet YAML File Creation**: Create a DaemonSet YAML file with a pod template containing an Nginx container in OpenShift. Verify the number of pods created.

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx-daemonset
  labels:
    app: nginx
spec:
  selector:
    matchLabels:
      name: nginx
  template:
    metadata:
      labels:
        name: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
```

2. **Taint the Minikube Node**: Taint the Minikube node with a specific key-value pair 'color=red' to simulate a tainted node.
```bash
kubectl taint nodes minikube color=red:NoSchedule
```
4. **Create a Deployment with Toleration**: Create a deployment with toleration 'color=blue' and notice the status of the pod.
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      tolerations:
      - key: "color"
        operator: "Equal"
        value: "blue"
        effect: "NoSchedule"
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```
```bash
DaemonSet-OpenShift$ kubectl get pod nginx-deployment-6fff96886d-r4b2q 
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-6fff96886d-r4b2q   0/1     Pending   0          80s
```
5. **Change Toleration to 'color=red'**: Change the toleration to 'color=red' and observe what happens to the pod.

```yaml
tolerations:
      - key: "color"
        operator: "Equal"
        value: "red"
        effect: "NoSchedule"
```
```bash
DaemonSet-OpenShift$ kubectl get pod nginx-deployment-7f77c46b5c-5nzqg 
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-7f77c46b5c-5nzqg   1/1     Running   0          15s
```

6. **Comparison**: Make a comparison between Taints & Tolerations and Node Affinity.
   Here's a summarized comparison of Taints & Tolerations and Node Affinity in tabular form:

| Aspect                | Taints & Tolerations                                   | Node Affinity                                             |
|-----------------------|--------------------------------------------------------|-----------------------------------------------------------|
| **Purpose**           | Repel or attract pods based on node conditions         | Constrain pod scheduling based on node labels             |
| **Target**            | Nodes                                                  | Pods                                                        |
| **Control**           | Node-centric                                           | Pod-centric                                                |
| **Implementation**    | Taints applied to nodes, tolerations defined in pods  | Node selectors or affinity rules specified in pod specs   |
| **Complexity**        | Simpler, more straightforward                          | More advanced, offers granular control                     |
| **Use Cases**         | Marking nodes for specific workloads, e.g., GPUs       | Scheduling pods based on hardware capabilities or location |
| **Flexibility**       | Moderate                                               | High                                                        |

In summary, Taints & Tolerations are primarily used for node-centric scheduling decisions, while Node Affinity provides more granular control over pod placement based on pod-centric rules and requirements. Depending on the use case and requirements, one may choose between Taints & Tolerations and Node Affinity or even utilize them together for optimal workload distribution and management in Kubernetes clusters.
