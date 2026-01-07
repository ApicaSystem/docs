# Fluent-bit CloudWatch Forwarder

### How to Forward logs from Apica Ascent to CloudWatch using Fluent-bit

#### 1. Introduction

This guide explains how to forward logs from Apica Ascent to Amazon Cloudwatch using the HTTP input and CloudWatch output plugins with Fluent-bit, and how to view them.

It’s possible to test the forwarder locally using LocalStack before you start sending your logs to CloudWatch

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

#### 3. Set up an input, filter and output

Update your Fluent-bit.conf with an input, (optional) filter and output.

In this example we use the [HTTP](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-http-input-plugin) input plugin, Modify filter and CloudWatch output.

```
[INPUT]
    Name    http
    Listen  0.0.0.0
    Port    4318
    Tag     ascent_logs
```

```
[FILTER]
    Name   modify
    Match  ascent_logs
    Copy    message log
```

The two following are optional for the filter:

```
    Add      namespace Fluent-bit
    Add      app_name CloudWatch
```

```
 [OUTPUT]
    Name              cloudwatch_logs
    Match             ascent_logs
    Region            us-east-1
    Log_group_name    ascent
    Log_stream_prefix logs-
    Auto_create_group on
```

If you’re testing this locally with LocalStack you should add the following to your output:

```
    Endpoint                    localhost
    Port                             4566
```

#### 4. Add your AWS credentials

If you’re testing locally you can use anything such as:

```
Environment="AWS_ACCESS_KEY_ID=test"
Environment="AWS_SECRET_ACCESS_KEY=test"
Environment="AWS_REGION=us-east-1"
```

This can be done in multiple ways:

1\.        Environment variables:\
&#x20;  a.  Run the following command on your server or run fluent-bit in shell: `sudo systemctl edit fluent-bit.service`\
&#x20;  b.  Add the following to the file:

```
Environment=”AWS_ACCESS_KEY_ID=<your-access-key-id>”
Environment=”AWS_SECRET_ACCESS_KEY=<your-secret-access-key>”
Environment=”AWS_SESSION_TOKEN=<optional-if-using-temp-credentials>”
```

&#x20;  c.  Then run the following commands:

```
export AWS_ACCESS_KEY_ID=<your-access-key-id>
export AWS_SECRET_ACCESS_KEY=<your-secret-access-key>
export AWS_SESSION_TOKEN=<optional-if-using-temp-credentials>
```

2\.        Add the following to your CloudWatch output plugin:

```
Aws_key_id        <your-access-key-id>
Aws_sec_key       <your-secret-access-key>
```

3\.        AWS shared credentials / IAM role:\
Fluent Bit can also pick up credentials from `~/.aws/credentials` or from EC2/ECS IAM role if running in AWS.

#### 5. (Optional) Test the forwarder locally

You can test the forwarder locally by running LocalStack with docker: `docker run -d --network host --name localstack localstack/localstack`

Then make sure that it’s running as healthy (you may have to wait for it to fully start): `docker ps`

If you don’t have any logs to test with you can use the dummy input plugin to send dummy logs:

```
[INPUT]
    Name   dummy
    Dummy  {"message": "custom dummy log"}
    Rate   1
    Tag    ascent_logs
```

You should see your logs with the following commands if everything is correctly set up, if you use different fluent-bit config settings from this guide you will need to run them one at a time to see which names that you need (ascent and logs-ascent\_logs should be changed in the second and third command):

{% code overflow="wrap" %}
```
aws --endpoint-url=http://localhost:4566 --region us-east-1 logs describe-log-groups
aws --endpoint-url=http://localhost:4566 --region us-east-1 logs describe-log-streams --log-group-name ascent
aws --endpoint-url=http://localhost:4566 --region us-east-1 logs get-log-events --log-group-name ascent --log-stream-name logs-ascent_logs
```
{% endcode %}

Example of when it’s failing to forward the logs:

```
{
  "logGroups": []
}
```

Example of when it’s successfully forwarding the logs:

```
{
    "logGroups": [
        {
            "logGroupName": "ascent",
            "creationTime": 1767788482207,
            "metricFilterCount": 0,
            "arn": "arn:aws:logs:us-east-1:000000000000:log-group:ascent:*",
            "storedBytes": 33841159
        }
    ]
}
```

#### 6. Add the required CloudWatch settings

You will need to add the following AWS IAM policy, you can change the resource if you want to restrict it to a specific log group:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams"
            ],
            "Resource": "*"
        }
    ]
}
```

#### 7. Set up a JavaScript code Forwarder

1\.     Log in to Apica Ascent

2\.     Navigate to Integrations → Forwarders → Forwarders

3\.     Click on Add Forwarder

4\.     Select the JavaScript code Forwarder

5\.     Edit the fields to your needs, in this example we use the following:

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

<figure><img src="../../../.gitbook/assets/image (1149).png" alt=""><figcaption></figcaption></figure>

#### 8. Set up pipelines in Apica Ascent to your needs

1\.     Log in to Apica Ascent

2\.     Navigate to Explore → Pipelines → Pipelines

3\.     Create one or multiple pipelines (you should use the stream rule if you don’t want all logs in the namespace + application to be forwarded)

4\.     Apply the pipelines to the logs that you want to forward

#### 9. Map the forwarder that you will use on your logs that you want to forward

This can be done in two ways:

1\.     This method requires pipelines.\
In the pipelines page hover over the three dots on the right on your pipeline and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

2\.     This method can be done with or without pipelines.\
Navigate to Explore → Logs & Insights

Select the logs that you want to forward, hover over the three dots on the right at the top of the list and click on Map Forwarder.\
Select your forwarder (deselect the default forwarder if you only want your new forwarder) and click on OK

#### 10. Verify that your logs arrive at the end destination

Navigate to your CloudWatch instance and locate your new logs.

If everything has been set up correctly you should see your logs.

#### 11. Troubleshooting

[Fluent-bit Troubleshooting](https://docs.apica.io/integrations/list-of-integrations/fluent-bit/fluent-bit-troubleshooting)

If logs are not being sent verify that the port is open and that the server can receive data there.

Verify that the logs are in a format that the HTTP plugin can read such as json.

If logs are not arriving in CloudWatch verify that the region your account is in is correct and that the credentials are correct

The CloudWatch plugin will not be able to read the logs unless you have at least the following filter plugin:

```
[FILTER]
    Name   modify
    Match  ascent_logs
    Copy    message log
```

If you don’t see any logs in CloudWatch please test the forwarder locally with LocalStack
