# Kubernetes NGINX Deployment with Persistent Storage

## Objective

- Create a Kubernetes deployment named `nginx-deployment` with 1 replica using the NGINX image.
- Exec into the NGINX pod and create a file at `/usr/share/nginx/html/hello.txt` with the content `hello, this is <your-name>`.
- Verify the file is served by NGINX using `curl localhost/hello.txt`.
- Delete the NGINX pod and wait for the deployment to create a new pod.
- Verify the file at `/usr/share/nginx/html/hello.txt` is no longer present.
- Create a Persistent Volume Claim (PVC).
- Modify the deployment to attach the PVC to the pod at `/usr/share/nginx/html`.
- Repeat the previous steps and verify the file persists across pod deletions.
- Make a comparison between PV, PVC, and Storage Class.

## Step 1: Create a Kubernetes Deployment

Create a deployment YAML file (`nginx-deployment.yaml`):

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
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
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```
  Apply the deployment:
  ```bash
  kubectl apply -f deployment.yaml
  ```
## Step 2: Exec into the NGINX Pod and Create a File
   Get the pod name:
   ```bash
   kubectl get pods
   ```
  Exec into the pod:
  ```bash
  kubectl exec -it <pod-name> -- /bin/bash
  ```
  Create the file:
  ```bash
  echo "hello, this is <your-name>" > /usr/share/nginx/html/hello.txt
  ```
  Verify the file is served by NGINX:
  ```bash
  curl localhost/hello.txt
  ```
## Step 3: Delete the NGINX Pod
   Delete the pod:
   ```bash
   kubectl delete pod <pod-name>
   ```
   Wait for the new pod to be created and verify the file:
   ```bash
   kubectl get pods
   kubectl exec -it <new-pod-name> -- /bin/bash
   ls /usr/share/nginx/html/hello.txt
   ```
   The file should not be present.

 ## Step 4: Create a Persistent Volume Claim (PVC)
  Create a PVC YAML file (pvc.yaml):
    ```yaml
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: nginx-pvc
    spec:
      accessModes:
      - ReadWriteOnce
      resources:
        requests:
          storage: 1Gi
    ```
  Apply the PVC:
  ```bash
  kubectl apply -f pvc.yaml
  ```
 ## Step 5: Modify the Deployment to Attach the PVC
    Update the deployment YAML file (nginx-deployment.yaml):
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
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
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - mountPath: /usr/share/nginx/html
          name: html-volume
      volumes:
      - name: html-volume
        persistentVolumeClaim:
          claimName: nginx-pvc
```
    
  Apply the updated deployment:
  ```bash
  kubectl apply -f deployment.yaml
  ```
 ## Step 6: Repeat File Creation and Verification Steps
  Get the new pod name and exec into it:
     
 ```bash
 kubectl get pods
 kubectl exec -it <new-pod-name> -- /bin/bash
 ```
Create the file again:

```bash
echo "hello, this is <your-name>" > /usr/share/nginx/html/hello.txt
```
Verify the file is served by NGINX:

```bash
curl localhost/hello.txt
```
Delete the pod:
```bash
kubectl delete pod <new-pod-name>
```
Wait for the new pod to be created and verify the file persists:

```bash
kubectl get pods
kubectl exec -it <new-pod-name> -- /bin/bash
ls /usr/share/nginx/html/hello.txt
```
The file should now be present.


## Comparison between PV, PVC, and Storage Class
  Persistent Volume (PV):
  
  - A storage resource provisioned by an administrator.
  - Can be thought of as a physical storage in the cluster.
  - Created manually or dynamically using Storage Class.
  
  Persistent Volume Claim (PVC):
  
  - A request for storage by a user.
  - Allows users to request specific size and access mode (ReadWriteOnce, ReadOnlyMany, ReadWriteMany).
  - Binds to a suitable PV.
  
  Storage Class:
  
  - Describes different types/classes of storage.
  - Used for dynamic provisioning of PVs.
  - Provides parameters to the provisioner to create the PV.

     
     






      











