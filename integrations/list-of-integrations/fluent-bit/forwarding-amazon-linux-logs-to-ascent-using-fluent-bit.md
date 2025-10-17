# Forwarding Amazon-Linux logs to Apica Ascent using Fluent Bit

This guide takes you through how you can set up log forwarding from Linux systems hosted on AWS to Apica Ascent using Fluent Bit. The guide leverages an installation script which you can download from our GitHub repository.

Before you proceed with this setup, be sure to download the `install.sh` and `td-agent-bit.sh` scripts located here:

{% embed url="https://github.com/logiqai/logiq-installation/tree/main/fluent-bit/linux/amazon-linux" %}

The `install.sh` script carries out the following functions:

* Installs Node Exporter, which exposes various metrics from your Linux machine (CPU, RAM usage)

The `td-agent-bit.sh` script carries out the following functions:

* Installs Fluent Bit on your Amazon-Linux systems which is used for forwarding logs to Apica Ascent.

### Installing Fluent Bit

In order to install Fluent Bit to forward Linux logs, do the following:

1. Download the `td-agent-bit.sh` script from the repository shared above.
2. Make the script executable by running the following command.

```
chmod +x td-agent-bit.sh
```

1. Set the cluster details

```
export LOGIQ="example.logiq.ai"
export MY_TOKEN=<Your Token>
```

1. Execute the script by running either of the following commands.

```
HTTP endpoint:
sudo -E ./td-agent-bit.sh "http"

HTTPS endpoint:
sudo -E ./td-agent-bit.sh "https"

or
HTTP endpoint:
sudo bash td-agent-bit.sh "http"

HTTPS endpoint:
sudo bash td-agent-bit.sh "https"
```

The script executes and carries out the following:

* Installs Fluent Bit
* Checks your OS versions and updates your sources list, as mentioned in the [Fluent Bit documentation](https://docs.fluentbit.io/manual/installation/linux/ubuntu#update-your-sources-lists).
*   Configures Rsyslog to add `omfwd`, as shown below.

    ```
    *.* action(type="omfwd"
             queue.type="LinkedList"
             action.resumeRetryCount="-1"
             queue.size="10000"
             queue.saveonshutdown="on"
             target="127.0.0.1" Port="5140" Protocol="tcp"
             )
    ```

The script also places the `td-agent-bit.conf` file under the default Fluent Bit installation folder `/etc/td-agent-bit`. The script will configure `[OUTPUT]` section of the `td-agent-bit.conf` file based on your LOGIQ cluster, as shown below.

```
[OUTPUT]
    Name          http
    Match         *
    Host          localhost
    Port          80
    URI           /v1/json_batch
    Format        json
    tls           off
    tls.verify    off
    net.keepalive off
    compress      gzip
    Header Authorization Bearer ${LOGIQ_TOKEN}
```

### Installing Node Exporter

To install Node Exporter, do the following.

1. Download the `install.sh` script from the repository shared above.
2.  Make the script executable by running the following command.

    ```
    chmod +x install.sh
    ```
3.  Set the cluster details as shown below.

    ```
    export LOGIQ="example.logiq.ai"
    export MY_TOKEN=<Your Token>
    ```
4.  Execute the script by running any of the following commands.

    ```
    HTTP endpoint:
    sudo -E ./install.sh "http"

    HTTPS endpoint:
    sudo -E ./install.sh "https"

    or
    HTTP endpoint:
    sudo bash install.sh "http"

    HTTPS endpoint:
    sudo bash install.sh "https"
    ```

The script executes and installs Node Exporter

You should now see your Amazon-Linux logs being ingested into the `Linux:Linux1` namespace on your Apica Ascent UI.

<img src="https://user-images.githubusercontent.com/67860971/133257871-58663332-995c-4849-9638-8fe96826296a.png" alt="linux" data-size="original">

## Forwarding Amazon-Linux logs to Apica Ascent using Fluent Bit

The script `isntall.sh` included in this folder carries out the following functions:

* Installs Node Exporter, which exposes various metrices from your Linux machine(CPU, RAM usage)
* Installs Fluent Bit on your Amazon-linux systems which is used for forwarding logs to Apica Ascent.

The script `td-agent-bit.sh` included in this folder carries out the following functions:

* Installs Fluent Bit on your Amazon-linux systems which is used for forwarding logs to Apica Ascent.

In order to install Fluent Bit to forward Linux logs, do the following (Follow the same instructions for installing Node-exporter and run install.sh).

1. Download the `td-agent-bit.sh` script from this folder.
2. Make the script executable by running the following command.

```
chmod +x td-agent-bit.sh
```

1. Set the cluster details

```
export LOGIQ="example.logiq.ai"
export MY_TOKEN=<Your Token>
```

1. Execute the script by running either of the following commands.

```
HTTP endpoint:
sudo -E ./td-agent-bit.sh "http"

HTTPS endpoint:
sudo -E ./td-agent-bit.sh "https"

or
HTTP endpoint:
sudo bash td-agent-bit.sh "http"

HTTPS endpoint:
sudo bash td-agent-bit.sh "https"
```

The script executes and carries out the following:

* Installs Node Exporter (optional)
* Installs Fluent Bit
* Checks your OS versions and updates your sources list, as mentioned in the [Fluent Bit documentation](https://docs.fluentbit.io/manual/installation/linux/ubuntu#update-your-sources-lists).
*   Configures Rsyslog to add `omfwd`, as shown below.

    ```
    *.* action(type="omfwd"
             queue.type="LinkedList"
             action.resumeRetryCount="-1"
             queue.size="10000"
             queue.saveonshutdown="on"
             target="127.0.0.1" Port="5140" Protocol="tcp"
             )
    ```

The script also places the `td-agent-bit.conf` file under the default Fluent Bit installation folder `/etc/td-agent-bit`. The script will configure `[OUTPUT]` section of the `td-agent-bit.conf` file based on your Apica Ascent cluster, as shown below.

```
[OUTPUT]
    Name          http
    Match         *
    Host          localhost
    Port          80
    URI           /v1/json_batch
    Format        json
    tls           off
    tls.verify    off
    net.keepalive off
    compress      gzip
    Header Authorization Bearer ${LOGIQ_TOKEN}
```

You should now see your Amazon-Linux logs being ingested into the `Linux:Linux1` namespace on your Apica Ascent UI.

![linux](https://user-images.githubusercontent.com/67860971/133257871-58663332-995c-4849-9638-8fe96826296a.png)
