---
description: This creates its own VPC,Subnets and NAT gateways.
---

# Deploying Apica Ascent on AWS EKS with Aurora PostgreSQL and ElastiCache Redis using CloudFormation

### 1. Overview

Link to Video: [https://www.youtube.com/watch?v=3Yw7TfeojDQ](https://www.youtube.com/watch?v=3Yw7TfeojDQ)

This guide will take you through deploying Apica Ascent on an AWS EKS cluster with Aurora PostgreSQL and ElastiCache Redis using CloudFormation and HELM. The installation will create user roles and policies that are necessary to create a GP3 storage class, a private S3 bucket, Aurora PostgreSQL and Elasticache with default encryption and bucket policies.

### 2. EKS K8S compatibility

{% hint style="info" %}
**Note:** This deployment method using Helm is only supported on Kubernetes versions till **1.28**. Steps described in the document only work if the cluster is created using the given cloud formation template.
{% endhint %}

### 3. AWS Resources

The Cloud formation template provisions the following resources

1. S3 Bucket
2. EKS Cluster
3. EKS Node Pools
4. VPC (Private and Public Subnets) and related things like Internet Gateway and NAT Gateway
5. Aurora PostgreSQL
6. ElastiCache Redis

#### 3.1 IAM Role, Aurora PostgreSQL and ElastiCache

IAM Role, Aurora PostgreSQL and ElastiCache can be created using Cloud formation template which is available on this link: [https://logiq-scripts.s3.ap-south-1.amazonaws.com/apicasingleset.yaml](https://logiq-scripts.s3.ap-south-1.amazonaws.com/apicasingleset.yaml)**,** details of created resources will be in the output section of Cloud formation, these details are used in section 5 (step 4 and 5).

* AmazonEKSWorkerNodePolicy
* AmazonEC2ContainerRegistryReadOnly
* AmazonEKS\_CNI\_Policy
* AmazonEKSClusterPolicy
* AmazonEKSServicePolicy
* RDSPolicy
* ElastiCachePolicy
* Aurora Endpoint
* ElastiCache Endpoint

### 4. Pre-requisites

Before you begin, ensure you have the following prerequisites.

1. You have permission on your AWS account to create an Elastic Kubernetes Service, S3 Bucket, Aurora PostgreSQL, and ElastiCache.
2. Above mentioned roles, Aurora and ElastiCache endpoints are created.
3. The AWS CLI is installed and configured on your machine
4. [Helm 3 ](https://helm.sh/docs/intro/install/)is installed on your machine.

### 5. Deployment steps

#### 5.1 Create EKS Cluster

**Step 1:** To prepare for the deployment, first obtain the Cloudformation template that will be used at the URL: [https://logiq-scripts.s3.ap-south-1.amazonaws.com/Apica/EKSCluster-singleset.yaml](https://logiq-scripts.s3.ap-south-1.amazonaws.com/Apica/EKSCluster-singleset.yaml)

**Step 2**: On your AWS Console, navigate to CloudFormation and select **Create stack**.

**Step 3**: Provide the options as shown below

* Under **Prerequisite - Prepare template**, select **Template is ready**.
* Under **Specify template** > **Template source**, select **Amazon S3 URL -** Here you will specify the template URL from Step 1 above.

[![](https://github.com/logiqai/docs/raw/master/.gitbook/assets/0)](https://github.com/logiqai/docs/blob/master/.gitbook/assets/0/README.md)

**Step 4**: To deploy the EKS cluster, we need to enter the **ARN** of the **IAM Role for EKS** that was created in **section 3.1.** We need a VPC with 2 Private subnets. Select them from the Network Configuration and Subnet configuration dropdown lists and they were created by the previous cloudformation template.

{% hint style="info" %}
**Important:** You **MUST** choose 2 different Private subnets from the same VPC.
{% endhint %}

[![](https://github.com/logiqai/docs/raw/master/.gitbook/assets/image%20\(1\)%20\(2\).png)](https://github.com/logiqai/docs/blob/master/.gitbook/assets/image%20\(1\)%20\(2\).png)

The EKS cluster will need the following node groups. Ensure that you select the node groups as specified in the following table.

| Node group | Instance size (min recommended) | Nodes (HA) |
| ---------- | ------------------------------- | ---------- |
| **ingest** | c5.xlarge (4 Core 8 GB RAM)     | 2          |
| **common** | c5.2xlarge (8 Core 32 GB RAM)   | 2          |

[![](https://github.com/logiqai/docs/raw/master/.gitbook/assets/image%20\(3\).png)](https://github.com/logiqai/docs/blob/master/.gitbook/assets/image%20\(3\).png)

**Step 5:** Provide the **S3 bucket name** from **section 3,** the Cloudformation will create the S3 bucket, S3 bucket name needs to be globally unique.

[![](https://github.com/logiqai/docs/raw/master/.gitbook/assets/image%20\(73\).png)](https://github.com/logiqai/docs/blob/master/.gitbook/assets/image%20\(73\).png)

**Step 6**: Click **Next**, and follow the instructions on the screen to create the stack.

#### 5.2 Verify EKS setup and tag subnets

**Step 1**: Once the stack is fully provisioned, connect to the AWS EKS cluster using AWS CLI as mentioned below. To do this, you need to install and configure [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

```
aws eks --region <AWS REGION> update-kubeconfig --name <EKS-cluster-name>
```

**Step 2**: Once the EKS cluster is up and running, execute the following commands to check the health of the cluster.

```
kubectl get namespace
NAME STATUS AGE
default Active 4h57m
kube-node-lease Active 4h57m
kube-public Active 4h57m
kube-system Active 4h57m
```

#### 5.3 Enable GP3 storage class for EKS

**Step 1**: Download this yaml file and run the commands mentioned below:

{% file src="../../../.gitbook/assets/gp3-sc.yaml" %}

```
kubectl apply -f <path_for_gp3-sc.yaml>

kubectl delete sc gp2
```

\
**Step 2**: Once the chart is installed, you should see pods similar to those shown below in your `kube-system` namespace.

```
kubectl get pods -n kube-system

ebs-csi-controller-745bf4d44d-9wrps 5/5 Running 0 3h53m
ebs-csi-controller-745bf4d44d-j7xjs 5/5 Running 0 3h53m
ebs-csi-node-fwwn2 3/3 Running 0 3h53m
ebs-csi-node-ksv8z 3/3 Running 0 3h53m
```

#### 5.4 Deploy Apica Ascent using HELM

**Step 1:** Create the apica-ascent namespace in your EKS cluster

```
kubectl create namespace apica-ascent
```

**Step 2**: Download the values file below and customise it per the instructions below.

{% file src="../../../.gitbook/assets/values.yaml" %}

**Step 2**: Replace the following variables in the **values.yaml** and proceed to install the Apica Ascent stack on your EKS cluster.

1. `awsServiceEndpoint`: https://s3.\\.amazonaws.com
2. `s3_bucket`: S3 bucket name
3. `s3_region`: \<s3 region>
4. redis\_host: \<ElastiCache endpoint>
5. postgres\_host: \<Aurora endpoint>
6. postgres\_user: <>
7. postgres\_password: <>
8. alert: "PrometheusDown"\
   expr: absent(up{prometheus="\<namespace>/\<namespace>prometheus-prometheus"})

**Step 4:** Deploy Apica Ascent stack using helm and updated values file, see below for additional options to customise the deployment for enabling https

```
helm repo add apica-repo https://logiqai.github.io/helm-charts
```

```
helm upgrade --install apica-ascent -n apica-ascent -f values.yaml apica-repo/apica-ascent
```

**Step 5 (Optional):** To enable https using self-signed certificates, please add additional options to helm and provide the domain name for the ingress controller. In the example below, replace **"ascent.my-domain.com"** with the https domain where this cluster will be available.

{% hint style="info" %}
**NOTE:** Your DNS will need to be programmed separately to map the domain to the service endpoint for Apica Ascent. Please see Step 7 below on how to obtain the service endpoint.
{% endhint %}

```
helm upgrade --install apica-ascent -n apica-ascent \
--set global.domain=ascent.my-domain.com \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
-f values.yaml apica-repo/apica-ascent
```

**Step 6:** Once the EKS cluster is created, add the VPC cidr in the Postgresql and Elasticache security group (create by first cloudformation template) inbound rules for port 5432 and 6379.\
\
**Step 7:** After the installation is complete execute the below command to get the service endpoint

```
kubectl -n apica-ascent get svc | grep LoadBalancer
NAME                        TYPE           CLUSTER-IP       EXTERNAL-IP
logiq-kubernetes-ingress     LoadBalancer <cluster_ip>    <Service end-point>
```
