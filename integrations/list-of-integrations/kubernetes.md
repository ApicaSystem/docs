# Kubernetes

## Fluent Bit K8S

If you are running a K8S cluster, you can use fluent-bit to send data to Ascent. Please see below for instructions,

### Managing multiple K8S clusters in a single Apica Ascent instance

Ascent has provided its own fluent-bit daemon for deploying on K8S clusters. It is available at [https://bitbucket.org/logiqcloud/client-integrations/src/master/fluent-bit/](https://bitbucket.org/logiqcloud/client-integrations/src/master/fluent-bit/). It allows the administrator to pass a human-readable `CLUSTER_ID` or cluster identifier with all the log data.

{% hint style="success" %}
Providing a CLUSTER\_ID allows Apica Ascent to separate namespaces that may be conflicting in two separate K8S clusters.
{% endhint %}

### Running the fluent-bit daemonset

* Clone the repository to get the **`kubectl`** YAML files to start your daemonset

```
git clone https://bitbucket.org/logiqcloud/client-integrations.git
```

* The files needed are under the folder **`fluent-bit`**

```
$ cd client-integrations/
$ cd fluentd-bit/
$ ls -la
total 64
drwxr-xr-x  8 user  staff   256 Aug  9 05:47 .
drwxr-xr-x  9 user  staff   288 Aug  9 05:20 ..
-rw-r--r--  1 user  staff  2446 Aug  9 05:47 README.md
-rw-r--r--  1 user  staff  8688 Aug  9 05:32 fluent-bit-config-apica-forward.yml
-rw-r--r--  1 user  staff  1670 Aug  9 05:29 fluent-bit-daemonset-apica-output.yml
-rw-r--r--  1 user  staff   269 Aug  9 05:26 fluent-bit-role-binding.yaml
-rw-r--r--  1 user  staff   194 Aug  9 04:49 fluent-bit-role.yaml
-rw-r--r--  1 user  staff    86 Aug  9 05:25 fluent-bit-service-account.yaml
```

To get started run the following commands to create the namespace, service account and role setup:

```bash
$ kubectl create namespace ascent-logging
$ kubectl create -f fluent-bit-service-account.yaml
$ kubectl create -f fluent-bit-role-binding.yaml
$ kubectl create -f fluent-bit-role.yaml
```

#### Fluent Bit to Ascent

The next step is to create a ConfigMap that will be used by the Fluent Bit DaemonSet:

```
$ kubectl create -f fluent-bit-config-apica-forward.yml
```

#### Enabling TLS

You can enable TLS for Fluent Bit if you'd like to secure the data transferred through Fluent Bit to Apica Ascent. To do so, edit the `fluent-bit-config-apica-forward.yaml` file as shown below.

```
output-ascent.conf: |
    [OUTPUT]
        Name          http
        Match         *
        Host          ${ASCENT_HOST}
        Port          ${ASCENT_PORT}
        URI           /v1/json_batch
        Format        json
        tls           on
        tls.verify    off
        net.keepalive off
        compress      gzip
        Header Authorization Bearer ${ASCENT_TOKEN}
```

Be sure to also configure the following:

* name: ASCENT\_HOST value: "YOUR\_ASCENT\_SERVER\_IP"
* name: ASCENT\_PORT value: "443"
* name: CLUSTER\_ID value: "YOUR\_CLUSTER\_ID"
* name: ASCENT\_TOKEN value: "YOUR\_INGEST\_TOKEN"

Fluent Bit DaemonSet is ready to be used with Apica Ascent on a regular Kubernetes Cluster, configure the following in deamonset `fluent-bit-daemonset-apica-output.yml`.  If you do not have your ingest token, you can generate them using [`apicactl`](../overview/generating-a-secure-ingest-token.md) .

*   name: ASCENT\_HOST

    value: "YOUR\_ASCENT\_SERVER\_IP"
*   name: CLUSTER\_ID

    value: "YOUR\_CLUSTER\_ID"
*   name: ASCENT\_TOKEN

    value: "YOUR\_INGEST\_TOKEN"

For Kubernetes version < 1.17, please change the apiVersion: "extensions/v1beta1" from "apps/v1" and remove selector attached to DaemonSet spec selector: matchLabels: k8s-app: fluent-bit-logging

```
kubectl create -f fluent-bit-daemonset-apica-output.yml
```
