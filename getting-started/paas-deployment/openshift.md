---
description: >-
  This document provides a comprehensive guide on setting up, configuring, and
  managing Ascent in OpenSh
---

# Deploying Apica Ascent with OpenShift

## Creating a Red Hat OpenShift Cluster on AWS with ROSA

This guide walks you through the process of setting up an OpenShift cluster on AWS using the Red Hat OpenShift Service on AWS (ROSA). You'll need to create an account on Red Hat, configure AWS CLI and ROSA CLI, and set up roles and networking for the cluster. Once the setup is done, you'll be able to deploy Helm charts to your cluster.

***

### Prerequisites

* **Linux Environment**: ROSA CLI works only on Linux.
* **Red Hat Account**: Required for accessing the OpenShift Console.
* **AWS Account**: Required to create and manage OpenShift clusters on AWS.
* **AWS CLI and ROSA CLI**: Required for interacting with AWS and ROSA.

***

### Steps for Creating an OpenShift Cluster on AWS

#### 1. Create an Account on Red Hat Console

* **Visit Red Hat Console**: Navigate to [Red Hat OpenShift Console](https://console.redhat.com/openshift).
* **Create an Account**: If you don't already have one, create a Red Hat account by following the instructions on the site.&#x20;
* **Login**: Once your account is created, log in to the console.

#### 2. Access Cluster List

1. After logging into the Red Hat Console, navigate to **Clusters** and check if there are any existing OpenShift clusters.&#x20;
   * If a cluster already exists, proceed to deploy Helm charts.
   * If no cluster exists, you will need to create one.

#### 3. Create a Cluster on AWS Using ROSA

**Enable OpenShift Services in AWS**

1. Go to the [ROSA Getting Started Guide](https://console.redhat.com/openshift/create/rosa/getstarted).
2. Follow the instructions to enable the OpenShift service in your AWS account. This may include linking your AWS account with Red Hat if it hasn't been done already.

**Install and Configure AWS CLI**

1. **Download AWS CLI**: Download and install AWS CLI from [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
2. **Configure AWS CLI**: Run the following command to configure the AWS CLI with your AWS account credentials:

```bash
aws configure
```

3. if you sso then use that command to take login and create a profile out of it

**Install and Configure ROSA CLI**

1. **Download ROSA CLI**: Download and install the ROSA CLI (Red Hat OpenShift Service on AWS CLI) by following the [ROSA CLI Installation Guide](https://console.redhat.com/openshift/downloads).
2. **Set Up ROSA CLI**: Add the ROSA CLI to your system's PATH. Edit your `.bashrc` or `.zshrc` file and add the following line:

```bash
export PATH=$PATH:/path/to/rosa
```

3. **Reload the Shell**: After modifying the file, reload your shell configuration:

```bash
source ~/.bashrc  # or source ~/.zshrc
```

4. Get the rosa login command from openshift page and proceed for next steps after the successfull login

**Create ROSA Roles in Your AWS Account**

Once logged into ROSA, create the necessary roles for your OpenShift cluster in your AWS account:

```bash
rosa create account-roles --mode auto
```

**Configure Networking (Optional)**

You can either use an existing network (VPC, subnets, etc.) or create a new network for your OpenShift cluster. If creating a new network, set up the following in AWS:

* Virtual Private Cloud (VPC)
* Subnets
* Security groups

**Create the OpenShift Cluster**

1. Open the [Red Hat OpenShift Console](https://console.redhat.com/openshift).
2. Follow the steps in the console to create a new OpenShift cluster:
   * Select your **region**, **network**, and **instance type**.
   * Configure the cluster (OpenShift version, node configuration, etc.).
3.  Create the final role for your OpenShift cluster to gain access:

    ```bash
    rosa create cluster --cluster <cluster-name> --region <aws-region>
    ```

#### 4. Access the OpenShift Cluster 🌟

Once the cluster is successfully created, you can:

* **Access via Console**: Use the URL provided in the ROSA CLI output.
* **Log in to OpenShift**: Use the login credentials provided during cluster creation.

#### 5. Deploy Helm Charts to OpenShift Cluster 🎨

**Prerequisites**

* Kubernetes 1.18, 1.19 or 1.20
* Helm 3.2.0+
* Dynamic PV provisioner support in the underlying infrastructure

**Install Helm 🔨**

Follow the instructions in the [Helm Installation Guide](https://helm.sh/docs/intro/install/) to install Helm on your local machine.

**Log in to the OpenShift Cluster 🔐**

install [oci-client](https://docs.openshift.com/container-platform/4.8/cli_reference/openshift_cli/getting-started-cli.html) in openshift console create htpasswd login creds to get access into your local Log into your OpenShift cluster using the `oc login` command:

```bash
oc login <cluster-api-endpoint-url> -u <username> -p <password>
```

**Deploy a Helm Chart 📦**

### 1. List Existing Projects

View the current projects in your OpenShift cluster:

```bash
oc get projects
```

### 2. Create a Namespace for Apica

Create a namespace (project) for the Apica deployment:

```bash
oc create namespace <namespace>
```

Replace `<namespace>` with the desired name for your namespace.

### 3. Set the Context to the Namespace

Switch to the newly created namespace:

```bash
oc project <namespace>
```

This ensures that all subsequent commands are executed within the specified namespace.

### 4. Deploy the Apica Helm Chart

Install the Helm chart for Apica:

Use the `helm install` command to deploy a Helm chart. Replace the placeholders with your actual values

{% embed url="https://github.com/ApicaSystem/ApicaHub/blob/master/integrations/OpenShift/openshift-values.yaml" %}
you can change the values in this file values.yaml
{% endembed %}

```bash
helm install <release-name> --namespace <namespace> \
--set global.domain=<domain-name> \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
--set global.persistence.storageClass=<storage-class-name> -f values.yaml <chart-repo>/<chart-name> 
```

**Example:**

```bash
helm install apica-release --namespace apica-namespace \
--set global.domain=example.com \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
--set global.persistence.storageClass=<storage-class-name> apica-chart-repo/apica-chart
```

### 5. Configure Service Accounts

#### List Service Accounts

Retrieve the service accounts created in the namespace:

```bash
oc get serviceaccounts -n <namespace>
```

#### Example Service Accounts Created:

```plaintext
kube-state-metrics
kubernetes-ingress-backend
node-exporter
prometheus-alertmanager
prometheus-operator
prometheus-prometheus
thanos-bucketweb
thanos-compactor
thanos-query
thanos-receive
thanos-ruler
thanos-storegateway
deployer
flash-coffee
flash-discovery
ingress-nginx
logiq-flash
logiqctl
postgres
redis
s3-gateway
s3-gateway-job
s3-gateway-update-prometheus-secret
```

### 6. Assign Privileges to Service Accounts

Service accounts may require elevated permissions to perform specific operations, such as creating pods. Assign the `privileged` Security Context Constraints (SCC) to the necessary service accounts.

#### Grant SCC to a Single Service Account

Use this command to assign the `privileged` SCC to a service account:

```bash
oc adm policy add-scc-to-user privileged -z <service-account> -n <namespace>
```

#### Automate SCC Assignment for Multiple Service Accounts

Use the following script to grant the `privileged` SCC to multiple service accounts:

```bash
for sa in kube-state-metrics \
          kubernetes-ingress-backend \
          node-exporter \
          prometheus-alertmanager \
          prometheus-operator \
          prometheus-prometheus \
          thanos-bucketweb \
          thanos-compactor \
          thanos-query \
          thanos-receive \
          thanos-ruler \
          thanos-storegateway \
          deployer \
          flash-coffee \
          flash-discovery \
          ingress-nginx \
          logiq-flash \
          logiqctl \
          postgres \
          redis \
          s3-gateway \
          s3-gateway-job \
          s3-gateway-update-prometheus-secret
  do
    oc adm policy add-scc-to-user privileged -z $sa -n <namespace>
  done
```

#### Verify SCC Permissions

To confirm the assigned permissions, run:

```bash
oc describe sa <service-account> -n <namespace>
```

### Notes

* Replace `privileged` with a different SCC if less permissive access is sufficient.
* Ensure the namespace and service accounts exist before assigning SCCs.

#### Important Notes:

* The Node Exporter component is not deployed by default because the required port is busy. To resolve this, set the port to `9101` during deployment.
* Go to openshift console and open daemonset of node exporter > check the pod status > if its not running open the yaml file update the port to 9101 and save it
* Ensure these commands are executed after the Helm installation, either as part of the `helm install` command or separately.
* once its deployed update the cert in secret kubernetes-ingress-default-cert
* Go to openshift console > project > secrets > replace the original secret key and cert > save it

***

### Additional Resources

* OpenShift Documentation: [Security Context Constraints](https://docs.openshift.com)
* Helm Documentation: [Helm Charts](https://helm.sh/docs/)

This guide provides the necessary steps for deploying Apica on OpenShift.

**Verify the Deployment 🛡️**

After deploying the Helm chart, verify the installation:

```bash
helm list -n <namespace>
```

Check the status of your pods:

```bash
oc get pods -n <namespace>
```

### Summary of Key Commands 📜

#### AWS CLI Configuration

```bash
aws configure
```

#### ROSA CLI Commands

```bash
rosa login
rosa create account-roles --mode auto
rosa create cluster --cluster <cluster-name> --region <aws-region>
```

#### OpenShift Commands

```bash
oc login <cluster-url> -u <username> -p <password>
oc get pods -n <namespace>
```

#### Helm Commands

```bash
helm install <release-name> --namespace <namespace> \
--set global.domain=<domain-name> \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
--set global.persistence.storageClass=<storage-class-name> <chart-repo>/<chart-name>
helm list -n <namespace>
```
