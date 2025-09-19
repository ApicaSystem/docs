---
icon: server
---

# On-Premise PaaS deployment

## Before you begin

To get you up and running with the Apica Ascent PaaS, we've made Apica Ascent PaaS' Kubernetes components available as Helm Charts. To deploy Apica Ascent PaaS, you'll need access to a Kubernetes cluster and Helm 3.

Before you start deploying Apica Ascent PaaS, let's run through a few quick steps to set up your environment correctly.

### Add the Apica Ascent Helm repository

Add Apica Ascent's Helm repository to your Helm repositories by running the following command.

```
helm repo add apica-repo https://logiqai.github.io/helm-charts
```

The Helm repository you just added is named `apica-repo`. Whenever you install charts from this repository, ensure that you use the repository name as the prefix in your install command, as shown below.

```
helm install <deployment_name> apica-repo/<chart_name>
```

You can now search for the Helm charts available in the repository by running the following command.

```
helm search repo apica-repo
```

Running this command displays a list of the available Helm charts along with their details, as shown below.

```
$ helm repo update
$ helm search repo apica-repo
```

| NAME                    | CHART VERSION | APP VERSION | DESCRIPTION                                        |
| ----------------------- | ------------- | ----------- | -------------------------------------------------- |
| apica-repo/apica-ascent |               |             | Apica Ascent Data Fabric HELM chart for Kubernetes |

If you've already added Apica Ascent's Helm repository in the past, you can update the repository by running the following command.

```
helm repo update
```

### Create a namespace to deploy Apica Ascent

Create a namespace where we'll deploy Apica Ascent PaaS by running the following command.

```
kubectl create namespace apica-ascent
```

Running the command shown above creates a namespace named `apica-ascent`. You can also name your namespace differently by replacing `apica-ascent` with the name of your choice in the command above. In case you do, remember to use the same namespace for the rest of the instructions listed in this guide.

{% hint style="danger" %}
**Important:** Ensure that the name of the namespace is not more than 15 characters in length.
{% endhint %}

### Prepare your Values file

Just as any other package deployed via Helm charts, you can configure your LOGIG PaaS deployment using a Values file. The Values file acts as the Helm chart's API, giving it access to values to populate the Helm chart's templates.

To give you a head start with configuring your Apica Ascent deployment, we've provided sample `values.yaml` files for small, medium, and large clusters. You can use these files as a base for configuring your Apica Ascent deployment. You can download these files from the following links.

{% tabs %}
{% tab title="values.small.yaml" %}
{% file src="../../.gitbook/assets/values.small (23).yaml" %}
{% endtab %}

{% tab title="values.medium.yaml" %}
{% file src="../../.gitbook/assets/values.medium (17).yaml" %}
{% endtab %}

{% tab title="values.large.yaml" %}
{% file src="../../.gitbook/assets/values.large (17).yaml" %}
{% endtab %}
{% endtabs %}

You can pass the `values.yaml` file with the `helm install` command using the `-f` flag, as shown in the following example.

```
helm install apica-ascent --namespace apica-ascent --set global.persistence.storageClass=<storage_class_name> apica-repo/apica-ascent -f values.small.yaml
```

## Install Apica Ascent PaaS

Now that your environment is ready, you can proceed with installing Apica Ascent PaaS in it. To install Apica Ascent PaaS, run the following command.

