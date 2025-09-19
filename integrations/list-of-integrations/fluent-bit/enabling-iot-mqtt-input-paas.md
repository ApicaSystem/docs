# Enabling IoT(MQTT) Input (PAAS)

MQTT is an OASIS standard messaging protocol for the Internet of Things (IoT). It is designed as an extremely lightweight publish/subscribe messaging transport that is ideal for connecting remote devices with a small code footprint and minimal network bandwidth. MQTT today is used in a wide variety of industries, such as automotive, manufacturing, telecommunications, oil and gas, etc.

### Running the fluent-bit deployment on Apica Ascent cluster

* Clone the repository to get the **`kubectl`** YAML files to start your deployment

```
git clone https://bitbucket.org/logiqcloud/client-integrations.git
```

* The files needed are under folder **`fluent-bit`**

```
cd client-integrations/
cd fluentd-bit-mqtt/
ls -la
total 20
-rw-rw-r-- 1 sandesh docker  2030 Mar 29 15:51 fluent-bit-deployment.yaml
-rw-rw-r-- 1 sandesh sandesh 8773 Mar 29 15:55 fluent-bit-config-logiq-forward.yml
-rw-rw-r-- 1 sandesh sandesh 2469 Mar 29 15:59 README.md
```

#### Fluent Bit to Apica Ascent

The below steps outline on how to create a ConfigMap that will be used by the Fluent Bit Deployment:

```
kubectl create -f fluent-bit-config-logiq-forward.yml
```

Fluent Bit deployment is ready to be used with Apica Ascent on a regular Kubernetes Cluster, configure the following in deployment `fluent-bit-ddeployment.yml`. If you do not have your ingest token, You can generate them using [`apicactl`](https://docs.logiq.ai/logiq-server/agentless/generating-secure-ingest-token)

*   name: CLUSTER\_ID

    value: "YOUR\_CLUSTER\_ID"
*   name: LOGIQ\_TOKEN

    value: "YOUR\_INGEST\_TOKEN"

```
kubectl create -f fluent-bit-deployment.yml
```
