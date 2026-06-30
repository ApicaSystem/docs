# Fluent-bit AWS S3 Forwarder

### How to Forward logs from Apica Ascent to AWS S3 using Fluent-bit

#### 1. Introduction

This guide explains how to forward logs from Apica Ascent to AWS S3 using the **s3** output plugin with Fluent-bit, and how to view them.

This guide assumes that you have Python3 or higher, pip and aws-mfa installed if you authenticate with AWS CLI.

This plugin requires the following permissions in AWS IAM:

```
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": [
      "s3:PutObject"
    ],
    "Resource": "*"
  }]
}
```

#### 2. Do any required port forwarding

The process will be different for each company, provider and OS.

If you manage your firewall at your provider level you will need to allow traffic on the desired port there and possibly on the server itself.

If you manage the firewall on the server level you should make the changes there, the methods will be different depending on your OS.

In our example we used port 4318.

Add a new inbound rule:

```
Type: TCP
Port Range: 4318
Source: 0.0.0.0/0
```

#### 3. Set up an input and output

Update your Fluent-bit.conf with an input and output.

In this example we use the [HTTP](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-http-input-plugin) input plugin and the **s3** output.

```
[INPUT]
    Name    http
    Listen  0.0.0.0
    Port    4318
    Tag     ascent_logs
```

```
[OUTPUT]
    Name            s3
    Match           ascent_logs
    bucket          <BUCKET NAME>
    region          eu-north-1
    store_dir       /etc/fluent-bit/s3
    use_put_object  On
    total_file_size 1MB
    upload_timeout  1s
```

The **total\_file\_size** and **upload\_timeout** values above are low for testing, they may need to be higher in actual usage or not used at all.

If you want to specify the storage path in S3 you should use `s3_key_format /path/name`, the default path is `/fluent-bit-logs/$TAG/%Y/%m/%d/%H/%M/%S`

#### 4. Set up a S3 authorization

To forward your logs to your S3 you will need to add a way to authenticate on your machine, this can be done with either environment variables or the AWS config file.

Environment variables:

Add your key and secret to the commands below and paste them into the terminal on your machine.

```
export AWS_ACCESS_KEY_ID=<KEY>
export AWS_SECRET_ACCESS_KEY=<SECRET>
```

AWS config file:

1\. Run `aws configure` in a terminal and provide the configs it’s asking for

2\. Run `nano .aws/credentials` in a terminal on the machine or a way other than nano to edit the file

3\. Add or replace existing data if needed with:

```
[default-long-term]
aws_access_key_id = <KEY>
aws_secret_access_key = <SECRET>
aws_mfa_device = arn:aws:iam::<MFA DEVICE>
 
[default]
```

4\. Save the file

5\. Run `aws-mfa` if you don’t use a role or `aws-mfa --assume-role=AssumedRoleArn --device YourMFADeviceArn` if you use one

6\. Enter the code from your authenticator app to verify

#### 5. Set up a JavaScript code Forwarder

1\. Log in to Apica Ascent

2\. Navigate to **Integrations → Forwarders → Forwarders**

3\. Click on Add Forwarder

4\. Select the JavaScript code Forwarder

5\. Edit the fields to your needs, in this example we use the following:

```
let cfg = {
    method: "POST",
    headers: {
        "Content-Type": "application/json"
    },
    body: JSON.stringify(Events),
};
 
let ret = fetchSync("http://<serverIP>:4318/", cfg);
console.log("Response from the endpoint:", ret);
```

<figure><img src="../../../.gitbook/assets/image (1147).png" alt=""><figcaption></figcaption></figure>

#### 6. Set up pipelines in Apica Ascent to your needs

1\. Log in to Apica Ascent

2\. Navigate to **Explore → Pipelines → Pipelines**

3\. Create one or multiple pipelines (you should use the stream rule if you don’t want all logs in the namespace + application to be forwarded)

4\. Apply the pipelines to the logs that you want to forward

#### 7. Map the forwarder that you will use on your logs that you want to forward

This can be done in two ways:

1\. This method requires pipelines.\
In the pipelines page hover over the three dots on the right on your pipeline and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

2\. This method can be done with or without pipelines.\
Navigate to **Explore → Logs & Insights**

Select the logs that you want to forward, hover over the three dots on the right at the top of the list and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

#### 8. Verify that your logs arrive at the end destination

1\. Navigate to your S3 bucket

2\. If the fluent-bit-logs folder or the folder you specified is present the logs were successfully forwarded

3\. Open the folders to the last one to see your logs

<figure><img src="../../../.gitbook/assets/image (1251).png" alt=""><figcaption></figcaption></figure>

#### 9. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not being sent verify that the port is open and that the server can receive data there.

Verify that the logs are in a format that the HTTP plugin can read such as json.

You can set `total_file_size 1MB`, `upload_timeout 1s` and use the dummy input plugin to test if you’re able to send the logs
