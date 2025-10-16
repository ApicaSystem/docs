# AWS CloudWatch

You can forward Cloud watch logs to Apica Ascent using 2 methods.

* Apica Ascent CloudWatch exporter Lambda function
* Run Logstash on VM (or docker)

## Apica Ascent CloudWatch exporter Lambda function

You can export AWS CloudWatch logs to Apica Ascent using an AWS Lambada function. The AWS Lambda function acts as a trigger for a CloudWatch log stream.

This guide explains the process for setting up an AWS Lambda function and configuring an AWS CloudWatch trigger to forward CloudWatch logs to Apica Ascent.

![](../../../.gitbook/assets/flash-high-level-cloudwatch\(1\).png)

### Creating a Lambda function

Apica Ascent provides CloudFormation templates to create the Apica Ascent CloudWatch exporter Lambda function.

Depending on the type of logs you'd like to export, use the appropriate CloudFormation template from the following list.

#### Python version dependency

{% hint style="info" %}
AWS may choose to deprecate versions of python and you may have to edit the CloudFormation YAML template to refer to the most recent version of python that is not deprecated by AWS.
{% endhint %}

#### HTTP vs HTTPS handling

{% hint style="info" %}
If your environment is configured as HTTP vs HTTPS, please make sure to edit the CloudFormation YAML file and change the connection handling function call as follows:

edit Lambda definition to use `urllib3.HTTPConnectionPool` vs `urllib3.HTTPSConnectionPool`
{% endhint %}

#### Exporting Lambda Function logs

Use the following CloudFormation template to export AWS Lambda function logs to Apica Ascent.

```
https://logiqcf.s3.amazonaws.com/cloudwatch-exporter/logiq-cloudwatch-lambda-logs-exporter.yaml
```

#### Exporting CloudTrail Logs

Use the following CloudFormation template to export CloudTrail logs to Apica Ascent.

```
https://logiqcf.s3.amazonaws.com/cloudwatch-exporter/logiq-cloudwatch-cloudtrail-exporter.yaml
```

#### Exporting AWS VPC Flowlogs

Use the following CloudFormation template to export Flowlogs logs to Apica Ascent.

```
https://logiqcf.s3.amazonaws.com/cloudwatch-exporter/logiq-cloudwatch-flowlogs-exporter.yaml
```

#### Exporting Cloudwatch logs from other services

Use the following CloudFormation template to export cloudwatch logs.

```
https://logiqcf.s3.amazonaws.com/cloudwatch-exporter/logiq-cloudwatch-exporter.yaml
```

This CloudFormation stack creates a Lambda function and its necessary permissions. You must configure the following attributes.

<table data-header-hidden><thead><tr><th width="275.3024830699774">Parameter</th><th>Description</th></tr></thead><tbody><tr><td>Parameter</td><td>Description</td></tr><tr><td><code>APPNAME</code></td><td>Application name - a readable name for Apica Ascent to partition logs.</td></tr><tr><td><code>CLUSTERID</code></td><td>Cluster ID - a readable name for Apica Ascent to partition logs.</td></tr><tr><td><code>NAMESPACE</code></td><td>Namespace - a readable name for Apica Ascent to partition logs.</td></tr><tr><td><code>LOGIQHOST</code></td><td>IP address or hostname of the Apica Ascent server. (Without http or https)</td></tr><tr><td><code>INGESTTOKEN</code></td><td>JWT token to securely ingest logs. Refer <a href="../../overview/generating-a-secure-ingest-token.md#generating-using-ui">here</a> to generate ingest token.</td></tr></tbody></table>

## Configuring the CloudWatch trigger

Once the CloudFormation stack is created, navigate to the AWS Lambda function (`logiq-cloudwatch-exporter`) and add a trigger.

![](<../../../.gitbook/assets/image (304).png>)

On the **Add trigger** page, select **CloudWatch**, and then select a CloudWatch Logs **Log Group**.

![](<../../../.gitbook/assets/image (279).png>)

Once this configuration is complete, any new logs coming to the configured CloudWatch Log group will be streamed to the Apica Ascent cluster.

### Create the Logstash VM (or Docker) <a href="#create_the_logstash_vm" id="create_the_logstash_vm"></a>

Cloudwatch logs can also be pulled using agents such as logstash. If your team is familiar and has logstash in place, follow the instructions below to configure logstash to pull logs from CloudWatch.

Install Logstash on Ubuntu virtual machine as shown below.

```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update
sudo apt-get install logstash

# Install Logstash logstash-input-cloudwatch
cd /usr/share/logstash
sudo -u root sudo -u logstash bin/logstash-plugin install  logstash-input-cloudwatch
```

#### Configure Logstash <a href="#configure_logstash" id="configure_logstash"></a>

Logstash comes with no default configuration. Create a new file `/etc/logstash/conf.d/logstash.conf` with these contents, modifying values as needed:

{% hint style="info" %}
You need to download and place the FlattenJSON.rb file in your local before you run the Logstash
{% endhint %}

{% file src="../../../.gitbook/assets/flattenJSON (1).rb" %}

```
input {
  cloudwatch_logs {
    access_key_id => "<Acess-key>"
    secret_access_key => "<secret-access-key>"
    region => "<region>"
    "log_group" => ["<Cloud-watch-log-group"]
    "log_group_prefix" => true
    codec => plain
    start_position => end
    interval => 30
  }
}

filter {
        ruby {
           path => "/home/<custom-path>/flattenJSON.rb"
           script_params => { "field" => "cloudwatch_logs" }
        }
        
	mutate {

           gsub => ["cloudwatch_logs.log_group","\/","-"]
           gsub => ["cloudwatch_logs.log_group","^-",""]
	   add_field => { "namespace" => "<custom-namespace>" }
	   add_field => { "cluster_id" => "<custom-cluster-id>" }
	   add_field => { "app_name" => "%{[cloudwatch_logs.log_group]}" }
	   add_field => { "proc_id" => "%{[cloudwatch_logs.log_stream]}" }
        }
}


output {
 http {
       url => "http://<ascent-endpoint>/v1/json_batch"
       headers => { "Authorization" => "Bearer <SECURE_INGEST_TOKEN>" }
       http_method => "post"
       format => "json_batch"
       content_type => "json_batch"
       pool_max => 2000
       pool_max_per_route => 100
       socket_timeout => 300
      }
}

```

You can obtain an ingest token from the Apica Ascent UI as described [here](../../overview/generating-a-secure-ingest-token.md#obtaining-an-ingest-token-using-ui). You can customize the `namespace` and `cluster_id` in the Logstash configuration based on your needs.

Your AWS Cloud watch logs will now be forwarded to your Apica Ascent instance. See the [Explore](../../../observe/log-management-overview/explore-logs.md) Section to view the logs.
