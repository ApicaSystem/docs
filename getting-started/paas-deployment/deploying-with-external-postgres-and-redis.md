---
description: >-
  For deployments that wish to utilize external services for the PostgreSQL
  and/or Redis functions, instead of the built-in components.
---

# Deploying with external Postgres and Redis

## Configure Helm Values

To utilize external database and/or cache services in the cloud, configure the following   [Helm values](./#prepare-your-values-file) as needed.

```
global:
  environment:
    redis_host: "<your-cache-service-connection-host>"
    redis_tls:
      enabled: true
      skip_verify: false
    postgres_host: "<your-database-service-connection-host>"
    postgres_tls:
      enabled: true
      sslmode: "verify-full"
      mtls: false   # Set to true to require client certificate
  chart:
    postgres: false
    redis: false
  cnpg:
    enabled: false
```

If either the Postgres or Redis service TLS certificates are not automatically trusted by the host operating system, you can provide CA certificates via a Secret (see below). These will be mounted into the necessary pods and referenced by Ascent to trust the external services. You will also need to add a `tls` block to the following sections in your values file:

logiq-flash

```
  tls:
    certSecretName: "ascent-external-certs"  # or whatever your Secret is named
    postgres:
      caCert: "/flash/tls-certs/pg-ca.crt"  # omit for publicly-signed certs
      # mTLS gated by global.environment.postgres_tls.mtls
      clientCert: "/flash/tls-certs/pg-client.crt"  # mTLS client cert
      clientKey: "/flash/tls-certs/pg-client.key"   # mTLS client key
    redis:
      caCert: "/flash/tls-certs/redis-ca.crt"  # omit for publicly-signed certs      
```

flash-discovery

```
  tls:
    certSecretName: "ascent-external-certs"  # or whatever your Secret is named
    postgres:
      caCert: "/flash/tls-certs/pg-ca.crt"  # omit for publicly-signed certs
      # mTLS gated by global.environment.postgres_tls.mtls
      clientCert: "/flash/tls-certs/pg-client.crt"  # mTLS client cert
      clientKey: "/flash/tls-certs/pg-client.key"   # mTLS client key
```

flash-coffee

```
  tls:
    certSecretName: "ascent-external-certs"  # or whatever your Secret is named
    postgres:
      caCert: "/coffee/certs/pg-ca.crt"  # omit for publicly-signed certs
      # mTLS gated by global.environment.postgres_tls.mtls
      clientCert: "/coffee/certs/pg-client.crt"  # mTLS client cert
      clientKey: "/coffee/certs/pg-client.key"   # mTLS client key
    redis:
      caCert: "/coffee/certs/redis-ca.crt"  # omit for publicly-signed certs
```

## Create TLS Secret

If you need to provide CA or client certificates for Postgres and/or Redis, create a Kubernetes Secret of type `generic` with any of the following keys.

* `pg-ca.crt` - The certificate that issued the database server certificate. Required if the issuer is not in the host operating system's trust store. For example, Amazon provides a certificate bundle (`global-bundle.pem`) when creating a new RDS cluster. That file's contents would be the value of this key.
* `pg-client.crt` - The client certificate to be used to authenticate to the Postgres service. Required if `global.environment.postgres_tls.mtls` is set to `true`.
* `pg-client.key` - The client key to be used to authenticate to the Postgres service. Required if `global.environment.postgres_tls.mtls` is set to `true`.
* `redis-ca.crt` - The certificate that issued the Redis server certificate. Required if the issuer is not in the host operating system's trust store.

For example, to create the secret with the Amazon RDS bundle downloaded to the current directory:

```
kubectl create secret generic ascent-external-certs \
  --from-file=pg-ca.crt=./global-bundle.pem
```

If you are not sure whether your service endpoints are trusted by the OS or not, you can test on the host OS with the OpenSSL CLI:

```
openssl s_client -connect host:port </dev/null
```

If the server certificate is trusted, you will see a message like this near the end of the output:

```
Verify return code: 0 (ok)
```

If the certificate is not trusted, you will see a message like this:

```
Verify return code: 20 (unable to get local issuer certificate)
```
