# Kubernetes RBAC Configuration

This guide covers how to create a Service Account, define a Role with read-only access to pods, bind the Role to the Service Account, and retrieve the Service Account token in a Kubernetes cluster. Additionally, it explains the differences between Role/RoleBinding and ClusterRole/ClusterRoleBinding.

## Step-by-Step Guide

1. **Create a Service Account in the Default Namespace:**

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: marwan
  namespace: default
```
`kubectl apply -f service-account.yaml`

2. **Define a Role named pod-reader:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
```
`kubectl apply -f pod-reader-role.yaml`

3. **Bind the pod-reader Role to the Service Account:**

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader-binding
  namespace: default
subjects:
- kind: ServiceAccount
  name: marwan
  namespace: default
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```
`kubectl apply -f pod-reader-role-binding.yaml`

4. **Get Service Account Token:**

```bash
TOKEN=$(kubectl get secret marwan-token -o jsonpath='{.data.token}' | base64 --decode)
echo $TOKEN
```

### Comparison:

|          | Role/RoleBinding                                                                                   | ClusterRole/ClusterRoleBinding                                                                           |
|----------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Purpose  | Provides access within a specific namespace.                                                      | Provides access across all namespaces or a subset of namespaces.                                         |
| Scope    | Limited to resources and operations within a single namespace.                                      | Can span multiple namespaces.                                                                            |
| Resource | Role defines permissions on specific Kubernetes resources (e.g., pods, services) within a namespace. | ClusterRole defines permissions on cluster-wide resources (e.g., nodes, namespaces, persistent volumes). |
| Binding  | RoleBinding binds a Role to a specific Service Account within a namespace.                          | ClusterRoleBinding binds a ClusterRole to one or more Service Accounts within one or more namespaces.    |

### Conclusion:

Choose Role/RoleBinding for granting permissions within a single namespace, and ClusterRole/ClusterRoleBinding for cluster-wide permissions or permissions across multiple namespaces.
