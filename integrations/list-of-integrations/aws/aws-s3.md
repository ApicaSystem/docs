# AWS S3

## <mark style="background-color:blue;">Apica Ascent S3 Import App Extension (PULL)</mark>

Apica Ascent can ingest data directly from any S3 compatible object storage. Head over to the App extensions to create an object importer app extension.

You can find App extensions under the Explore menu

Once inside the App extension menu, select AWS S3/Compatible Object store

<figure><img src="../../../.gitbook/assets/Screen Shot 2023-01-02 at 1.58.18 PM.png" alt=""><figcaption><p>AWS S3/Compatible object store</p></figcaption></figure>

Create the extension and provide the settings for accessing your object store bucket. The settings menu provides options that allow customization that is specific to vendor object store implementations.

<figure><img src="../../../.gitbook/assets/Screen Shot 2023-01-02 at 1.58.53 PM.png" alt=""><figcaption><p>Configuring access to the bucket</p></figcaption></figure>

And that is all you need. You data from the Object store bucket will show up as a flow in the Apica Ascent platform

<figure><img src="../../../.gitbook/assets/Screen Shot 2023-01-02 at 2.05.18 PM.png" alt=""><figcaption><p>Viewing the object store data import in "Explore" as a Flow</p></figcaption></figure>

## <mark style="background-color:blue;">Apica Ascent S3 exporter Lambda function (PUSH)</mark>

![](../../../.gitbook/assets/flash-high-level-s3.png)

### Creating a Lambda function

Apica Ascent provides a CloudFormation template to create the Apica Ascent S3 exporter Lambda function.

```
https://logiqcf.s3.amazonaws.com/s3-exporter/cf.yaml
```

{% hint style="info" %}
You can also download the CloudFormation template from our [client-integrations](https://bitbucket.org/logiqcloud/client-integrations/src/master/cloudwatch-exporter/) GitHub repository.
{% endhint %}

This CloudFormation stack creates a Lambda function and its necessary permissions. You must configure the following attributes.

| Parameter     | Description                                                                                                                                       |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `APPNAME`     | Application name - a readable name for Apica Ascent to partition logs.                                                                            |
| `CLUSTERID`   | Cluster ID - a readable name for Apica Ascent to partition logs.                                                                                  |
| `NAMESPACE`   | Namespace - a readable name for Apica Ascent to partition logs.                                                                                   |
| `LOGIQHOST`   | IP address or hostname of the Apica Ascent server.                                                                                                |
| `INGESTTOKEN` | JWT token to securely ingest logs. Refer [here](../../overview/generating-a-secure-ingest-token.md#generating-using-ui) to generate ingest token. |

## Configuring S3 trigger

Once the CloudFormation stack is created, navigate to the AWS Lambda function (`logiq-s3-logs-exporter`) and add a S3 trigger.

![](<../../../.gitbook/assets/Screenshot 2021-11-09 at 21-47-48 logiq-s3-logs-exporter - Lambda.png>)

On the **Add trigger** page, select **S3**. Next, select the **Bucket** you'd like to forward logs from and add a **Prefix**.

![](<../../../.gitbook/assets/Screenshot 2021-11-09 at 21-46-40 Lambda.png>)

Once this configuration is complete, any new log files in the S3 bucket will be streamed to the Apica Ascent cluster.
