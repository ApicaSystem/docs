# ECS prometheus metrics to Apica Ascent

**AWS ECS** is an orchestration service for Docker containers, allowing you to easily manage and scale your applications with easy access to other AWS services, the below instructions outline how we can forward ECS container metrics to Logiq endpoint with help of Prometheus service discovery with the following steps.

* Create IAM policy to enable Prometheus container to scan the cluster with container having Dockerlabels.
* Deploy a Prometheus service that would auto-discover any ECS tasks it finds in the same VPC using AWS API (_prometheus-ecs-discovery_ [GitHub repository](https://github.com/teralytics/prometheus-ecs-discovery.git).)
* Tag ECS tasks with DockerLabels.



### **IAM policy for the ECS task**

Create the below policy and attach it to the IAM role that the Prometheus ECS task will use to run the container, this will allow the container to scan the ECS-cluster containers and generate the config file, it also enables Prometheus to read from S3 bucket to fetch Prometheus.yml

```
{
    "Statement": [
        {
            "Action": [
                "ecs:List*",
                "ecs:Describe*"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:ecs:<region>:<account-id>:cluster/<ecs-cluster-name>",
                "arn:aws:ecs:<region>:<account-id>:task/<ecs-cluster-name>/*"
            ]
        },
        {
            "Action": [
                "ecs:ListClusters",
                "ecs:ListTasks",
                "ecs:DescribeTasks",
                "ecs:DescribeTaskDefinition",
                "ecs:DescribeContainerInstances"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::<s3-bucket-name>",
                "arn:aws:s3:::<s3-bucket-name>/*"
            ]
        }
    ],
    "Version": "2012-10-17"
}
```



### **Prometheus containers**

ECS task definition will have one task with 2 containers and common volume. Primary container will scan the ECS-cluster and find containers with labels  **PROMETHEUS\_EXPORTER\_PORT** docker label and write to /output/ecsfilesd.yml which will be accessed by second container, second prometheus container will load its configuration data from an S3 bucket upon startup and it also  scrapes any ECS containers container within the _/output/ecs\_file\_sd.yml_ and will use remote write feature to forward metrics to Logiq remote-write endpoint.

{% hint style="info" %}
The configuration also includes firelens integration(Log\_router container) to forward logs to Logiq.
{% endhint %}

```
{
    "ipcMode": null,
    "executionRoleArn": <IAM ECS task execution role ARN>,
    "containerDefinitions": [
        {
            "dnsSearchDomains": null,
            "environmentFiles": null,
            "logConfiguration": {
                "logDriver": "awsfirelens",
                "secretOptions": null,
                "options": {
                    "tls.verify": "off",
                    "net.keepalive": "off",
                    "Format": "json",
                    "compress": "gzip",
                    "Port": "443",
                    "match": "*",
                    "Header Authorization Bearer": "<Bearer-token>",
                    "Host": "<Logiq-endpoint>",
                    "tls": "on",
                    "URI": "/v1/json_batch",
                    "Name": "http"
                }
            },
            "entryPoint": null,
            "portMappings": [],
            "command": [
                "-config.cluster=<ECS-cluster-name>",
                "-config.write-to=/output/ecs_file_sd.yml"
            ],
            "mountPoints": [
                {
                    "readOnly": null,
                    "containerPath": "/output",
                    "sourceVolume": "ecs-discovery"
                }
            ],
            "image": "logiqai/ecs-logiq-prometheus:v1",
            "name": "prometheus-discover-config"
        },
        {
            "logConfiguration": {
                "logDriver": "awsfirelens",
                "secretOptions": null,
                "options": {
                    "tls.verify": "off",
                    "net.keepalive": "off",
                    "Format": "json",
                    "compress": "gzip",
                    "Port": "443",
                    "match": "*",
                    "Header Authorization Bearer": "<Auth-token>",
                    "Host": "<logiq-endpoint",
                    "tls": "on",
                    "URI": "/v1/json_batch",
                    "Name": "http"
                }
            },
            "environment": [
                {
                    "name": "S3_CONFIG_LOCATION",
                    "value": "s3://<BUCKET-NAME>/prometheus.yml"
                }
            ],
            "mountPoints": [
                {
                    "readOnly": null,
                    "containerPath": "/output",
                    "sourceVolume": "ecs-discovery"
                }
            ],
            "image": "logiqai/ecs-prometheus-s3:v1",
            "name": "prometheus"
        },
        {
     
            "image": "906394416424.dkr.ecr.us-east-1.amazonaws.com/aws-for-fluent-bit:latest",
            "startTimeout": null,
            "firelensConfiguration": {
                "type": "fluentbit",
                "options": null
            },
            "name": "log_router"
        }
    ],
    "memory": "1024",
    "taskRoleArn": "<IAM ECS task execution role ARN>",
    "family": "ecs-prome",
    "pidMode": null,
    "requiresCompatibilities": [
        "FARGATE"
    ],
    "networkMode": "awsvpc",
    "runtimePlatform": {
        "operatingSystemFamily": "LINUX",
        "cpuArchitecture": null
    },
    "volumes": [
        {
            "fsxWindowsFileServerVolumeConfiguration": null,
            "efsVolumeConfiguration": null,
            "name": "ecs-discovery",
            "host": {
                "sourcePath": null
            },
            "dockerVolumeConfiguration": null
        }
    ]
}
```



Upload the below configuration file below named as prometheus.yml to S3 bucket and provide the Logiq-remote-write-endpoint  below.

```
global:
  evaluation_interval: 1m
  scrape_interval: 30s
  scrape_timeout: 10s
remote_write:
  - url: http://<logiq-remote-write-endpoint>:19291/v1/receive/prometheus 
scrape_configs:
  - job_name: ecs
    file_sd_configs:
      - files: 
          - '/output/ecs_file_sd.yml'
```

For any container to be scraped, add Dockerlabels below on  ECS task with the metrics path and endpoint.

![](<../../../../.gitbook/assets/image (237).png>)

