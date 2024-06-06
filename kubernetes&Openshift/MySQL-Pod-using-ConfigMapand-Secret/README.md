# Configuring a MySQL Pod using Config-map and Secret

This guide outlines the steps to configure a MySQL Pod using Config-map and Secret in Kubernetes.

## Objective

The objective is to create a namespace called `nti` and apply a resource quota to limit resource usage within the namespace. Then, create a Deployment in this namespace for the MySQL pod that uses the Config-Map and Secret. The MySQL database name and user will be defined in a Config-map, while the MySQL root password and user password will be stored in a Secret. The resource requests will be set to CPU: 0.5 vCPU and Mem: 1G, and resource limits to CPU: 1 vCPU and Mem: 2G. Finally, we'll execute into the MySQL pod and verify the MySQL configuration.

## Steps

1. **Create Namespace&Apply Resource Quota**: Create a namespace named `nti` and apply a resource quota to the `nti` namespace to limit resource usage. You can adjust the resource limits as needed. Create a YAML file (e.g., `namespace-and-resourcequota.yaml`) with the following content:

   ```yaml
   # Create namespace
    apiVersion: v1
    kind: Namespace
    metadata:
      name: nti
    
    # Apply resource quota
    apiVersion: v1
    kind: ResourceQuota
    metadata:
      name: nti-resource-quota
      namespace: nti
    spec:
      hard:
        pods: "5"
        cpu: "2"
        memory: 2Gi

   ```
   Apply the resource quota:
   ```bash
   kubectl apply -f namespace-and-resourcequota.yaml
   ```

2. **Create Config-map**: Define the MySQL database name and user in a Config-map. Create a YAML file (e.g., `mysql-configmap.yaml`) with the following content:
   ```yaml
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: mysql-config
     namespace: nti
   data:
     database-name: ivolve
     database-user: marwan

   ```
   Apply the Config-map:
   ```bash
   kubectl apply -f mysql-configmap.yaml
   ```

4. **Create Secret**: Store the MySQL root password and user password in a Secret. Create a YAML file (e.g., `mysql-secret.yaml`) with the following content:
   ```yaml
   apiVersion: v1
   kind: Secret
   metadata:
     name: mysql-secret
     namespace: nti
   stringData:
     root-password: marwan
     user-password: marwan

   ```
   Encode the passwords (in base64) and replace `ENCODED_ROOT_PASSWORD` and `ENCODED_USER_PASSWORD` with the respective encoded values. Apply the Secret:
   ```bash
   kubectl apply -f mysql-secret.yaml
   ```

5. **Create Deployment**: Create a Deployment for the MySQL pod that uses the Config-Map and Secret. Create a YAML file (e.g., `mysql-deployment.yaml`) with the following content:
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: mysql-deployment
      namespace: nti
    spec:
      replicas: 1
      selector:
        matchLabels:
          app: mysql
      template:
        metadata:
          labels:
            app: mysql
        spec:
          containers:
          - name: mysql
            image: mysql:latest
            env:
            - name: MYSQL_ROOT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mysql-secret
                  key: root-password
            - name: MYSQL_USER_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mysql-secret
                  key: user-password
            ports:
            - containerPort: 3306
            resources:
              requests:
                cpu: "500m"
                memory: "1Gi"
              limits:
                cpu: "1"
                memory: "2Gi"
            volumeMounts:
            - name: mysql-config-volume
              mountPath: /etc/mysql/conf.d
          volumes:
          - name: mysql-config-volume
            configMap:
              name: mysql-config
    
    ```
   Apply the Deployment:
   ```bash
   kubectl apply -f mysql-deployment.yaml
   ```

6. **Verify MySQL Configuration**: Execute into the MySQL pod and verify the MySQL configuration:
   ```bash
   kubectl exec -it deployment/mysql-deployment --namespace=nti -- bash
   mysql -u root -p
   # Enter the root password when prompted
   mysql> SHOW DATABASES;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    | ivolve             |
    +--------------------+
    4 rows in set (0.21 sec)


   
   mysql> EXIT;
   exit
   ```

Now, you have successfully configured a MySQL Pod using Config-map and Secret in Kubernetes.
