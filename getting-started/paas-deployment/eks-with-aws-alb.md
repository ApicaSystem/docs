---
hidden: true
---

# Deploying Apica Ascent EKS with AWS ALB

### Prerequisites

You have a working EKS cluster with the ALB ingress controller for deploying Apica Ascent. Please refer to the section on <mark style="color:blue;">enabling AWS ALB ingress controller</mark> in the PaaS Deployment document for more details.

### Configure you values.yaml to use NodePort services

```
logiq-flash.service.type: NodePort
flash-coffee.service.type: NodePort
kubernetes-ingress.ingress.controller.service.type: NodePort
thanos.service.type: NodePort
```

You can now deploy the Apica Ascent Helm chart. AWS ALB should get provisioned and you should be able to see the UI and push data using http/https ingest. Most agents such as fluent-bit, vector, logstash provide http output support. Please refer to the section on [Integrations](https://github.com/logiqai/docs/blob/master/deploying-logiq/logiq-paas-deployment/broken-reference/README.md) on how to configure them to publish data to Apica Ascent endpoint.

{% hint style="info" %}
Chart version 3.0.5 or greater is required for ALB provisioning support
{% endhint %}

### Additional considerations

#### Using the Global Accelerator

If you have deployed the Apica Ascent on private subnet, you may need to map global accelerator (under Integrated services) to access the public endpoints and DNS on top of it.

![](<../../.gitbook/assets/image (316).png>)

#### Using https

By default the ALB will be configured to used port 80

![](<../../.gitbook/assets/image (336).png>)

If you want to route traffic on https(port:443), ensure your listener rules are configured on port 443. As a prerequisite, your global accelerator should have all the certificates configured for this to work. Please refer to the AWS documentation on <mark style="color:blue;">how to configure HTTPS -</mark> [<mark style="color:blue;">https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html</mark>](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html)

![](<../../.gitbook/assets/image (296).png>)
