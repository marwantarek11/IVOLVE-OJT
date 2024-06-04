# Helm Chart Deployment on OpenShift

## Objective

This project demonstrates the use of Helm Chart to deploy and manage applications in an OpenShift cluster. The tasks include exploring Helm charts for common services, creating a new Helm chart for Nginx, deploying the Helm chart, verifying the deployment, accessing the Nginx server, and finally deleting the Nginx release.


## Prerequisites

- OpenShift cluster access.
- Helm installed on your local machine.
- kubectl configured to interact with your OpenShift cluster.


### Install Helm

If you don't have Helm installed, follow these instructions to install it: [Helm Installation Guide](https://helm.sh/docs/intro/install/).

### Access OpenShift Cluster

Ensure you have access to your OpenShift cluster and are logged in:

```sh
oc login https://api.ocp-training.ivolve-test.com:6443 --username=marwantarek --password=
```

## Creating the Helm Chart

### Create a New Helm Chart for Nginx

Generate a new Helm chart for Nginx:

```sh
helm create nginx-chart
```

### Helm Chart Directory Structure

The directory structure for your Nginx Helm chart should look like this:

```
nginx-chart/
  ├── Chart.yaml
  ├── values.yaml
  ├── templates/
  │   ├── deployment.yaml
  │   ├── service.yaml
  │   ├── _helpers.tpl
  │   └── NOTES.txt
  └── .helmignore
```

Customize the `values.yaml` and template files (`deployment.yaml`, `service.yaml`) as needed for your Nginx deployment.

## Deploying the Helm Chart

### Deploy Nginx using Helm

Deploy the Nginx Helm chart to your OpenShift cluster:

```sh
helm install my-nginx nginx
```

### Verify Deployment

Ensure the Nginx pod is running:

```sh
kubectl get all
```
```bash
NAME                                     READY   STATUS    RESTARTS        AGE
pod/nginx-nginx-chart-7cbb5b98ff-5qjwq   1/1     Running   1 (4m15s ago)   7h15m

NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/kubernetes          ClusterIP   10.96.0.1        <none>        443/TCP   3d1h
service/nginx-nginx-chart   ClusterIP   10.104.114.110   <none>        80/TCP    7h15m

NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nginx-nginx-chart   1/1     1            1           7h15m

NAME                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/nginx-nginx-chart-7cbb5b98ff   1         1         1       7h15
```

### Access the Nginx Server

To access the Nginx server, you might need to expose the service. Use the following command to expose the Nginx service:

```bash
 kubectl port-forward services/nginx-nginx-chart 8080:80
```
```bash
Forwarding from 127.0.0.1:8080 -> 80
Forwarding from [::1]:8080 -> 80
Handling connection for 8080
Handling connection for 8080
```

Visit the URL provided to see the Nginx welcome page.
![Screenshot from 2024-06-04 17-57-31](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/eeae31e1-a69f-4633-ba59-6d28f319305c)

## Cleanup

### Delete Nginx Release

When you're done, delete the Nginx release:

```sh
helm uninstall my-nginx
```

## Openshift GUI
1- Open link https://console-openshift-console.apps.ocp-training.ivolve-test.com , enter username and password
![image](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/b6cff34d-65ed-45d3-9289-a38f1e3ef931)
2- go to left bar and choose Devloper,then open Helm, click on Install a Helm Chart from the developer catalog
![image](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/cc48785d-f93e-481a-a9d4-5d346281ad83)
3- type in search bar "nginx" and click on RedHat nginx HTTP Server
![image](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/6f11f1b9-7248-482b-b02f-2f17d320df68)
4- modify you Release like this , then click install 
![image](https://github.com/marwantarek11/Ivolve-OJT/assets/167176241/22428164-c42e-4c84-b7be-96541e0b8436)


