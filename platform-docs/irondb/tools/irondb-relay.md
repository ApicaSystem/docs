# IRONdb Relay

The IRONdb-relay, like the carbon-relay or the carbon-c-relay is a metrics data router that takes carbon TEXT format metrics and routes them to the appropriate IRONdb storage node.

Since IRONdb uses SHA256 hashing to route metrics to IRONdb nodes, it is incompatible with routing options that exist in carbon-c-relay and carbon-relay. In addition, it provides advanced aggregation and filtering functions for Graphite metrics.

The IRONdb-relay is also capable of accepting Prometheus Snappy-compressed protocol buffers, decoding them, and routing the data to the appropriate IRONdb-relay storage node. It can accept this data either via a dedicated API endpoint or by pulling data from Kafka using the libmtev Kafka module.

[Changelog](irondb-relay-release-notes.md)

## Features

*   Ingests TEXT carbon format metrics on a configurable port

    `foo.bar.baz 1234.56 1507724786`
* Ingests Prometheus Snappy-compressed protocol buffers via an API endpoint or via Kafka.
* Routes to primary owner of the metric name and then subsequent nodes if the primary is down.
* [Aggregation](irondb-relay.md#modules) of incoming metrics based on regular expressions with support for SUM, AVG, MIN, MAX, p0, p25, p50, p95, p99, p100 for carbon format metrics.
* [Blacklist and whitelist filtering](irondb-relay.md#modules) of metrics based on regular expressions
* Durable delivery of metrics using write ahead logs

## Installation

IRONdb-relay requires one of the following operating systems:

* Ubuntu 22.04 LTS

The following network protocols and ports are utilized. These are defaults and may be changed via configuration files.

* 2003/tcp (Carbon plaintext submission)
* 8112/tcp (admin UI, HTTP REST API)
* If the IRONdb cluster uses [TLS](../getting-started/configuration.md#tls-configuration), 8443/tcp will be used for ingestion to IRONdb.

## System Tuning

You should follow the same system tuning as outline in the [IRONdb installation](../getting-started/installation.md#system-tuning).

### Configure Software Sources

Use the same software source as the [IRONdb installation](../getting-started/installation.md#configure-software-sources).

## Install Package

* `/usr/bin/apt-get install circonus-platform-irondb-relay`

## Run Installer

Prepare site-specific information for setup. These values may be set via shell environment variables, or as arguments to the setup script. The environment variables are listed below.

*   **IRONDB\_CHECK\_UUID**

    _(required)_ Check ID for Graphite metric ingestion, which must be the same on all cluster nodes. You may use the `uuidgen` command that comes with your OS, or generate a [well-formed, non-nil](https://en.wikipedia.org/wiki/Universally_unique_identifier) UUID with an external tool or website.
*   **IRONDB\_CHECK\_NAME**

    _(required)_ The string that will identify Graphite-compatible metrics stored in the check identified by `IRONDB_CHECK_UUID`. For example, if you submit a metric named "my.metric.1", and the check is named "test", the resulting metric name in IRONdb will be "graphite.test.my.metric.1".
*   **IRONDB\_BOOTSTRAP**

    _(required)_ The comma separated list of IRONdb nodes (ipaddress:port or `https://FQDN:port` URL) to use to discover the topology of the IRONdb cluster. It's a good practice to list all IRONdb nodes in this list to adjust to down nodes.
*   **IRONDB\_RELAY\_TLS**

    _(optional)_ Configures listeners to require TLS where applicable. Default is "off". If set to "on", both the Carbon submission port and the admin UI port will expect TLS connections from clients. An SSL certificate will be required before the service can be started. See [TLS Configuration](../getting-started/configuration.md#tls-configuration) below for details.
*   **IRONDB\_CRASH\_REPORTING**

    _(optional)_ Control enablement of automated crash reporting. Default is "on". IRONdb utilizes sophisticated crash tracing technology to help diagnose errors. Enabling crash reporting requires that the system be able to connect out to the Apica reporting endpoint: [https://circonus.sp.backtrace.io:6098](ttps://circonus.sp.backtrace.io:6098) . If your site's network policy forbids this type of outbound connectivity, set the value to "off".
*   **IRONDB\_RELAY\_DURABLE**

    _(optional)_ Control enablement of durable delivery. Default is "false". If set to "true", will cause IRONdb-relay to use the disk to persist all incoming metrics to the file system before sending them on to IRONdb nodes.

Run the setup script. All required options must be present, either as environment variables or via command-line arguments. A mix of environment variables and arguments is permitted, but environment variables take precedence over command-line arguments. Use the `-h` option to view a usage summary:

```sh
Usage: setup-irondb-relay [-h] -c <check-name> -u <check-uuid> -B <irondb-node-list>
       [-d] [-t (on|off)] [-b (on|off)]
  -c <check-name>       : Graphite check name
  -u <check-uuid>       : Graphite check UUID
  -d                    : Use durable delivery to IRONdb
  -B <irondb-node-list> : Bootstrap to this list of IRONdb nodes
  -t on|off             : Enable/disable TLS for listeners (default: off)
  -b on|off             : Enable/disable crash reporting (default: on)
  -h                    : Show usage summary

Example:
  setup-irondb-relay -c foo -u f2eaa1b7-f7e8-41bd-9e8d-e52d43dc88b0 -d -B 10.1.13.1:8112,10.1.13.2:8112 -b on
```

If your IRONdb cluster [uses TLS](../getting-started/configuration.md#tls-configuration), then specify the node list as `https://<FQDN>:8443` URLs, and, if necessary, place the CA certificate that corresponds to the cluster's client-facing listener as `/opt/circonus/etc/ssl/irondb-ca.crt`. The CA cert is necessary if your certificates are issued by an internal CA, as opposed to a public CA that is trusted by the operating system.

The setup script will configure your IRONdb-relay instance and start the service. See the [Graphite Ingestion](../integrations/graphite.md) section for details.

If you selected the TLS option irondb-relay listeners, the service will not be started automatically, and you will need to install a private key and certificate before starting the service.

## Configuration

IRONdb-relay is implemented using [libmtev](https://github.com/circonus-labs/libmtev/), a framework for building high-performance C applications. You may wish to review the libmtev [configuration documentation](http://circonus-labs.github.io/libmtev/config/) for an overview of how libmtev applications are configured generally.

This document deals with options that are specific to IRONdb-relay, but links to relevant libmtev documentation where appropriate.

Default values are those that are present in the default configuration produced during initial installation.

### irondb-relay.conf

This is the primary configuration file that IRONdb-relay reads at start. It includes additional configuration files which are discussed later. It is located at `/opt/circonus/etc/irondb-relay.conf`

### irondb-relay

```xml
<irondb-relay lockfile="/irondb-relay/logs/irondb-relay.lock" text_size_limit="512">
```

IRONdb-relay's libmtev application name. This is a required node and **must not** be changed.

### irondb-relay lockfile

Path to a file that prevents multiple instances of the application from running concurrently. You should not need to change this.

Default: `/irondb-relay/logs/irondb-relay.lock`

### eventer

```xml
<eventer>
  <config>
    <concurrency>16</concurrency>
    <default_queue_threads>16</default_queue_threads>
    <default_ca_chain>/opt/circonus/etc/ssl/irondb-ca.crt</default_ca_chain>
  </config>
</eventer>
```

Libmtev eventer system configuration. See the [libmtev eventer documentation](http://circonus-labs.github.io/libmtev/config/eventer.html).

### logs

Libmtev logging configuration. See the [libmtev logging documentation](http://circonus-labs.github.io/libmtev/config/logging.html).

By default, the following log files are written and automatically rotated, with the current file having the base name and rotated files having an epoch-timestamp suffix denoting when they were created:

* `/irondb-relay/logs/errorlog`: Output from the daemon process, including not just errors but also operational warnings and other information that may be useful to Apica Support.
  * Rotated: 24 hours
  * Retained: 1 week

### modules

Libmtev module configuration. See the [libmtev module documentation](http://circonus-labs.github.io/libmtev/config/modules.html)

There are 2 modules provided with IRONdb-relay:

*   filter

    Will allow you to setup whitelist/blacklist filtering for metrics

    1.  Enable the module under the `<modules>` section of your config by adding the line:

        `<generic image="filter" name="filter_hook"></generic>`
    2.  Create your filter config

        Add a `<filter>` block to your `irondb-relay.conf` file. A `<filter>` can have exactly one `<ruleset>` block. A `<ruleset>` block can have any number of `<rule>` blocks. A `<rule>` block consists of a `<match_regex>` or `<match_all>` directive and a `<result>`. `<rule>` blocks are processed in order and processing stops at the first matching `<rule>`.

        Depending on whether you want a whitelist or a blacklist you would either configure your filter to whitelist a set of regexes and then have a `<match_all>` rule to `deny` everything else, or you would configure your filter to have a rule to match metrics you want to blacklist then have a final `<match_all>` rule to `allow` the remainder.

        An example of a blacklist would resemble:

        ```xml
         <filter> 
          <ruleset> 
            <rule> 
              <match_regex>^relay_test\.agent\.2.*</match_regex>
              <result>deny</result> 
            </rule> 
            <rule> 
              <match_all>true</match_all>
              <result>allow</result> 
            </rule> 
         </ruleset>
        </filter>
        ```

        The above would blacklist everything that starts `relay_test.agent.2` and allow everything else.

        For best performance, it is wise to organize your `<rule>` blocks in descending order based on the expected frequency of matching. You want the `<rule>`s that match more often to be at the beginning of the list and the `<rule>`s that match infrequently to be lower down in the list.
*   aggregation\_hook

    Will allow you to perform aggregation on incoming metrics and produce new metrics as the result.

    1.  Enable the module under the `<modules>` section of your `irondb-relay.conf` by adding the line:

        `<generic image="aggregation_hook" name="aggregation_hook"></generic>`
    2.  Create your aggregation config

        Add an `<aggregation>` block to your `irondb-relay.conf` file. An `<aggregation>` can have exactly one `<matchers>` block which itself can contain any number of `<matcher>` blocks. A `<matcher>` block consists of the following:
    3. `<match_regex>` - the regular expression (including captures) you want to match incoming metrics
    4. `<flush_seconds>` - how long to aggregate matching records for
    5. `<flush_name_template>` - the template to use for the outgoing name of the aggregated metric result
    6. `<flush_functions>` - a comma separate list of functions you want applied to the matching metric values
    7. `<flush_original>` - whether or not you want to let the original incoming metric to also be sent to IRONdb
    8. `<jitter_ms>` - to prevent collisions among multiple relays which might be aggregating the same metrics, set this to a unique value per irondb-relay instance
    9.  `<idle_cycles>` - how many multiples of `<flush_seconds>` should the relay wait before giving up on any new incoming metrics that would fall into this aggregation window

        For `<flush_name_template>` you can use capture references (`\1`) and a special sequence `${FF}` to create the outgoing metric name.

        An example:

        ```xml
        <aggregation>
        <matchers>
          <matcher>
            <match_regex>^relay_test\.agent.[0-9]*\.metrics\.([0-9]*)</match_regex>
            <flush_seconds>10</flush_seconds>
            <flush_name_template>agg.all_agents.metrics.\1_${FF}</flush_name_template>
            <flush_functions>avg</flush_functions>
            <flush_original>false</flush_original>
            <jitter_ms>10</jitter_ms>
            <idle_cycles>2</idle_cycles>
          </matcher>
          <matcher>
            <match_regex>^relay_test\.agent.[0-9]*\.metrics\.([0-9]*)</match_regex>
            <flush_seconds>10</flush_seconds>
            <flush_name_template>foo.all_agents.metrics.\1_${FF}</flush_name_template>
            <flush_functions>sum</flush_functions>
            <flush_original>false</flush_original>
            <jitter_ms>10</jitter_ms>
            <idle_cycles>2</idle_cycles>
          </matcher>
        </matchers>
        </aggregation>
        ```

        The above first `<matcher>` matches incoming metrics that start `relay_test.agent.`, followed by any number of digits, followed by `.metrics.` and finally capturing the trailing sequence of any number of digits. An example metric that would match: `relay_test.agent.5.metrics.27`. All incoming rows that fit this regex will have their values averaged (`<flush_functions>avg</flush_functions>`) for 10 seconds. The original source rows will _not_ be sent to IRONdb and after 10 seconds a new row will be produced that looks like: `agg.all_agents_metrics.27_avg` and it's value will be the average of `metrics.27` from all agents that this relay saw in that 10 second window.

        The 2nd `<matcher>` performs the same match but uses `sum` instead of `avg` and uses a different `<flush_name_template>`.

        The supported `<flush_functions>` are: `sum,avg,min,max,p0,p25,p50,p95,p99,p100,histogram`
    10. `sum` is the sum of values of the matching rows.
    11. `avg` is the mean
    12. `min` is the smallest value
    13. `max` is the largest
    14. `p0` is a synonym for `min`
    15. `p100` is a synonym for `max`
    16. `p25` is the 25th percentile value
    17. `p50` is the 50th percentile value
    18. `p95` is the 95th percentile value
    19. `p99` is the 99th percentile value
    20. `histogram` is the complete distribution of all values

        With `histogram` IRONdb will be able to store the histogram data but there currently is no facility in graphite-web to render this data.

        **A note on flushing results to IRONdb**

        > The very first row that matches and creates an aggregation "window" will start the flush timer. `<flush_seconds>` later the result will be sent to IRONdb. It is possible after this initial flush that some late data arrives that would normally fit into that same aggregation window. This is where `<idle_cycles>` comes into play. The relay will retain the aggregation window until no more matching rows are seen for `<idle_cycles>` cycles. If matching rows _are_ seen the aggregation window is updated with the new values and the record is re-sent to IRONdb. To control the behavior of conflicts within the database when this happens please see the [conflict resolver](../getting-started/configuration.md#raw_database) section of the IRONdb configuration.

### send

This config has a single attribute: `durable="true|false"`. If set to "true" it will use the `<journal>` settings below to journal every row destined for IRONdb nodes. If set to "false", it will bypass the journaling and directly send to IRONdb. If set to "false", the relay will do its best to make sure data arrives at one of the IRONdb nodes if the primary doesn't respond or is down but there is no guarantee of delivery.

Prometheus data only supports `durable=true`. If `durable` is set to `false` and any Prometheus data comes in, it will be rejected.

### listeners

Libmtev network listener configuration. See the [libmtev listener documentation](http://circonus-labs.github.io/libmtev/config/listeners.html).

Each listener below is configured within a `<listener>` node. Additional listeners may be configured if desired, or the specific address and/or port may be modified to suit your environment.

### network

IRONdb-relay supports only one type of network configuration - Kafka. This can be used to read Prometheus data from Kafka to decode and forward to the IRONdb cluster. The configuration is defined in the libmtev Kafka module.

If you are not using Kafka, or if you are exclusively using IRONdb-relay for carbon metrics, then you may ignore this section. Only configure this if you intended to consume Prometheus data via Kafka.

The following is an example of how this would be configured. Note that there are more fields that can be configured than are listed here - the `rdkafka` prefix allows setting configuration values from the `rdkafka` library.

```
  <network>
    <in>
      <mq type="kafka">
        <host>test-kafka-server.example.com</host>
        <topic>example_topic</topic>
        <consumer_group>example_consumer_group</consumer_group>
        <protocol>prometheus</protocol>
        <override_account_id>1</override_account_id>
        <override_check_uuid>0dd84b2f-9dcf-4986-a3b3-a1a094c38288</override_check_uuid>
        <rdkafka_config_setting_enable.idempotence>true</rdkafka_config_setting_enable.idempotence>
        <rdkafka_global_config_setting_fetch.error.backoff.ms>500</rdkafka_global_config_setting_fetch.error.backoff.ms>
        <manual_commit>true</manual_commit>
      </mq>
    </in>
  </network>
```

The following is a brief explanation of the required fields:

* `host` - The host where Kafka is running. Data will be ingested from here.
* `topic` - The topic to consume data from.
* `consumer_group` - The consumer group that this node is a part of. If there are multiple irondb-relay instances running, these should all be configured to be the same thing.
* `protocol` - This must be set to `prometheus`. Any other value is invalid for irondb-relay.
* `override_account_id` - The account id that the data will be associated with.
* `override_check_uuid` - The check uuid that the data will be associated with.
* `manual_commit` - This determines if rdkafka will automatically commit messages after receipt, or if it should wait for explicit confirmation. For durability, this should always be set to `true`.
* `rdkafka_config_setting_enable.idempotence` - Enables data idempotence. This should always be set to `true`.
* `rdkafka_global_config_setting_fetch.error.backoff.ms` - Sets how many milliseconds to wait before attempting to re-pull data from Kafka after failure.

**TLS Configuration**

```xml
<sslconfig>
  <!-- Certificate CN should be the FQDN of the node. -->
  <certificate_file>/opt/circonus/etc/ssl/relay.crt</certificate_file>
  <key_file>/opt/circonus/etc/ssl/relay.key</key_file>
  <ca_chain>/opt/circonus/etc/ssl/relay-ca.crt</ca_chain>
  <layer_openssl_10>tlsv1.2</layer_openssl_10>
  <layer_openssl_11>tlsv1:all,>=tlsv1.2,cipher_server_preference</layer_openssl_11>
  <ciphers>ECDHE+AES128+AESGCM:ECDHE+AES256+AESGCM:DHE+AES128+AESGCM:DHE+AES256+AESGCM:!DSS</ciphers>
</sslconfig>
```

This section will be present when TLS operation has been activated via the setup script. These settings apply to any and all listeners that have the `ssl` attribute set to "on".

See [libmtev listener configuration](https://circonus-labs.github.io/libmtev/config/listeners.html#sslconfig) for specific details on each option.

Place the following files in the `/opt/circonus/etc/ssl` directory:

* **relay.key** - An RSA private key.
* **relay.crt** - A certificate issued for this relay's listeners. Its commonName (CN) should be the node's FQDN, or whatever name clients will be using to connect to this node.
* **relay-ca.crt** - The Certificate Authority's public certificate, sometimes referred to as an intermediate or chain cert, that issued `relay.crt`.

These files must be readable by the unprivileged user that irondb-relay runs as, typically `nobody`.

**Main listener**

```xml
<listener address="*" port="8112" backlog="100" type="http_rest_api" ssl="off">
  <config>
    <document_root>/opt/circonus/share/snowth-web</document_root>
  </config>
</listener>
```

The main listener serves multiple functions:

* [Operations Dashboard](irondb-relay.md#operations-dashboard)
* JSON-formatted node statistics (`http://thisnode:thisport/stats.json`)

**Main listener address**

The IP address on which to listen, or the special `*` to listen on any local IP address.

Default: `*`

**Main listener port**

The port number to listen on. For the main listener this will utilize both TCP and UDP.

Default: 8112

**Main listener backlog**

The size of the queue of pending connections. This is used as an argument to the standard `listen(2)` system call. If a new connection arrives when this queue is full, the client may receive an error such as ECONNREFUSED.

Default: 100

**Main listener type**

The type of libmtev listener this is. The main listener is configured to be only a REST API listener. This value should not be changed.

Default: http\_rest\_api

**Main listener ssl**

If set to "on", SSL/TLS will be enabled for this listener.

Default: off

**Graphite listener**

```xml
<listener address="*" port="2003" type="graphite" ssl="off">
  <config>
    <check_uuid>00000000-0000-0000-0000-000000000000</check_uuid>
    <check_name>mycheckname</check_name>
    <account_id>1</account_id>
  </config>
</listener>
```

The Graphite listener operates a Carbon-compatible submission pathway using the [plaintext format](http://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-plaintext-protocol).

Multiple Graphite listeners may be configured on unique ports and associated with different check UUIDs. See the section on [Graphite ingestion](../getting-started/configuration.md) for details. The graphite listener config here should be kept in sync with the [same configuration](../getting-started/configuration.md#graphite-config) for the IRONdb nodes themselves.

**Graphite listener address**

The IP address on which to listen, or the special `*` to listen on any local IP address.

Default: `*`

**Graphite listener port**

The TCP port number to listen on.

Default: 2003

**Graphite listener type**

The type of listener. IRONdb implements a Graphite-compatible handler in libmtev, using the custom type "graphite".

Default: graphite

**Graphite listener ssl**

If set to "on", SSL/TLS will be enabled for this listener.

Default: off

**Graphite listener config**

These configuration items control which check UUID, name, and account ID are associated with this listener. The first Graphite listener is configured during [initial installation](../getting-started/installation.md#installation-steps).

* `check_uuid` is the identifier for all metrics ingested via this listener.
* `check_name` is a meaningful name that is used in [namespacing](../integrations/graphite.md#namespacing).
* `account_id` is also part of namespacing, for disambiguation.

**CLI listener**

```xml
<listener address="127.0.0.1" port="32322" type="mtev_console">
  <config>
    <line_protocol>telnet</line_protocol>
  </config>
</listener>
```

The CLI listener provides a local [telnet console](http://circonus-labs.github.io/libmtev/operations/telnet_console.html) for interacting with libmtev subsystems, including modifying configuration. As there is no authentication mechanism available for this listener, it is recommended that it only be operated on the localhost interface.

**CLI listener address**

The IP address on which to listen, or the special `*` to listen on any local IP address.

Default: 127.0.0.1

**CLI listener port**

The TCP port number to listen on.

Default: 32322

**CLI listener type**

The CLI listener uses the built-in libmtev type "mtev\_console" to allow access to the telnet console.

Default: mtev\_console

### journal

```xml
<journal concurrency="4"
         replicate_concurrency="1"
         max_bundled_messages="25000"
         pre_commit_size="131072"
/>
```

Journals are write-ahead logs for replicating metric data to IRONdb nodes. Each IRONdb-relay has one journal for each of the IRONdb nodes.

**journal concurrency**

Establishes this number of concurrent threads for writing to each peer journal, improving ingestion throughput.

Default: 4

> A concurrency of 4 is enough to provide up to 700K measurements/second throughput, and is not likely to require adjustment except in the most extreme cases.

**journal replicate\_concurrency**

Establishes this number of concurrent threads for writing from the journals into the IRONdb cluster, improving throughput.

Default: 1

**journal max\_bundled\_messages**

Outbound journal messages will be sent in batches of up to this number, improving replication speed.

Default: 25000

**journal pre\_commit\_size**

An in-memory buffer of this number of bytes will be used to hold new journal writes, which will be flushed to the journal when full. This can improve ingestion throughput, at the risk of losing up to this amount of data if the system should fail before commit. To disable the pre-commit buffer, set this attribute to 0.

Default: 131072 (128 KB)

### signal\_handling

```
<signal_handling>
  <signal name="SIGINT" action="drain"/>
</signal_handling>
```

IRONdb-relay allows configuring certain signals to be handled in different ways. The available signals are:

* SIGINT
* SIGHUP
* SIGQUIT
* SIGABRT
* SIGTERM
* SIGUSR1
* SIGUSR2

There can be configured under the `<signal_handling>` config, each with a distinct action to take upon receipt of that signal. The three available actions are:

* `exit` - The default. If this signal is received, IRONdb-relay will immediately exit.
* `ignore` - The signal will be ignored and `irondb-relay` will continue to run.
* `drain` - IRONdb-relay will cut off all incoming data and will run until all of the jlog journals are drained.

If you are expecting to run in an envionement where entire instances of IRONdb-relay will be spun up and thrown away without persistent state, use `drain`. Otherwise, use `exit` to immediately shut down. Omitting this section will set all signals to `exit` by default. Any signals not explicitly enumerated will also default to `exit`.

### circonus-watchdog.conf

**watchdog**

```xml
<watchdog glider="/opt/circonus/bin/backwash" tracedir="/opt/circonus/traces-relay"/>
```

The watchdog configuration specifies a handler, known as a "glider", that is to be invoked when a child process crashes or hangs. See the [libmtev watchdog documentation](http://circonus-labs.github.io/libmtev/config/watchdog.html).

If [crash handling](../administration/operations.md#crash-handling) is turned on, the `glider` is what invokes the tracing, producing one or more files in the `tracedir`. Otherwise, it just reports the error and exits.

## REST API

IRONdb-relay has one REST API endpoint:

```
POST /prometheus/write/<account id>/<check uuid>
```

Whatever system is being configured to send Prometheus Snappy-compessed protocol buffers (typically, this would be the `remote-write` endpoint) should be configured to send the data to this REST API endpoint. IRONdb-relay will take the data coming in here, decompress/decode it, and forward it to the IRONdb cluster. The two arguments here are:

* `account id` - The account id to associate the data with/
* `check uuid` - The check uuid to associate the data with.

## Operations Dashboard

IRONdb-relay comes with a built-in operational dashboard accessible via port 8112 (default) in your browser, e.g., http://irondb-relay-host:8112. This interface provides real-time information about the IRONdb-relay. There are a number of tabs in the UI, which display different aspects about the node's current status.

The node's version info is displayed at top right.

### Overview Tab

The "Overview" tab displays top level statistics about the relay.

**Inflow**

* Socket accepts - how many connections have been made to this relay since startup
* Received - how many individual rows have been sent into this relay
* Parsed - the number of rows that we successfully parsed and validated
* Parse errors - the number of parse failures
* Aggregation gated - the number of rows that were _not_ send on to IRONdb because of [filtering](irondb-relay.md#modules) or [aggregation](irondb-relay.md#modules)

**Outflow**

* Rows sent - the number of rows sent to IRONdb nodes
* Batches sent - rows are sent in batches, this is the count
* Batches OK - successful batch count
* Batch timeouts - the count of batches that timed out while sending to IRONdb nodes

### Durable Delivery Tab

If `<send durable="true" />` is set in the [config](irondb-relay.md#send), this tab will contain information about replication lag.

Each IRONdb node will be listed along with the number of journal reads and writes and how far behind this relay is in sending to each IRONdb node. Ideally we should have `Seconds behind` under 10 seconds.

### Filters Tab

If you have the filter module enabled, lists each filter in your current `<ruleset>` and how many rows it has processed.

### Aggregation Tab

If you have the aggregation\_hook module enabled, lists each aggregation and how many rows it has seen, matched, skipped, and generated.

### Internals Tab

Shows internal application information, such as recent error logging, job queues, open sockets, and timers. This data is used by Apica Support when troubleshooting issues.
