---
description: >-
  Audit Vault Logs in OCI Context: Setting Vault in Dev Mode and Ingest Logs to
  Apica Ascent.
---

# Audit Vault Logs - OCI

## Audit Vault Logs in OCI Context: Setting Vault in Dev Mode and Ingest Logs to Apica Ascent.



{% embed url="https://github.com/ApicaSystem/ApicaHub/tree/master/integrations/vault/logs/OCI" %}
Download the source files for this configuration to your local system
{% endembed %}

### Step 1: Create a Namespace for Vault

Create a namespace to isolate Vault resources.

```bash
kubectl create namespace vault
kubectl get namespace
```

### Step 2: Create a persistent volume claim (PVC) in `ReadWriteOnce` access mode&#x20;

The Persistent Volume Claim (PVC) is used to store audit logs, which FluentBit reads and then ingest it into to Ascent.

Create the new PVC under vault namespace.

```bash
kubectl apply -f vault-pvc.yaml -n vault
kubectl get pvc -n vault
```

### Step 3: Install Vault in Dev Mode and Verify the Installation

Add the HashiCorp Helm Repository and Update Local Repository Cache

```
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo updat
```

Install HashiCorp Vault in a Kubernetes cluster, deploying it in development mode with the UI enabled and exposed via a LoadBalancer service for external access.

```bash
helm upgrade --install vault hashicorp/vault \
       --set='server.dev.enabled=true' \
       --set='ui.enabled=true' \
       --set='ui.serviceType=LoadBalancer' \
       --namespace vault -f server.yaml --debug
```

Verify the pods are in the running state

```
kubectl get all -n vault
```

Describe the verify the pods incase of any errors.

```
kubectl describe pod/<vault pod name> -nvault
```

### Step 4: Enable Audit Logs from the CLI

Follow these steps to enable the audit logs track all Vault requests, by exec into the vault pod.

*   Access the Vault pod by exec into the`vault-0` pod in the `vault` namespace:

    ```bash
    kubectl exec -it pod/vault-0 -n vault -- sh
    ```
*   Log in to the Vault server using the root token:

    ```bash
    vault login root
    ```
*   List current audit devices configured in Vault:

    ```bash
    vault audit list
    ```
*   Enable a file audit device with JSON log format, storing logs at the specified file path:

    ```bash
    vault audit enable file file_path=/vault/logs/vault-audit.log log_format=json
    ```
*   Verify that the file audit device has been successfully added:

    ```bash
    vault audit list
    ```

### Step 5: Update the PVC access mode to ReadWriteMany

To update a Persistent Volume Claim (PVC) in a Kubernetes namespace, follow these steps. First, list all PVCs in the `vault` namespace to identify which one needs modification. Then, edit the specific PVC using `kubectl edit`, replacing `<replace PV name>` with the actual name of the PVC you want to update.

```bash
# List all Persistent Volume Claims in the 'vault' namespace
kubectl get pvc -n vault

# Edit the specific PVC by replacing '<replace PV name>' with the actual PVC name
kubectl edit pvc/<replace PV name> -n vault
```

Please update the following section in your configuration file to clarify the access modes:

```yaml
spec:
  accessModes:
  - ReadWriteMany
```

Description:

* **ReadWriteMany:** This access mode allows multiple nodes to read and write the data

### Step 6: Install Fluent Bit to Stream Vault Audit Logs to Ascent

Configure the Fluent Bit Helm chart by adding its repository and refreshing your local chart list.

1.  Add the Fluent Bit Helm repository:

    ```bash
    helm repo add fluent https://fluent.github.io/helm-charts
    helm repo update
    ```
2. Create a ConfigMap for fluentBit:&#x20;

Before applying the configmap, please update the 4 fields based on the configuration in `fb-configmap.yaml` file.

* \[INPUT]: Replace `path` with the Vault audit log file path (e.g., `/vault/logs/vault-audit.log`).
* \[OUTPUT]: Replace `Host` with the Apica Ascent hostname or endpoint.
* \[OUTPUT]: Update `URI` path if necessary.
* \[OUTPUT]: Update `Header` Authorization Bearer token.

3. Apply the Config Map:

```bash
kubectl apply -f fb-configmap.yaml -n vault
kubectl get configmap -n vault
```

4. Deploy Fluent Bit:

```bash
kubectl apply -f fb-deployment.yaml -n vault
```

### Step 7: Generate Logs and Verify Fluent Bit Output

Follow these steps to log into the Vault UI and create secrets:

```
kubectl get all -nvault
```

### Steps

1. Log in to the Vault UI using the LoadBalancer IP or DNS name.
2. Enter your login credentials and access the Vault interface it will be token/root.
3. Navigate to the "Secrets" section from the side menu.
4. Click on "Create secret" and fill in the required information for your secret.
5. Save your secret to finalize the creation process.

This should generate some vault audit logs and verify the fluent fit pod logs, should scrape the new logs that are generated.

```bash
kubectl logs pod/<pod name> -n vault
```

Ensure logs show successful processing of Vault audit logs.

### Step 8: Verify Logs in Apica Ascent

1. Log in to Apica Ascent.
2. Navigate to **Logs & Insights**.
3. Look for the `vault-logs` namespace.
4. Click on the Vault app to view the logs.