```
helm install apica-ascent --namespace apica-ascent --set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

Running the above command installs Apica Ascent PaaS and exposes its services and UI on the ingress' IP address. Accessing the ingress' IP address in a web browser of your choice takes you to the Apica Ascent PaaS login screen, as shown in the following image.

If you haven't changed any of the admin settings in the `values.yaml` file you used during deployment, you can log into the Apica Ascent PaaS UI using the following default credentials.

* **Username**: `flash-admin@foo.com`
* **Password**: `flash-password`

{% hint style="info" %}
**Note:** You can change the default login credentials after you've logged into the UI.
{% endhint %}

Your Apica Ascent PaaS instance is now deployed and ready for use. Your Apica Ascent instance enables you to ingest and tail logs, index and query log data, and search capabilities. Along with the Apica Ascent UI, you can also access these features via Apica Ascent's CLI, [apicactl](https://github.com/ApicaSystem/apicactl).

## Customising your Apica Ascent deployment

You can customise your Apica Ascent PaaS deployment either before or after you deploy it in your environment. The types of supported customisations are listed below.

* Enabling HTTPS for the Apica Ascent UI
* Using an AWS S3 bucket
* Install Apica Ascent server and client CA certificates(optional)
* Updating the storage class
* Using an external AWS RDS Postgres database instance
* Uploading a Apica Ascent professional license
* Customising the admin account
* Using an external Redis instance
* Configuring the `cluster_id`
* Sizing your Apica Ascent cluster
* NodePort/ClusterIP/LoadBalancer
* Using Node Selectors
* Installing Grafana

### Enabling HTTPS for the Apica Ascent UI

You can enable HTTPS and assign a custom domain in the ingress for your Apica Ascent UI while installing Apica Ascent in your environment by running the following command.

```
helm install apica-ascent --namespace apica-ascent \
--set global.domain=ascent.my-domain.com \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

The following table describes all of the Helm options passed in the command above.

| Helm option                                              | Description                                                                                                                                                                                  | Default    |
| -------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| `global.domain`                                          | The DNS domain where the Apica Ascent service will be running. This option is required to enable HTTPS.                                                                                      | No default |
| `ingress.tlsEnabled`                                     | Enables the ingress controller to front HTTPS for services                                                                                                                                   | false      |
| `kubernetes-ingress.controller.defaultTLSSecret.enabled` | Specifies if a default certificate is enabled for the ingress gateway                                                                                                                        | false      |
| `kubernetes-ingress.controller.defaultTLSSecret.secret`  | Specifies the name of a TLS secret for the ingress gateway. If this is not specified, a secret is automatically generated of option `kubernetes-ingress.controller.defaultTLSSecret.enabled` |            |

After you run the command, you should then update your DNS server to point to the ingress controller service's IP. Once you've done this, you can access your Apica Ascent UI at the domain `https://ascent.my-domain.com` that you set in the ingress controller service.

#### Passing an ingress secret

You can pass your own ingress secret while installing the Helm chart by running the following command.

```
helm install apica-ascent --namespace apica-ascent \
--set global.domain=ascent.my-domain.com \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.secret=<secret_name> \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

If you want to pass your own ingress secret, you can do so when installing the HELM chart

### Using an AWS S3 bucket

Depending on your requirements, you may want to host your storage in either your own Kubernetes cluster or create a new storage bucket in a cloud provider like AWS.

If you choose to use an S3 bucket, be sure to deploy your Apica Ascent PaaS cluster in the same region that hosts your S3 bucket. Failing to do so can lead to you incurring additional data transfer costs for transferring data between regions.

To use your own S3 bucket, do the following.

#### Create an access/secret key pair for creating and managing your bucket

Go to your AWS IAM console and create an access key and secret key using which you can create your S3 bucket. Also provide access to the bucket for writing and reading your log files.

#### Deploy Apica Ascent in gateway mode

The S3 gateway acts as a caching gateway and helps reduce API costs. Deploy the Apica Ascent Helm chart in gateway mode by running the following command. Ensure you pass your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` and name your S3 bucket uniquely.

