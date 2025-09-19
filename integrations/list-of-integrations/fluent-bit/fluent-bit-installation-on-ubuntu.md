# Fluent Bit installation on Ubuntu

In order to forward Ubuntu logs to Apica Ascent by leveraging Fluent Bit, do the following.

1. Download the `td-agent-bit.sh` script from this [folder](https://github.com/logiqai/logiq-installation/tree/main/fluent-bit/linux/ubuntu).
2. Make the script executable by running the following command.

```
chmod +x td-agent-bit.sh

For AWS EC2 ubuntu instances

chmod +x td-agent-bit-aws.sh
```

1. Set the cluster details

```
export LOGIQ="example.logiq.ai"
export MY_TOKEN=<Your Token>
```

1. Execute the script by running the following command.

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


For AWS EC2 Ubuntu instances:

HTTP endpoint:
sudo -E ./td-agent-bit-aws.sh "http"

HTTPS endpoint:
sudo -E ./td-agent-bit-aws.sh "https"

or

HTTP endpoint:
sudo bash td-agent-bit-aws.sh "http"

HTTPS endpoint:
sudo bash td-agent-bit-aws.sh "https"


```

The script execution carries out the following:

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
*   The script also places the `td-agent-bit.conf` file under the default Fluent Bit installation folder `/etc/td-agent-bit` as shown below for http and https endpoints.

    ```
     For HTTP endpoint
     
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
     

     For HTTPS endpoint
     
       [OUTPUT]
        name     http
        match    *
        host     <logiq endpoint>
        port     443 
        URI      /v1/json_batch
        Format   json
        tls      on
        tls.verify  off
        net.keepalive  off
        compress      gzip
        Header Authorization Bearer <Token>  
     
    ```

You should now see your Ubuntu logs being ingested into the `Linux:Linux1` namespace on your Apica Ascent UI.

![linux](https://user-images.githubusercontent.com/67860971/133257871-58663332-995c-4849-9638-8fe96826296a.png)
