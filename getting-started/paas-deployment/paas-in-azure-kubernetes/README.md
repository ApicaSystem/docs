# Deploying Apica Ascent PaaS in Azure Kubernetes Service

The following guide takes you through deploying Apica Ascent PaaS in an Azure Kubernetes Service cluster. The deployment involves the following steps:

* [<mark style="color:blue;">Creating an Azure Kubernetes Service cluster</mark>](./#creating-an-azure-kubernetes-cluster)
* [<mark style="color:blue;">Configuring the node pool</mark>](./#configuring-the-node-pool)
* [<mark style="color:blue;">Connecting to the cluster</mark>](./#connecting-with-your-aks-cluster)
* [<mark style="color:blue;">Creating the MinIO blob storage gateway</mark>](./#creating-the-minio-blob-storage-gateway-for-s3-compatibility)
* [Deploying Apica Ascent PaaS](./#deploying-apica-ascent-paas)

{% hint style="warning" %}
If you have an AKS cluster that is appropriately sized for deploying Apica Ascent and handling your data ingestion rate, you can skip the AKS cluster creation step. However, you must label the nodes as specified in the [<mark style="color:blue;">Node pool configuration</mark>](./#node-pool-configuration) table failing which the pods in the cluster will not land in any of the nodes.
{% endhint %}

## Creating an Azure Kubernetes Cluster

Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/).

Connect to your Azure account using Azure CLI by running the following command.

```
az login --tenant “tenant-id”
```

Create a resource group by running the following command.

```
az group create --name <Resource group name> --location <location>
```

## Configuring the node pool

Create four node pools as described and labelled in the following table. The table describes the node pool configuration for ingesting 100 GB of data per day.

{% hint style="warning" %}
**Important:** Ensure that the node pools are all created in the **same availability zone**.
{% endhint %}

| **Size**                   | **Node pool**          | **Node labels**      | **Node count** |
| -------------------------- | ---------------------- | -------------------- | -------------- |
| 8 Core 16 GB RAM (F8s\_v2) | ingest (CPU intensive) | logiq.ai/node=ingest | 1              |
| 8 Core 16 GB RAM (F8s\_v2) | common                 | logiq.ai/node=common | 1              |
| 4 Core 8 GB RAM (F4s\_v2)  | db                     | logiq.ai/node=db     | 1              |
| 4 Core 8 GB RAM (F4s\_v2)  | hauler                 | logiq.ai/node=hauler | 1              |

Execute the following commands to create the AKS cluster along with the node pools described above.

```
az aks create --kubernetes-version 1.19.11 -g <your resource group> --name <cluster name> -l <location> --node-vm-size Standard_f8s_v2 --zones 1 --nodepool-name ingest --nodepool-labels logiq.ai/node=ingest --node-count 1 --enable-ultra-ssd

az aks nodepool add --cluster-name <cluster name> --name common --resource-group <You resource group> --zones 1 --labels logiq.ai/node=common --node-vm-size standard_f8s_v2 --node-count 1 --enable-ultra-ssd

az aks nodepool add --cluster-name <cluster name> --name db --resource-group <You resource group> --zones 1 --labels logiq.ai/node=db --node-vm-size standard_f4s_v2 --node-count 1 --enable-ultra-ssd

az aks nodepool add --cluster-name <cluster name> --name hauler --resource-group <You resource group> --zones 1 --labels logiq.ai/node=hauler --node-vm-size standard_f4s_v2 --node-count 1 --enable-ultra-ssd
```

The following code block depicts example commands for creating the AKS cluster with the node pool specification provided in the table above.

```
az aks create -g azure-test --name logiqai -l eastus --node-vm-size Standard_f8s_v2 --zones 1 --nodepool-name ingest --node-count 1 --nodepool-labels logiq.ai/node=ingest --enable-ultra-ssd

az aks nodepool add --cluster-name logiqai --name common --resource-group azure-test --zones 1 --labels logiq.ai/node=common --node-vm-size standard_f8s_v2 --node-count 1 --enable-ultra-ssd

az aks nodepool add --cluster-name logiqai --name hauler --resource-group azure-test --zones 1 --labels logiq.ai/node=hauler --node-vm-size standard_f4s_v2 --node-count 1 --enable-ultra-ssd

az aks nodepool add --cluster-name logiqai --name db --resource-group azure-test --zones 1 --labels logiq.ai/node=db --node-vm-size standard_f4s_v2 --node-count 1 --enable-ultra-ssd
```

![](<../../../.gitbook/assets/image (218).png>)

## Connecting with your AKS cluster

Connect to the AKS cluster by first visiting the Azure portal, navigating to the AKS cluster you created, and selecting it. Next, click on the **Connect** icon and follow the instructions displayed on the right panel. Execute the following command and you should see the nodes in your cluster.

```
kubectl get node
```

## Creating the MinIO blob storage gateway for S3 compatibility

Follow the instructions on [MinIO’s site](https://az.minio.io/index.html#deploy-minio-6) to create an Azure blob storage account. Once you login, click the “**+**” button on the right hand corner of the screen to create a bucket named `logiq`. Note down this bucket name since we'd be using it in later steps.

Create an [Azure ultra disk](https://azure.microsoft.com/en-us/services/storage/blobs/) storage class using the YAML configuration provided below.

```
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
name: ultra-disk-sc
provisioner: kubernetes.io/azure-disk
volumeBindingMode: WaitForFirstConsumer # optional, but recommended if you want to wait until the pod that will use this disk is created
parameters:
skuname: UltraSSD_LRS
cachingMode: None
kind: managed
diskIopsReadWrite: "3000" # minimum value: 2 IOPS/GiB
diskMbpsReadWrite: "125" # minimum value: 0.032/GiB
```

Verify that the storage class has been created by running the following command.

```
kubectl get sc ultra-disk-sc
```

## Deploying Apica Ascent PaaS

Download the `values.yaml` file from [this location](https://logiq-scripts.s3.ap-south-1.amazonaws.com/values.yaml) and replace the following variables in the file.

```
awsServiceEndpoint: https://<your-blobstorage-accountname>.az.minio.io
s3_bucket with the minio bucketname created at step 5.
AWS_ACCESS_KEY_ID: minio service name
AWS_SECRET_ACCESS_KEY: access key from the mino.
storageClass: ultra-disk-sc
creatStorageClass: true
```

Next, follow the instructions on Apica Ascent’s [Quickstart guide](https://docs.logiq.ai/deploying-logiq/k8s-quickstart-guide) to spin up the Apica Ascent stack on this AKS cluster.

Once you've successfully deployed Apica Ascent, you can (optionally) disable monitoring AKS with container insights on your cluster by running the following command.

```
az aks disable-addons -a monitoring -n <aks cluster name> -g <resource group>
```