```
helm install apica-ascent --namespace apica-ascent --set global.domain=ascent.my-domain.com \
--set global.environment.s3_bucket=<bucket_name> \
--set global.environment.awsServiceEndpoint=https://s3.<region>.amazonaws.com \
--set global.environment.s3_region=<region> \
--set global.environment.AWS_ACCESS_KEY_ID=<access_key> \
--set global.environment.AWS_SECRET_ACCESS_KEY=<secret_key> \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

The command above automatically provisions an S3 bucket for you in the region you specify using the access credentials you pass with the command. If you do not wish to create a new bucket, make sure the access credentials you pass work with the S3 bucket you specify in the command. Additionally, make sure you provide a valid Amazon service endpoint for your S3 bucket or else the configuration defaults to using the [https://s3.us-east-1.amazonaws.com](https://s3.us-east-1.amazonaws.com/) endpoint.

The following table describes all the Helm options passed in the command above.

| elm option                                 | Description                                                                                                                            | Default                                                                      |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `global.cloudProvider`                     | This helm option specifies the supported `cloudProvider` that is hosting the S3 compatible bucket. Currently, only `aws` is supported. | `aws`                                                                        |
| `global.environment.s3_bucket`             | The name of the S3 bucket in AWS                                                                                                       | `logiq`                                                                      |
| `global.environment.awsServiceEndpoint`    | The S3 Service endpoint: https://s3.\*\*\<region>\*\*.amazonaws.com                                                                    | [`https://s3.us-east-1.amazonaws.co`](https://s3.us-east-1.amazonaws.com)`m` |
| `global.environment.AWS_ACCESS_KEY_ID`     | The AWS Access key for accessing the bucket                                                                                            | No default                                                                   |
| `global.environment.AWS_SECRET_ACCESS_KEY` | The AWS Secret key for accessing the bucket                                                                                            | No default                                                                   |
| `global.environment.s3_region`             | The AWS Region where the bucket is hosted                                                                                              | `us-east-1`                                                                  |

### Install Apica Ascent server and client CA certificates (optional)

Apica Ascent supports TLS for all of your log ingest sources. Apica Ascent also enables non-TLS ports by default. However, we recommend that you don't use non-TLS ports unless you're running Apica Ascent in a secure VPC or cluster.

You can provide server and client CA certificates to the cluster using a Kubernetes secrets file. Before using the following secrets file template, replace the template sections below with your Base64 encoded secret files.

```
apiVersion: v1
kind: Secret
metadata:
  name: logiq-certs
type: Opaque
data:
  ca.crt: {{ .Files.Get "certs/ca.crt.b64" }}
  syslog.crt: {{ .Files.Get "certs/syslog.crt.b64" }}
  syslog.key: {{ .Files.Get "certs/syslog.key.b64" }}
```

Once you've filled out this template, be sure to save the secrets file and name it appropriately, such as `logiq-certs.yaml`. You can now install the Apica Ascent Helm chart, along with the certificates using the following command.

```
helm install apica-ascent --namespace apica-ascent --set global.domain=ascent.my-domain.com \
--set logiq-flash.secrets_name=logiq-certs \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

{% hint style="info" %}
**Note:** If you skip this step, the Apica Ascent server automatically generates a CA and a pair of client and server certificates for you to use. You can retrieve them from the ingest server pods under the folder`/flash/certs.`
{% endhint %}

The following table describes the Helm options passed in the install command.

| HELM Option                | Description                                            | Default    |
| -------------------------- | ------------------------------------------------------ | ---------- |
| `logiq-flash.secrets_name` | TLS certificate key pair and CA cert for TLS transport | No default |

### Updating the storage class

If you plan on using a specific storage class for your volumes, you can configure your Apica Ascent deployment to use that storage class. Apica Ascent uses the standard storage class by default.

The following table details the Kubernetes `StorageClass` names and their default provisioner for each cloud provider.

| Cloud Provider | K8S StorageClassName | Default Provisioner  |
| -------------- | -------------------- | -------------------- |
| AWS            | `gp3`                | EBS                  |
| Azure          | UltraSSD\_LRS        | Azure Ultra disk     |
| GCP            | `standard`           | `pd-standard`        |
| Digital Ocean  | `do-block-storage`   | Block Storage Volume |
| Oracle         | `oci-bv`             | Block Volume         |
| Microk8s       | `microk8s-hostpath`  |                      |

{% hint style="info" %}
**Note:** It's possible that your environment uses a different `StorageClass` name for the provisioner. In such cases, ensure that you use the appropriate name for the storage class. For example, if you create a storage class named `ebs-volume` for the EBS provisioner for your cluster, you can use `ebs-volume` instead of `gp2,`as suggested by the table above.
{% endhint %}

You can update the storage class name for your Apica Ascent deployment by running the following command.

```
helm upgrade --namespace apica-ascent \
--set global.persistence.storageClass=<storage class name> \
apica-ascent apica-repo/apica-ascent
```

### Using an external AWS RDS Postgres database instance

To use an external AWS RDS Postgres database for your Apica Ascent deployment, run the following command.

```
helm install apica-ascent --namespace apica-ascent \
--set global.chart.postgres=false \
--set global.environment.postgres_host=<postgres-host-ip/dns> \
--set global.environment.postgres_user=<username> \
--set global.environment.postgres_password=<password> \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

