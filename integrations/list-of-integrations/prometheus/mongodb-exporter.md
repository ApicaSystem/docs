---
description: Setup MongoDB Exporter and send metrics to Apica Ascent endpoint
---

# MongoDB Exporter

We will be using [percona/mongodb\_exporter](https://github.com/percona/mongodb_exporter) to export the MongoDB metrics to Apica Ascent endpoint.\
\
You can also use other MongoDB exporters as well. ([Exporters List](https://prometheus.io/docs/instrumenting/exporters/))

> If you are using other third party exporters then please make changes in the `promethus.yml` file accordingly.

> [percona/mongodb-exporter](https://github.com/percona/mongodb_exporter)
>
> This is the new MongoDB exporter implementation that handles ALL metrics exposed by MongoDB monitoring commands. This new implementation loops over all the fields exposed in diagnostic commands and tries to get data from them.
>
> Currently, these metric sources are implemented:
>
> * $collStats
> * $indexStats
> * getDiagnosticData
> * replSetGetStatus
> * serverStatus

The steps mentioned below will help you setup mongodb\_exporter in a linux machine. For other use-cases please follow the documentation and use different release binary.

1. Make sure the mongo server is running in the machine.
2.  It is recommended to keep these values ready while running the script:

    * **-mongodb.uri** - The URI of the MongoDB port (_default: mongodb://localhost:27017_)
    * **-auth.user** - The optional auth username (_default: none_)
    * **-auth.pass** - The optional auth password (_default: none_)
    * **-web.listen-address** - The listen address of the exporter, where metrics will be hosted (_default: ":9001"_)
    * **-log\_dir** - The directory to write the log file (_default: /tmp_)

    _For more options see the help page with '-h' or '--help'_
3. Run the below script. This script will:
   1. Install wget
   2. Download the amd64 compatible tar file of mongodb\_exporter
   3. Extract the files of tarball and move it to `/usr/local/bin/`
   4. Make a mongodb exporter service file at `/etc/systemd/system/mongodb_exporter.service`
   5. `Reload systemd`
   6. `Start and enable mongodb_exporter as a service`

{% file src="../../../.gitbook/assets/mongodb_exporter_install.sh" %}

This script will ask you for 4 details:

* MongoDB URI
* Web Listen Address
* Auth User
* Auth Password

After the script has executed successfully you will be able to see the metrics exposed by mongodb\_exporter by going to **`<web.listen-address>/metrics`**

\---

Now we have the metrics being exposed at a endpoint, we can go ahead and scrape it using `prometheus` and send it to Apica Ascent endpoint via. remote\_write.

Locate the prometheus configuration file and add a job in `scrape_configs` for mongodb\_exporter like this:

```
# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.

  - job_name: 'prometheus'
  
    static_configs:
    - targets: ['localhost:9090']
      labels:
        group: 'logiq_engr'
        cluster_id: 'logiq'
        namespace: 'engr'

  - job_name: 'mongodb'               # <------- Added configuration for scraping localhost:9094/metrics --------

    static_configs:
    - targets: ['localhost:9094']
      labels:
        group: '<GROUP NAME>'
        cluster_id: '<CLUSTER ID>'
        namespace: '<NAMESPACE>'
```

Save the prometheus config file and restart/start the prometheus sytemd service by using these commands:

> `sudo systemctl restart prometheus` OR `sudo systemctl start prometheus`

You will see the metrics populate at Apica Ascent endpoint in Query editor in some time.
