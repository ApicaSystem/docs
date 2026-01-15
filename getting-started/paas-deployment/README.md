---
icon: server
---

# On-Premise PaaS deployment

### Before you begin

To get you up and running with the Apica Ascent PaaS, we've made Apica Ascent PaaS' Kubernetes components available as Helm Charts. To deploy Apica Ascent PaaS, you'll need access to a Kubernetes cluster and Helm 3. You will also need access to S3-compatible object storage for storing metric data.

Before you start deploying Apica Ascent PaaS, let's run through a few quick steps to set up your environment correctly.

### Add the Apica Ascent Helm repository

Add Apica Ascent's Helm repository to your Helm repositories by running the following command.

```
helm repo add apica-repo https://apicasystem.github.io/apica-ascent-helm
```

The Helm repository you just added is named `apica-repo`. Whenever you install charts from this repository, ensure that you use the repository name as the prefix in your install command, as shown below.

```
helm upgrade --install <deployment_name> apica-repo/<chart_name>
```

### Create a Kubernetes cluster

If you already have a Kubernetes cluster, you can skip down to [Create a namespace to deploy Apica Ascent](#create-namespace).

If you do not have a Kubernetes cluster, use [k0s](https://k0sproject.io/) to assemble one or more physical machines or VMs into a Kubernetes cluster, onto which you can deploy Apica Ascent. For the host operating system we assume some distribution of Linux, but it does not matter which one.

#### Single Node

For reference, see the [official documentation](https://docs.k0sproject.io/stable/install/#install-k0s).

**Single-node deployments are suitable for testing only and should not be used for production, as there is no redundancy.**

Download the latest supported version of k0s from the [releases page](https://github.com/k0sproject/k0s/releases/). For Linux, obtain the asset named `k0s-<version>-amd64` (no file extension). Note that because Kubernetes upstream supports the three most recent minor releases concurrently, the top entry on the releases page may not be the latest minor version. You are encouraged to use the highest non-beta minor version available.

Copy the k0s binary that you downloaded into the `/usr/local/bin` directory:

```
chmod +x k0s-<version>-amd64
sudo cp k0s-<version>-amd64 /usr/local/bin/k0s
```

Configuration of a single-node setup can be accomplished by downloading the
following sample file and replacing occurrences of `##HOST_IP##` with the
host's default interface IP address.

{% file src="../../.gitbook/assets/k0s-sample.yaml" %}

Install the file as `/etc/k0s/k0s.yaml`. Run the following command to install
k0s:

```
sudo k0s install controller --single -c /etc/k0s/k0s.yaml
```

Next, download and install [kubectl](https://kubernetes.io/docs/reference/kubectl/), which is the tool used to interact with Kubernetes.

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl && sudo cp kubectl /usr/local/bin/
```

Generate a kubectl config using the `k0s kubeconfig` command:

```
mkdir ~/.kube
sudo k0s kubeconfig admin > ~/.kube/config
```

Finally, download the current version of [Helm](https://helm.sh/), the package manager for Kubernetes, from the [releases page](https://github.com/helm/helm/releases). Install it alongside k0s and kubectl:

```
tar zxf helm-<version>-linux-amd64.tar.gz && sudo cp linux-amd64/helm /usr/local/bin/
```

Continue with [Configure Kubernetes Load Balancer](#k8s-lb) below.

#### Multi-Node

For reference, see the [official documentation](https://docs.k0sproject.io/stable/k0sctl-install/).

K0s clusters are bootstrapped with the `k0sctl` tool. It connects to k0s nodes over ssh to orchestrate cluster setup and maintenance.

A small cluster used for Ascent consists of the following nodes:

* 1 load balancer for control plane HA (1 vCPU, 2G RAM)
  * Note: this can be a cloud LB if deploying in a cloud environment. See [Control Plane High Availability](https://docs.k0sproject.io/stable/high-availability/).
* 3 control-plane nodes, each 1 vCPU, 2G RAM
* 3 worker nodes, each 6 vCPU, 16G RAM, 500G disk

Adjust the number of worker nodes for larger-scale deployments. Three control plane nodes are sufficient for almost all situations, but should be an odd number per the [etcd documentation](https://etcd.io/docs/v3.6/faq/#why-an-odd-number-of-cluster-members).

The control plane load balancer needs to be a TCP load balancer that routes traffic for the following ports to all controller nodes:

* 6443 (Kubernetes API)
* 8132 (Konnectivity)
* 9443 (controller join API)

This can be a cloud load balancer, if available, or another instance running load balancer software such as nginx or HAproxy.

If the load balancer has an external IP for administrative access to the Kubernetes API, make note of it for configuring `k0sctl.yaml` below.

Install the `k0sctl` tool on whichever system will be used to manage the cluster. This can be an operator's computer or other client system, or on one of the controller nodes. [Installation](https://github.com/k0sproject/k0sctl?tab=readme-ov-file#installation) can be accomplished in various ways depending on the chosen system.

Once you have k0sctl installed, you will need a configuration file that describes the cluster you wish to create. The following sample file creates a cluster with 3 controller and 3 worker nodes, and installs OpenEBS for hostpath storage and MetalLB for cluster load balancing. Change the host specifics to match your environment. If you increased the number of worker nodes, be sure to include all of them in your config. Enter the IP address of the load balancer that is visible from the worker nodes. This is the address they will use to communicate with the Kubernetes API. If this load balancer will also be accessed from outside the host environment, add its externally-facing IP and/or domain name to the `sans` list so that TLS certificates will have the appropriate SubjectAlternativeName (SAN) entries.

{% file src="../../.gitbook/assets/k0sctl-sample.yaml" %}

Run `k0sctl apply --config path/to/k0sctl.yaml` to install the cluster. This will reach out to all configured nodes, install `k0s`, and apply the specified configuration.

If something goes wrong and you want to start over, `k0sctl reset` will uninstall k0s and completely tear down the cluster. This command is **destructive** and should only be used during an initial setup or at the end of a cluster’s lifecycle.

Once the cluster is running, you can `k0sctl kubeconfig` to output a configuration file suitable for use with `kubectl` to work with the cluster. If you do not already have any kubectl configuration, you can redirect it to `~/.kube/config`, otherwise you will need to merge the values for this cluster into your existing kubectl config.

Continue with [Configure Kubernetes Load Balancer](#k8s-lb) below.

#### Configure Kubernetes Load Balancer {#k8s-lb}

Starting with the following sample configuration file, add the IP addresses of all cluster nodes as a list under `addresses`. These are the addresses that MetalLB can make available to access the Apica Ascent deployment.

{% file src="../../.gitbook/assets/metallb-sample.yaml" %}

Install the final file as `/etc/k0s/metallb.yaml` and apply it:

```
kubectl apply -f /etc/k0s/metallb.yaml
```

### Create a namespace to deploy Apica Ascent {#create-namespace}

Create a namespace where we'll deploy Apica Ascent PaaS by running the following command.

```
kubectl create namespace apica-ascent
```

If desired, make this namespace the default for `kubectl` to use, removing the need to specify `-n apica-ascent` with every command:

```
kubectl config set-context --current --namespace=apica-ascent
```

Create secrets to provide your HTTPS certificate to the ingress controller as well as to the log ingestion service. The CN of this certificate should be the hostname/domain that you wish to use to access the Ascent platform. The same key and certificate can be used for both, but the secrets are of different types for each usage.

* `kubectl -n apica-ascent create secret tls my-ascent-ingress --cert=my-tls.crt --key=my-tls.key`
  * **NOTE:** if your certificate requires an intermediate, concatenate both into a single file, starting with the primary/server cert, and the intermediate after. Use this file as the argument to `--cert`.
* `kubectl -n apica-ascent create secret generic my-ascent-ingest --from-file=syslog.crt=my-tls.crt --from-file=syslog.key=my-tls.key --from-file=ca.crt=my-ca.crt`
  * **NOTE:** if your certificate requires an intermediate, provide that individually as `ca.crt`.

You can choose different names for the secrets, but see the next section for where to set each secret's name in the `values.yaml` file.

### Prepare your Values file

Just as any other package deployed via Helm charts, you can configure your Ascent PaaS deployment using a Values file. The Values file acts as the Helm chart's API, giving it access to values to populate the Helm chart's templates.

To give you a head start with configuring your Apica Ascent deployment, we've provided sample `values.yaml` files for single-node, small, medium, and large clusters. You can use these files as a base for configuring your Apica Ascent deployment. You can download these files from the following links.

* [values.single.yaml](https://raw.githubusercontent.com/ApicaSystem/apica-ascent-helm/refs/heads/master/apica-ascent/values.single.yaml)
* [values.small.yaml](https://raw.githubusercontent.com/ApicaSystem/apica-ascent-helm/refs/heads/master/apica-ascent/values.small.yaml)
* [values.medium.yaml](https://raw.githubusercontent.com/ApicaSystem/apica-ascent-helm/refs/heads/master/apica-ascent/values.medium.yaml)
* [values.large.yaml](https://raw.githubusercontent.com/ApicaSystem/apica-ascent-helm/refs/heads/master/apica-ascent/values.large.yaml)

The following keys require setting site-specific values:

* `global.domain` - The hostname that will be used to access the Ascent UI. This must match the CN of the TLS certificate used to create the secrets above.
* `global.imageRegistry` - **If using a private registry**, set this to the hostname of the registry server. If not, leave the default value in place to get images from `docker.io`.
* `global.environment.postgres_password` - password for the `postgres` database user
* `global.environment.s3_url` - base URL for your S3 or compatible service
* `global.environment.s3_access` - S3 access key
* `global.environment.s3_secret` - S3 secret key
* `global.environment.s3_bucket` - S3 bucket name
* `global.environment.s3_region` - S3 region name
* `global.environment.AWS_ACCESS_KEY_ID` - S3 access key
* `global.environment.AWS_SECRET_ACCESS_KEY` - S3 secret key
* `global.environment.awsServiceEndpoint` - base URL for your S3 or compatible service
* `global.environment.admin_name` - admin account name
* `global.environment.admin_password` - admin account password **(must meet the following minimum requirements: at least 12 characters, including at least one uppercase letter, one lowercase letter, one digit, and one special character.)**
* `global.environment.admin_org` - admin account organization name
* `global.environment.admin_email` - admin account email address
* `global.postgres.postgresqlPostgresPassword` - password for the PostgreSQL root user
* `global.postgres.postgresqlPassword` - password for the `postgres` database user

If you changed the names of the Kubernetes secrets above, use the name of the `tls` secret for  `gateway.tls.secretName`. Use the name of the `generic` secret for `logiq-flash.secrets_name`.

### Install Envoy Gateway Resources

```
helm install eg oci://docker.io/envoyproxy/gateway-helm \
  --version v1.6.0 -n envoy-gateway-system --create-namespace
```

### **Install Apica Ascent**

Install Apica Ascent by running Helm:

```
helm repo update
helm upgrade --install apica-ascent \
  --namespace apica-ascent \
  -f values.yaml \
  apica-repo/apica-ascent
```

Use these same command to apply updates whenever there is a new version of the Helm chart or a new version of Apica Ascent.
