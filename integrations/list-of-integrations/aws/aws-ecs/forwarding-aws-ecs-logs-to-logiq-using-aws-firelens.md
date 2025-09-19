# Forwarding AWS ECS logs to Apica Ascent using AWS FireLens

Amazon Web Services (AWS) Fargate is a serverless compute engine for containers that works on Amazon ECS and EKS. AWS FireLens is a log routing agent built for ECS containers and enables administrators to use task definition attributes to route logs to external log aggregators. AWS FireLens unifies data collection across the ECS cluster, and its pluggable architecture allows adding data sources, parsers, filters/buffering, and output plugins.

### Configuring AWS FireLens to forward logs <a href="#id-1-configuring-aws-firelens-to-forward-logs" id="id-1-configuring-aws-firelens-to-forward-logs"></a>

Possibly the most significant advantage of AWS FireLens is that you can connect it to almost any service endpoint as long as data sinks can process general-purpose JSON over HTTP, FluentForward, or TCP protocols. FireLens transforms log outputs of ECS containers and generates the routing configuration needed for sending logs to the logging service.&#x20;

The **`awsfirelens`** log driver allows you to specify Fluentd or Fluent Bit output plugin configurations. Your application container logs are routed to a sidecar or independent FireLens container inside your cluster, which further routes your container logs to their destination as defined in your task **`logConfiguration`**. Additionally, you can use the **`options`** field of the **`FireLensConfiguration`** object in the task definition to serve any advanced use case.

To set up log forwarding on AWS ECS, do the following.

* Navigate to the task definition that you need logs to be sent to LOGIQ from. &#x20;
* Click on **Edit container**
* Navigate to the **STORAGE AND LOGGING** section.

![](<../../../../.gitbook/assets/image (261).png>)

* By default, the container will be sending logs to AWS CloudWatch. Uncheck **Auto configure to CloudWatch Logs**
* Next, choose the Log driver as **awsfirelens**&#x20;
* Add the following variables in the **Log options** section.

![](<../../../../.gitbook/assets/image (264).png>)

* The following are the mandatory fields that need to be passed in order to forward logs to LOGIQ.

```
    Name     http
    Match    *
    Host     
    Port     443 
    URI      /v1/json_batch
    Format   json
    tls      on
    tls.verify  off
    net.keepalive  off
    compress      gzip
    Header Authorization Bearer
```

* After saving the container definition, in the **Log router integration** section, you will see that **Enable FireLens integration Type** checkbox is checked along with the image which will be used (might differ as per region).

![](<../../../../.gitbook/assets/image (318).png>)

* If you are using the **Configure via JSON** option, in the container definition section, add the following.

```
        {
            "dnsSearchDomains": null,
            "environmentFiles": null,
            "firelensConfiguration": {
                "type": "fluentbit",
		"options": {
        		"config-file-type": "s3",
			"config-file-value": "arn:aws:s3:::yourbucket/yourdirectory/extra.conf"
				}
			},
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
                    "Header Authorization Bearer": "<LOGIQ-TOKEN>",
                    "Host": "<LOGIQ-ENDPOINT>",
                    "tls": "on",
                    "URI": "/v1/json_batch",
                    "Name": "http"
                }
            }
            
```

* &#x20;You can add/remove records in extra conf file . Your extra conf file looks similar to below file .

```
[FILTER]
    Name               record_modifier
    Match              logiq
    Record cluster_id  flash

[FILTER]
    Name             record_modifier
    Match            logiq
    Record namespace  xyz

[FILTER]
    Name            record_modifier
    Match           logiq
    Record app_name system_logs
```

* Once you are done with the setup, you should see a logrouter container along with your container (for example, the **`wordpress`** the container below).

![](<../../../../.gitbook/assets/image (305).png>)

Your ECS container logs will now be forwarded to your LOGIQ instance and will be visible on the **Logs** page on the LOGIQ UI. The **Namespace** will be mapped to your ECS cluster name and the **Application** is mapped to the task definition name.&#x20;

![](<../../../../.gitbook/assets/image (1) (2).png>)

### Creating a custom Fluent Bit image to include custom parsers

If you have custom parsers that need to be included in your Fluent Bit configuration, you will need to set up a custom Fluent Bit image by doing the following.&#x20;

* Clone the following repository and navigate to the **`custom-fluent-bit-image`** folder: [https://github.com/logiqai/logiq-firelens-fluentbit](https://github.com/logiqai/logiq-firelens-fluentbit)
* Run the following command to build a new docker image with the **`fluent-logiq`** configuration

```
docker build -t logiq-config
```

* This image should now be pushed into the private Docker registry for us to be able to use it in the container later on. In order to push the image to the AWS Private registry, tag the image by running the following command

```
docker tag image-id Username.dkr.region.amazon.com/logiqconfiguration
```

* Doing this should match the repository on AWS ECR in order to push the image successfully. For more information, read [https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html)).
* Run the following command to get the Docker login credentials to AWS ECR. Use the same credentials to login.

```
aws ecr get-login
```

* Once logged in, push the image to the private ECR registry using the command:

```
docker push Username.dkr.region.amazon.com/logiqconfiguration
```

* Reference the configuration file path in the FireLens configuration, as shown below.

```
"firelensConfiguration": {
   "type": "fluentbit",
   "options": {
       "config-file-type": "file",
       "config-file-value": "/firelens.conf"
   }
}
```

This completes the setting up of a custom Fluent Bit image that includes custom parsers in the Fluent Bit configuration.&#x20;
