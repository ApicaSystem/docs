# Docker Syslog log driver

Using the docker syslog driver to send logs to Apica Ascent is quite simple. Details about the docker syslog driver can be found here [https://docs.docker.com/config/containers/logging/syslog/](https://docs.docker.com/config/containers/logging/syslog/)

Apica Ascent supports both TLS and non TLS syslog ports using TCP.

### Required values

Following fields are required options to be passed to the logdriver

* `tag` - User a human-readable string for better readability otherwise the first 12 chars of the container id will be used
* `syslog-format=rfc3164`
* `syslog-address`

### Optional values

* `syslog-tls-cert`
* `syslog-tls-key`
* `syslog-tls-ca-cert`
* `syslog-tls-skip-verify`

### Using TCP and non TLS port

Sending data from docker to Apica Ascent using TCP and non TLS port can be done as below. In the example below, we are going to run a mysql container and have all logs go to Apica Ascent server hosted at `logiqserver-devtest.example.com`

```
docker run --log-driver syslog \
--log-opt syslog-address=tcp://logiqserver-devtest.example.com:514 \
--log-opt syslog-format=rfc3164 --log-opt tag=mysql --name mysql3 -d mysql
```

### Using TCP and TLS port

When using to connect to Apica Ascent TLS port in a secured setup, pass the client certificates to connect to the server

```
docker run --log-driver syslog \
--log-opt syslog-address=tcp://logiqserver-devtest.example.com:514 \
--log-opt syslog-tls-cert=client.pem --log-opt syslog-tls-key=key.pem \
--log-opt syslog-tls-ca-cert=ca.pem --log-opt syslog-format=rfc3164 \
--log-opt tag=mysql --name mysql3 -d mysql
```