The following table describes the Helm options that are passed with the command above.

| HELM Option                            | Description                                                                                                                   | Default    |
| -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ---------- |
| `global.chart.postgres`                | Deploys Postgres which is needed for Apica Ascent metadata. Set this to `false` if an external Postgres cluster is being used | `true`     |
| `global.environment.postgres_host`     | The host IP/DNS for external Postgres                                                                                         | `postgres` |
| `global.environment.postgres_user`     | The Postgres admin user                                                                                                       | `postgres` |
| `global.environment.postgres_password` | The Postgres admin user password                                                                                              | `postgres` |
| `global.environment.postgres_port`     | The host port for external Postgres                                                                                           | 5432       |

{% hint style="danger" %}
**Important:** While configuring RDS, create a new parameter group that sets `autoVacuum` to `true` or the value `1`. Associate this parameter group to your RDS instance.

`autoVacuum` automates the execution of the `VACUUM` and `ANALYZE` commands to gather statistics. `autoVacuum` checks for bloated tables in the database and reclaims the space for reuse.
{% endhint %}

### Uploading a Apica Ascent PaaS Enterprise Edition license

The Apica Ascent PaaS Community Edition gives you access to Enterprise Edition features but with lesser daily log ingest rates and ingest worker processes. If you feel the need to up your daily ingest rates and make the most out of Apica Ascent by extending its use to the rest of your team with SSO and RBAC, you can upgrade to the Apica Ascent PaaS Enterprise Edition.

You can get yourself an Enterprise Edition license by contacting us via [support@apica.io](mailto:support@apica.io). Once you receive your new license, you can apply it to your Apica Ascent deployment using Apica Ascent's CLI, [`apicactl`](https://github.com/ApicaSystem/apicactl?#quickstart).

To use `apicactl`, generate an API token from the Apica Ascent UI, as shown in the following image.

Once you've [configured `apicactl`](https://github.com/ApicaSystem/apicactl?#quickstart) with your API token and Apica Ascent cluster endpoint, run the following commands to update your license.

```
# Set cluster end point
> apicactl config set-cluster your-ascent-cluster.com

# Set the API Key
> apicactl config set-token r0q7EyIxNgVjAqLoIeDioJAWEhAR6wK4Y5XpPb3A

# Set the default namespace 
> apicactl config set-context ngnix
```

### Customising the admin account

Apica Ascent enables you to set your own admin credentials to log into your Apica Ascent cluster instead of using the default credentials. You can set your admin credentials while deploying Apica Ascent by running the following command.

```
helm install apica-ascent --namespace apica-ascent \
--set global.environment.admin_name="Ascent Administrator" \
--set global.environment.admin_password="admin_password" \
--set global.environment.admin_email="admin@example.com" \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

The following table describes the Helm options passed with the command above.

| HELM Option                         | Description                             | Default               |
| ----------------------------------- | --------------------------------------- | --------------------- |
| `global.environment.admin_name`     | The Apica Ascent Administrator's name   | `flash-admin@foo.com` |
| `global.environment.admin_password` | The Apica Ascent Administrator password | `flash-password`      |
| `global.environment.admin_email`    | The Apica Ascent Administrator's e-mail | `flash-admin@foo.com` |

### Using an external Redis instance

You can specify an external Redis instance to be used with your Apica Ascent deployment by specifying the Redis host in the installation command, as shown below.

```
helm install apica-ascent --namespace apica-ascent \
--set global.chart.redis=false \
--set global.environment.redis_host=<redis-host-ip/dns> \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

{% hint style="danger" %}
**Important:** Currently, Apica Ascent only supports connections to a Redis cluster in a local VPC without authentication. If you're using an AWS Elasticache instance, do not turn on encryption-in-transit or cluster mode.
{% endhint %}

