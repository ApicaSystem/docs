# Docker Swarm logging

This guide describes how you can set up log forwarding from your Docker Swarm environments to Apica Ascent. To forward logs from Docker Swarm to Apica Ascent, do the following.

### Deploy fluent-bit container

Create the following files:

#### parsers.conf

```apacheconf
[PARSER]
    Name   json
    Format json
```

#### fluent-bit.conf

Update the Apica Ascent `host` and `Authorization Header` in the file. The token can be obtained from Apica Ascent UI as described [here](../overview/generating-a-secure-ingest-token.md#obtaining-an-ingest-token-using-ui).

```apacheconf
[SERVICE]
    Flush        1
    Parsers_File /fluent-bit/etc/parsers.conf
    Log_Level    error

# collect docker logs using fluend logging driver
[INPUT]
    Name forward
    Listen 0.0.0.0
    port 24224

# try parsing log as json and lift its keys to the first-level
[FILTER]
    Name parser
    Match *
    Parser json
    Key_Name log
    Reserve_Data On

[OUTPUT]
    name     http
    match    *
    host     <Apica-Ascent-endpoint>
    port     443
    URI      /v1/json_batch
    Format   json
    tls      on
    tls.verify  off
    net.keepalive  off
    compress      gzip
    Header Authorization Bearer <Token>
```

#### docker-compose.fluent.yaml

Ensure that the Fluent Bit Docker Compose uses the `parsers.conf` and `fluent-bit.conf` which we prepared in the previous step.

```yaml
version: "3.7"

services:
  fluent-bit:
    image: fluent/fluent-bit:latest
    volumes:
      - ./fluent-bit.conf:/fluent-bit/etc/fluent-bit.conf
      - ./parsers.conf:/fluent-bit/etc/parsers.conf
    ports:
      - "24224:24224"
      - "24224:24224/udp"
```

Run the following command to get fluent-bit running in your Docker Swarm cluster.

```
docker stack deploy --compose-file docker-compose.fluent.yaml fluent-bit
```

Ensure that the fluent-bit container is running in the cluster.

### Update services to add logging driver

Add the global logging configuration to your docker-compose files as shown below

```yaml
x-logging: &default-logging
  driver: fluentd
```

Update the services in docker-compose files to add logging configuration and environment variables. The `Namespace`and `AppName` set in the service definition defines how the logs from the service are indexed in Apica Ascent.

```yaml
        environment:
            Namespace: production
            AppName: nginx
        logging:
            driver: fluentd
            options:
                env: "Namespace,AppName"
```

#### Examples

If your default Docker Compose file looks like this:

```yaml
version: "3.4"

Services:
  log_creator:
        image: alpine:3.12.4
         command: >
            sh -c '
                counter=0
                while :
                do
                    sleep 1
                    echo "{\"message\": \"log line $$counter\", \"something\": \"else\"}"
                    counter=$$(($$counter + 1))
                done'


```

After you’ve added the logging configuration, your Docker Compose file should look like this.

```yaml
version: "3.4"

x-logging: &default-logging
  driver: fluentd

services:
      log_creator:
        image: alpine:3.12.4
        logging: *default-logging
        command: >
            sh -c '
                counter=0
                while :
                do
                    sleep 1
                    echo "{\"message\": \"log line $$counter\", \"something\": \"else\"}"
                    counter=$$(($$counter + 1))
                done'
        environment:
            Namespace: logiq-namespace
            AppName: log-generator
        logging:
            driver: fluentd
            options:
                env: "Namespace,AppName"
```

Run the following command to run the container.

```
docker stack deploy --compose-file logger-test.yaml logger-test
```

Your Docker Swarm logs will now be ingested into Apica Ascent.
