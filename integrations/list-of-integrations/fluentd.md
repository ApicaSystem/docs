# Fluentd

## Fluentd configuration

Fluentd `out-forward` Buffered Output plugin forwards events to other fluentd nodes. Apica Ascent has the capability to act as one of the fluentd nodes.

The below code block defines the minimal changes to be added to fluentd configuration to start sending log events to flash. It is important to have the transformations while sending the data to Apica Ascent.

```
<source>
  @type tail
  path /var/log/*.log
  pos_file /var/log/tty.txt.pos
  <parse>
    @type none
  </parse>
</source>


<filter>
  @type record_transformer
  enable_ruby
  <record>
    hostname "#{Socket.gethostname}"
    namespace "#{Socket.gethostname}"
    cluster_id "hadoop-master"
    log ${record["message"]}
  </record>
</filter>



<match>
  @type forward
  send_timeout 10s
  recover_wait 10s
  hard_timeout 20s


<format>
  @type msgpack
  time_type unixtime
  utc
 </format>
  <buffer time,tag,message>
    @type memory
    timekey 2s
    timekey_wait 1s
    flush_mode interval
    flush_interval 1s
    retry_max_interval 2s
    retry_timeout 10s
  </buffer>


  <server>
    name logiq
    host development.logiq.ai
    port 24224
    weight 100
  </server>

   <secondary>
    @type secondary_file
    directory /var/log/forward-failed
  </secondary>
</match>
```

## Fluentd K8S

If you are running a K8S cluster, you can use fluentd to send data to the Apica AscentApica Ascent server. Please see below for instructions

### Managing multiple K8S clusters in a single Apica Ascent instance

When deploying fluentd daemonset on K8S clusters, we recommend you use the fluentd daemon set container provided by Apica Ascent. It is available at [https://hub.docker.com/repository/docker/logiqai/fluentd-remote-syslog](https://hub.docker.com/repository/docker/logiqai/fluentd-remote-syslog). It allows the administrator to pass a human readable `CLUSTER_ID` or cluster identifier with all the log data.

{% hint style="success" %}
Providing a CLUSTER\_ID allows Apica Ascent to separate namespaces that may be conflicting in two separate K8S clusters.

It is also easier for the administrator to use human readable names vs Apica Ascent using uuid's etc that it detects from the incoming stream.
{% endhint %}

### Running the fluentd daemonset

* Clone the repository to get the **`kubectl`** YAML files to start your daemonset

```
git clone https://bitbucket.org/logiqcloud/client-integrations.git
```

* The files needed are under folder **`fluentd`**

```
$ cd client-integrations/
$ cd fluentd/
$ ls -la
total 32
drwxr-xr-x  6 user  staff   192 Oct 30 14:47 .
drwxr-xr-x  7 user  staff   224 Oct 30 14:47 ..
-rw-r--r--  1 user  staff   645 Oct 30 14:47 README.md
-rw-r--r--  1 user  staff  1373 Oct 30 14:47 fluentd-logiq.yaml
-rw-r--r--  1 user  staff  1373 Oct 30 14:47 fluentd-logiq_non_tls.yaml
-rw-r--r--  1 user  staff   590 Oct 30 14:47 fluentd_rbac.yaml
-rw-r--r--  1 user  staff   210 Oct 30 14:47 secret.yaml
```

### **TLS Mode**

Edit the **`fluentd/secret.yaml`** to include your CA and Client pub/private keys in base64 encoded format

Edit the **`fluentd/fluentd-logiq.yaml`** and add your Apica Ascent cluster IP/DNS. Also configure your `CLUSTER_ID` (e.g. RC, Prod, Dev-Test, QA).

```
....
  - env:
        - name: SYSLOG_HOST
          value: "YOUR_LOGIQ_SERVER_IP"
        - name: CLUSTER_ID
          value: "YOUR_CLUSTER_ID"          
....
```

Run the **`kubectl`** commands to create the **`kube-logging`** namespace. You can choose a different namespace as well. In case a different namespace is used please edit the YAML files to set the correct namespace before applying them

```
kubectl create namespace kube-logging
kubectl apply -f fluentd_rbac.yaml
kubectl apply -f secret.yaml
kubectl apply -f fluentd-logiq.yaml
```

### Non-TLS Mode

Edit the\*\*`fluentd/fluentd-logiq_non_tls.yaml`\*\*and add your Apica Ascent cluster IP/DNS. Also configure your `CLUSTER_ID` (e.g. RC, Prod, Dev-Test, QA)

```
....
  - env:
        - name: SYSLOG_HOST
          value: "YOUR_LOGIQ_SERVER_IP"
        - name: CLUSTER_ID
          value: "YOUR_CLUSTER_ID"          
....
```

Run the **`kubectl`** commands to create the **`kube-logging`** namespace. You can choose a different namespace as well. In case a different namespace is used please edit the YAML files to set the correct namespace before applying them

```
kubectl create namespace kube-logging
kubectl apply -f fluentd_rbac.yaml
kubectl apply -f fluentd-logiq_non_tls.yaml
```
