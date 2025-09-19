# Docker Compose

### Overview

Gathering logs from docker-compose scripts is easy to do and all it takes is for your to configure the fluentd driver to push data to Apica Ascent

Lets look at a simple compose file with a single service _"web"_

```yaml
version: '3.7'
services:
  web:
    image: wordpress
    ports:
      - "89:8080"
    logging:
      driver: "fluentd"
      options:
        fluentd-address: 192.168.68.114:24224
        labels: "namespace,application,production_status,cluster_id"
        env: "os"
    labels:
      production_status: "testing"
      namespace: "us-east-1"
      application: "wordpress"
      cluster_id: "cluster1"
    environment:
      - os=ubuntu
```

### Specifying the logging driver

The _fluentd_ logging driver can be configured to send logs directly to Apica Ascent either via TLS or non-TLS. use port _24224_ for non-TLS and port _24225_ for TLS.

```yaml
logging:
  driver: "fluentd"
  options:
    fluentd-address: 192.168.68.114:24224
    labels: "namespace,application,production_status,cluster_id"
    env: "os"
```

### Adding metadata

Logs get organized in Apica Ascent as flows. A Flow is a combination of a _Namespace_ and an _application_. You can optionally also add a third grouping attribute _cluster\_id_.

Aside from this, the labels and environment section allows additional metadata to be sent with logs and can be used for search indexing, aggregate queries

```yaml
labels:
  production_status: "testing"
  namespace: "us-east-1"
  application: "wordpress"
  cluster_id: "cluster1"
environment:
  - os=ubuntu
```

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-26 at 3.15.25 PM.png" alt=""><figcaption><p>Cluster ID, Namespace, Application mapping</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screen Shot 2023-01-26 at 3.16.30 PM.png" alt=""><figcaption><p>Additional Metadata</p></figcaption></figure>
