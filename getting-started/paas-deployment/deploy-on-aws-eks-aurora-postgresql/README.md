---
description: >-
  Deploying Apica Ascent on AWS EKS with Aurora PostgreSQL and ElastiCache Redis
  on production VPC using Cloudformation
hidden: true
---

# Deploying Ascent on AWS EKS with Aurora PostgreSQL and ElastiCache Redis using Cloud Formation

## Prerequisites

Before proceeding, ensure the following prerequisites are met:

* [ ] **Reference Video:** [**https://www.youtube.com/watch?v=3Yw7TfeojDQ**](https://www.youtube.com/watch?v=3Yw7TfeojDQ)
* [ ] **Helm 3** is installed on your machine. For installation instructions, visit [Helm Installation Guide](https://helm.sh/docs/intro/install/).
* [ ] **AWS CLI** is installed and configured on your machine. For installation instructions, [visit AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
* [ ] You have permissions on your AWS account to create resources including **Elastic Kubernetes Service (EKS)**, **S3 Bucket**, **Aurora PostgreSQL**, and **ElastiCache.**
* [ ] You have configured an AWS **Virtual Private Cloud** (VPC) and two (2) **subnets**. For configuration, visit [AWS Create a VPC](https://docs.aws.amazon.com/vpc/latest/userguide/create-vpc.html).

## Amazon EKS Kubernetes Version Compatibility

{% hint style="info" %}
**Note:** This deployment method using Helm is only supported on Kubernetes versions till **1.28**. Steps described in the document only work if the cluster is created using the given cloud formation template.

Here we need to give the Production VPC and Private Subnets.
{% endhint %}

## AWS Resources

> **Note**: These resources will be automatically generated during the CloudFormation deployment process and are not prerequisites for initiating it.

The Cloudformation template provisions the following resources:

* S3 Bucket
* EKS Cluster
* EKS Node Pools
* Aurora PostgreSQL
* ElastiCache Redis

## **Deploy IAM Role, Aurora PostgreSQL and ElastiCache**

{% hint style="warning" %}
**Note:** Ensure you're operating within the same region as your Virtual Private Cloud (VPC).
{% endhint %}

*   [ ] Once logged in to the AWS GUI, with the search bar on your top left, search for **"CloudFormation"** and select the **CloudFormation** Service

    <figure><img src="../../../.gitbook/assets/image (176).png" alt=""><figcaption></figcaption></figure>
*   [ ] On your top right, click **"Create Stack"** and select **"With new resources (standard)"**

    <figure><img src="../../../.gitbook/assets/image (177).png" alt=""><figcaption></figcaption></figure>
* [ ] **Step 1: Create stack**
  *   On the following page (step 1 of Stack creation) select **"Template is ready"** and **"Amazon S3 URL"**. In the **"Amazon S3 URL"** textfield, enter [https://logiq-scripts.s3.ap-south-1.amazonaws.com/apicamultiset.yaml](https://logiq-scripts.s3.ap-south-1.amazonaws.com/apicamultiset.yaml)

      <figure><img src="../../../.gitbook/assets/image (178).png" alt=""><figcaption></figcaption></figure>
  * Click **"Next"**
* [ ] **Step 2: Specify stack details**
  *   [ ] Enter a stack name

      <figure><img src="../../../.gitbook/assets/image (179).png" alt=""><figcaption><p>Stack name can include letters (A–Z and a–z), numbers (0–9) and dashes (-).</p></figcaption></figure>
  * [ ] Enter an IAM role name for Logiq-EKS **(Save this value for later)**
    * _This will create the IAM role_
  * [ ] Enter an S3 bucket name **(Save this value for later)**
    * _Make sure to apply_ [_AWS Bucket Naming Rules_](https://ohttps/docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)
  * [ ] Enter a master username for Postgresql. **(Save this value for later)**
    * _Master Username can include any printable ASCII character except /, ', ", @, or a space._
  * [ ] Enter a password for the above Postgresql user. **(Save this value for later)**
    * _Master Password should be > 8 characters._
  * [ ] Enter a database name for the Postgresql database
    *   _Start with small letter_

        <figure><img src="../../../.gitbook/assets/image (180).png" alt=""><figcaption></figcaption></figure>
  * [ ] Provide a **Virtual Private Cloud (VPC) ID**
    *   You can find this by searching for **"VPC"** on the top left search bar, select the **VPC** service, click the **VPCs** resource and select your **region**. Locate your **VPC** and copy the **VPC ID**.

        <figure><img src="../../../.gitbook/assets/image (181).png" alt=""><figcaption></figcaption></figure>
  * [ ] Enter two (2) **Private** **Subnets**.
    *   From where you left of extracting your **VPC ID**, on the left hand side menu, select **Private Subnets** and copy the two **Subnet ID**s you intend you use

        <figure><img src="../../../.gitbook/assets/image (182).png" alt=""><figcaption></figcaption></figure>

        <figure><img src="../../../.gitbook/assets/image (184).png" alt=""><figcaption></figcaption></figure>
  * [ ] Click "Next"
* [ ] **Step 3: Configure stack options**
  * Nothing required here, navigate to the bottom of the page and click "Next"
* [ ] **Step 4: Review and create**
  *   You can review your configurations, acknowledge the capabilities and click "Submit"

      <figure><img src="../../../.gitbook/assets/image (185).png" alt=""><figcaption></figcaption></figure>

> Deployment might take a while. Please wait until the stack status shows **"CREATE\_COMPLETE"** before proceeding.

<figure><img src="../../../.gitbook/assets/image (186).png" alt=""><figcaption></figcaption></figure>

{% hint style="danger" %}
**If the stack for some reason would fail, make sure to check the stack events (select your stack, and click on "Events") to understand the error. In order to fix your error, delete the stack and re-do the above.**
{% endhint %}

## Create EKS Cluster

{% hint style="info" %}
**Note:** This is the second time you're creating a stack in CloudFormation. Do not mix them up.
{% endhint %}

#### Create an EKS Cluster with CloudFormation

After successfully deploying the initial CloudFormation stack, follow these steps to create an EKS Cluster:

* [ ] From the previous steps, you can click on "Stacks" or with the search bar on your top left, search for **"CloudFormation"** and select the **CloudFormation** Service
*   [ ] On your top right, click **"Create Stack"** and select **"With new resources (standard)"**

    <figure><img src="../../../.gitbook/assets/image (187).png" alt=""><figcaption></figcaption></figure>
* [ ] **Step 1: Create stack**
  *   [ ] On the following page (step 1 of Stack creation) select **"Template is ready"** and **"Amazon S3 URL"**. In the **"Amazon S3 URL"** textfield, enter [https://logiq-scripts.s3.ap-south-1.amazonaws.com/EKSCluster-multiset.yaml](https://logiq-scripts.s3.ap-south-1.amazonaws.com/EKSCluster-multiset.yaml)

      <figure><img src="../../../.gitbook/assets/image (188).png" alt=""><figcaption></figcaption></figure>
  * [ ] Click "Next"
* [ ] **Step 2: Specify stack details**
  *   [ ] Enter a stack name (Whatever you want to call the cluster)

      <figure><img src="../../../.gitbook/assets/image (189).png" alt=""><figcaption></figcaption></figure>
  * [ ] Enter a name for the EKS cluster (Save this value)
  *   [ ] Enter the ARN value of the IAM role you created in the previous CloudFormation deployment (Navigate to the previous stack and check outputs tab to find the value for the key LogiqEKSClusterRole)

      <figure><img src="../../../.gitbook/assets/image (190).png" alt=""><figcaption></figcaption></figure>

      <figure><img src="../../../.gitbook/assets/image (422).png" alt=""><figcaption></figcaption></figure>
  * [ ] Select a VPC id in the dropdown (This guide assumes you’ve created these previously)
  *   [ ] Select two VPC Private subnets with NAT GATEWAY Attatched for the above VPC from each dropdown.

      <figure><img src="../../../.gitbook/assets/image (423).png" alt=""><figcaption></figcaption></figure>
  * [ ] Enter "2" in the fields for “Ingest Worker Node count” and “Common Worker Node count”
  *   [ ] Enter the S3 bucket name you used in the previous CloudFormation deploy in “S3 bucket for Logiq”

      <figure><img src="../../../.gitbook/assets/image (424).png" alt=""><figcaption></figcaption></figure>
  * [ ] Click "Next"
* [ ] **Step 3: Configure stack options**
  * [ ] Nothing required here, navigate to the bottom of the page and click "Next"
* [ ] **Step 4: Review and create**
  *   [ ] You can review your configurations, acknowledge the capabilities and click "Submit"

      <figure><img src="../../../.gitbook/assets/image (425).png" alt=""><figcaption></figcaption></figure>

> Deployment might take a while. Please wait until the stack status shows **"CREATE\_COMPLETE"** before proceeding.

## AWS CLI commands

{% hint style="info" %}
**Note:** Once the stack is fully provisioned, authenticate AWS CLI. If you have not downloaded AWS Cli and set it up yet you can do so here: [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

FOR APICA ONLY: [https://apicasystems.atlassian.net/wiki/spaces/PS/pages/3703013481/Configure+AWS+CLI+to+use+MFA](https://apicasystems.atlassian.net/wiki/spaces/PS/pages/3703013481/Configure+AWS+CLI+to+use+MFA)
{% endhint %}

*   [ ] Open a terminal and execute the following:

    ```
    aws eks --region <AWS REGION> update-kubeconfig --name <EKS-cluster-name>
    ```

    *   [ ] Example:

        ```
        aws eks --region eu-north-1   update-kubeconfig --name apicaeksclusterdatafabric
        ```
    *   [ ] Expected output:

        ```
        Added context arn:aws:eks:eu-north-1:123123123123:cluster/apicaeksclusterdatafabric in /Users/christley/.kube/config
        ```
*   [ ] Execute the following command:

    ```
    kubectl get namespace
    ```

    *   [ ] Expected output:

        ```
        NAME              STATUS   AGE
        default           Active   25d
        kube-node-lease   Active   25d
        kube-public       Active   25d
        kube-system       Active   25d
        ```
* [ ] Download the following file:

{% embed url="https://logiq-scripts.s3.ap-south-1.amazonaws.com/gp3-sc.yaml" fullWidth="false" %}

* [ ] Change directory to where you downloaded the file with your terminal (using the command cd)
  *   [ ] Example:

      ```
      cd /Users/myUser/Downloads
      ```
*   [ ] Execute the following command:

    ```
    kubectl apply -f gp3-sc.yaml
    ```

    *   [ ] Expected output:

        ```
        storageclass.storage.k8s.io/gp3 created
        ```
*   [ ] Execute the following command:

    ```
    kubectl delete sc gp2
    ```

    *   [ ] Expected output:

        ```
        storageclass.storage.k8s.io "gp2" deleted
        ```
*   [ ] Execute the following command:

    ```
    kubectl get pods -n kube-system
    ```

    *   [ ] Expected output:

        ```
        NAME                                 READY   STATUS    RESTARTS   AGE
        aws-node-9cc6g                       2/2     Running   0          25d
        aws-node-bhv5n                       2/2     Running   0          25d
        aws-node-flrc9                       2/2     Running   0          25d
        aws-node-j88ln                       2/2     Running   0          25d
        aws-node-xl76w                       2/2     Running   0          25d
        aws-node-z96lm                       2/2     Running   0          25d
        coredns-3123sadds-bgdbg             1/1     Running   0          25d
        coredns-3123sadds -m6rww             1/1     Running   0          25d
        ebs-csi-controller-12332d32-gflvj   5/5     Running   0          18d
        ebs-csi-controller-12332d32-lztfp   5/5     Running   0          18d
        ebs-csi-node-4fpp9                   3/3     Running   0          18d
        ebs-csi-node-9mbgs                   3/3     Running   0          18d
        ebs-csi-node-fgrsj                   3/3     Running   0          18d
        ebs-csi-node-s5nqm                   3/3     Running   0          18d
        ebs-csi-node-vpbn4                   3/3     Running   0          18d
        ebs-csi-node-w9xvk                   3/3     Running   0          18d
        kube-proxy-5qnfb                     1/1     Running   0          25d
        kube-proxy-8sh24                     1/1     Running   0          25d
        kube-proxy-9pkmd                     1/1     Running   0          25d
        kube-proxy-9ppt4                     1/1     Running   0          25d
        kube-proxy-b8vx6                     1/1     Running   0          25d
        kube-proxy-kc6sd                     1/1     Running   0          25d
        ```

## Deploy Apica Ascent using HELM

*   [ ] Execute the following command:

    ```
    kubectl create namespace apica-ascent
    ```
* [ ] Download the following file

{% embed url="https://logiq-scripts.s3.ap-south-1.amazonaws.com/Prod/values.yaml" %}
values.yaml
{% endembed %}

* [ ] Open the file in a text editor and replace the following values:
  * [ ] awsServiceEndpoint:
    *   [ ] Replace `<region>` with your specific AWS region, for example `eu-north-1`. The updated URL format should look like this:

        ```yaml
        awsServiceEndpoint: https://s3.eu-north-1.amazonaws.com
        ```
  * [ ] s3\_bucket:
    *   [ ] Replace the placeholder `<>` with the actual name of the S3 bucket that was created during the initial CloudFormation deployment:

        ```yaml
        s3_bucket: "adf-helm-bucket"
        ```
  * [ ] s3\_region:
    *   [ ] Replace the AWS service endpoint region in the URL with the appropriate region, for example, `eu-north-1`:

        ```yaml
        s3_region: "eu-north-1"
        ```
  * [ ] s3\_url:
    *   [ ] Replace `<region>` with the region where you installed it. For example:

        ```yaml
        s3_url: "https://s3.eu-north-1.amazonaws.com"
        ```
  * [ ] redis\_host:
    *   [ ] Replace `<>` with your specific ElastiCacheCluster endpoint generated from the first CloudFormation deploy. For example, if your generated endpoint is `apicaelasticache.hdsue3.0001.eun1.cache.amazonaws.com`, you would update the configuration as follows:

        ```yaml
        redis_host: "apicaelasticache.hdsue3.0001.eun1.cache.amazonaws.com"
        ```

        *   [ ] You can find this value from the output tab of the first CloudFormation deploy

            <figure><img src="../../../.gitbook/assets/image (426).png" alt=""><figcaption></figcaption></figure>
  * [ ] postgres\_host:
    *   [ ] Replace `<>` with your AuroraEndpoint endpoint. For example, if your generated endpoint is `apicadatafabricenvironment-aurorapostgresql-0vqryrig2lwe.cluster-cbyqzzm9ayg8.eu-north-1.rds.amazonaws.com`, you would update the configuration as follows:

        ```yaml
        postgres_host: "apicadatafabricenvironment-aurorapostgresql-0vqryrig2lwe.cluster-cbyqzzm9ayg8.eu-north-1.rds.amazonaws.com"
        ```

        *   [ ] You can find this value from the output tab of the first CloudFormation deploy

            <figure><img src="../../../.gitbook/assets/image (427).png" alt=""><figcaption></figcaption></figure>
  * [ ] postgres\_user:
    *   [ ] Replace `<>` with the master username you created during the first CloudFormation deployment:

        ```yaml
        postgres_user: "apicauser"
        ```
  * [ ] postgres\_password:
    *   [ ] Replace `<>` with the password for the user you created during the first CloudFormation deployment:

        ```yaml
        postgres_password: "myPassword123!!"
        ```
  * [ ] s3\_access:
    *   [ ] Replace `<>` with your AWS CLI access key id.

        ```yaml
        s3_access: "myAwsAccessKeyID"
        ```

        *   [ ] To retrieve your AWS credentials from your local machine, execute the command below in your terminal:

            ```shell
            cat ~/.aws/credentials
            ```
  * [ ] AWS\_ACCESS\_KEY\_ID
    *   [ ] Replace `<>` with your AWS CLI access key id.

        ```yaml
        AWS_ACCESS_KEY_ID: "myAwsAccessKeyID"
        ```

        *   [ ] To retrieve your AWS credentials from your local machine, execute the command below in your terminal:

            ```shell
            cat ~/.aws/credentials
            ```
  * [ ] s3\_secret
    *   [ ] Replace `<>` with your AWS CLI **secret** access key id.

        ```yaml
        s3_secret: "myAwsSecretAccessKeyID"
        ```

        *   [ ] To retrieve your AWS credentials from your local machine, execute the command below in your terminal:

            ```shell
            cat ~/.aws/credentials
            ```
  * [ ] AWS\_SECRET\_ACCESS\_KEY
    *   [ ] Replace `<>` with your AWS CLI **secret** access key id.

        ```yaml
        s3_secret: "myAwsSecretAccessKeyID"
        ```

        *   [ ] To retrieve your AWS credentials from your local machine, execute the command below in your terminal:

            ```shell
            cat ~/.aws/credentials
            ```
  * [ ] Namespace
    * [ ] Search the file for "namespace" and replace `<namespace>/<namespace>-prometheus-prometheus` with the following:
      * ```
        apica-ascent/logiq-prometheus-prometheus
        ```
  *   [ ] To modify the administrator username and password, replace the existing details with your desired credentials.

      ```yaml
      admin_name: "flash-admin@foo.com"
      admin_password: "flash-password"
      admin_org: "flash-org"
      admin_email: "flash-admin@foo.com"
      ```
* [ ] Save the file
*   [ ] Execute the following command:

    ```
    helm repo add apica-repo https://logiqai.github.io/helm-charts
    ```

    *   [ ] Expected output:

        ```
        "apica-repo" has been added to your repositories
        ```
*   [ ] Ensure that the path to your `values.yaml` file is correctly set, or run the commands from the directory that contains the file. Use the following command to deploy:

    ```shell
    helm upgrade --install apica-ascent -n apica-ascent -f values.yaml apica-repo/apica-ascent
    ```

    *   [ ] Expected output:

        ```
        NAME: apica-ascent
        LAST DEPLOYED: Tue Mar 26 15:38:48 2024
        NAMESPACE: apica-ascent
        STATUS: deployed
        REVISION: 1
        TEST SUITE: None
        ```

## Access the Ascent UI

To get the default Service Endpoint, execute the below command:

```
kubectl get svc -n apica-ascent | grep LoadBalancer
```

Under the `EXTERNAL-IP` column you will find a URL similar to below:

```
NAME                        TYPE           CLUSTER-IP       EXTERNAL-IP
logiq-kubernetes-ingress     LoadBalancer <cluster_ip>    a874cbfee1cc94ea18228asd231da444-2051223870.eu-north-1.elb.amazonaws.com
```

Use this in your browser to access the Ascent UI

Login credentials is as defined in your `values.yaml` file

## Security Group Rules for EKS Cluster

As the EKS Cluster has been created, we can now set up the access rules for our VPC.

*   [ ] From the 1st stack, we need to find the `SecurityGroups` which was created

    <figure><img src="../../../.gitbook/assets/image (428).png" alt=""><figcaption></figcaption></figure>
* [ ] Navigate to either `EC2` or `VPC` by using the search bar, and then look for `Secutiry Groups` on the left hand side menu
*   [ ] Search for your security group using the `ID` extracted from the 1st stack and click on the `ID`

    <figure><img src="../../../.gitbook/assets/image (429).png" alt=""><figcaption></figcaption></figure>
*   [ ] Click on "Edit inbound rules"

    <figure><img src="../../../.gitbook/assets/image (430).png" alt=""><figcaption></figcaption></figure>
* [ ] Now we need to set up 2 rules
  * [ ] `TCP` on Port `6379` and source is your `VPC CIDR`
  *   [ ] `Postgresql (TCP)` on Port `5432` and source is your `VPC CIDR`

      <figure><img src="../../../.gitbook/assets/image (431).png" alt=""><figcaption><p>Your VPC CIDR can be found by navigating to <code>VPC</code>, select your region in the <code>VPCs</code> dropdown and on the VPC list you have a column called <code>IPv4 CIDR</code>, copy your <code>CIDR</code> and use it as a source.</p></figcaption></figure>
* [ ] Click "Save Rules"

## Enabling HTTPS on your instance (optional)

### Use auto-generated self-signed certificate

To enable https using self-signed certificates, please add additional options to helm and provide the domain name for the ingress controller.

In the example below, replace `apica.my-domain.com` with the https domain where this cluster will be available.

```
helm upgrade --install apica-ascent -n apica-ascent \
--set global.domain=apica.my-domain.com \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
-f values.yaml apica-repo/apica-ascent
```

### Use your own certificate

To customize your TLS configuration by using your own certificate, you need to create a Kubernetes secret. By default, if you do not supply your own certificates, Kubernetes will generate a self-signed certificate and create a secret for it automatically. To use your own certificates, perform the following command, replacing `myCert.crt` and `myKey.key` with the paths to your certificate and key files respectively:

```bash
kubectl create secret tls https --cert=myCert.crt --key=myKey.key
```

In order to include your own secret, please execute the below command and replace `$secretName` with your secret to enable HTTPS and replace `apica.my-domain.com` with the https domain where this cluster will be available.

```
helm upgrade --install apica-ascent -n apica-ascent \
--set global.domain=apica.my-domain.com \
--set ingress.tlsEnabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.enabled=true \
--set kubernetes-ingress.controller.defaultTLSSecret.secret=$secretName \
-f values.yaml apica-repo/apica-ascent
```