The following table describes the Helm options that can be passed with the command above.

| HELM Option                     | Description                                                                                                  | Default        |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------ | -------------- |
| `global.chart.redis`            | Deploys Redis that is needed for log tailing. Set this to `false` if you're using an external Redis cluster. | `true`         |
| `global.environment.redis_host` | The host IP/DNS of the external Redis cluster                                                                | `redis-master` |
| `global.environment.redis_port` | The host port where the external Redis service is exposed                                                    | 6379           |

### Configuring the `cluster_id`

You can configure a cluster ID for your Apica Ascent instance at the time of deployment by passing the `cluster_id` of your choice while running the following install command. This helps you identify your Apica Ascent cluster in case you'd like to monitor it.

```
helm install apica-ascent --namespace apica-ascent \
--set global.environment.cluster_id=<cluster id> \
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

The following table describes the Helm options passed with the command above.

| HELM Option                     | Description                                                                                                                                                                                                                                    | Default        |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| `global.environment.cluster_id` | The cluster ID being used for the K8s cluster running Apica Ascent. For more information, read [Managing multiple K8S](https://github.com/logiqai/docs/blob/master/deploying-logiq/logiq-paas-deployment/broken-reference/README.md) clusters. | `Apica Ascent` |

### Sizing your Apica Ascent cluster

When deploying Apica Ascent, it's advisable to size your infrastructure appropriately to provide adequate vCPU and memory for the Apica Ascent instance to utilise. The following table describes the minimum recommended sizes for small, medium, and large cluster specifications.

| Apica Ascent cluster size | vCPU | Memory | NodeCount |
| ------------------------- | ---- | ------ | --------- |
| small                     | 12   | 32 GB  | 3         |
| medium                    | 20   | 56 GB  | 5         |
| large                     | 32   | 88 GB  | 8         |

### Configuring `NodePort`, `ClusterIP`, and `LoadBalancer`

The service type configurations for your Apica Ascent deployment are exposed in the `values.yaml` , as shown in the following example.

```bash
flash-coffee:
  service:
    type: ClusterIP
logiq-flash:
  service:
    type: NodePort
kubernetes-ingress:
  controller:
    service:
      type: LoadBalancer
```

For example, if you are deploying Apica Ascent on a bare-metal server and want an external load balancer to front Apica Ascent, configure all services as `NodePort` and pass the service types in the installation command, as shown in the following example.

```bash
helm install apica-ascent -n apica-ascent -f values.yaml \
--set flash-coffee.service.type=NodePort \
--set logiq-flash.service.type=NodePort \
--set kubernetes-ingress.controller.service.type=NodePort \
apica-repo/apica-ascent
```

### Using Node Selectors

You can optimise the deployment of the Apica Ascent stack using node labels and node selectors that help place various components of the stack optimally.

You can use the node label `logiq.ai/node` to control the placement of ingest pods for log data into ingest-optimised nodes, thereby allowing you to manage costs and instance sizing effectively.

The various nodeSelectors are defined in the globals section of the `values.yaml` file. In the following example, different node pools such as `ingest` , `common` , `db`, `cache` , and `sync` are used.

```bash
globals:
  nodeSelectors:
    enabled: true
    ingest: ingest
    infra: common
    other: common
    db: db
    cache: cache
    ingest_sync: sync
```

{% hint style="info" %}
**Note:** Node selectors are enabled by setting `enabled` to `true` for `globals.nodeSelectors` in your `values.yaml` file.
{% endhint %}

### Installing Grafana

The Apica Ascent stack bundles Grafana as part of the deployment as an optional component. You can enable Grafana in your Apica Ascent cluster by running the following command.

```bash
helm upgrade --install apica-ascent --namespace apica-ascent \
--set global.chart.grafana=true \ 
--set global.persistence.storageClass=<storage class name> apica-repo/apica-ascent
```

The Grafana instance is exposed at port `3000` on the ingress controller. The deployed Grafana instance uses the same login credentials as the Apica Ascent UI.
