# Prometheus on Windows

For monitoring Windows with Prometheus, a Windows exporter needs to be installed which is the equivalent of [Node exporter](https://github.com/prometheus/node_exporter) for Windows. This exporter will start an HTTP endpoint, exposing metrics that will enable Prometheus to scrape them.

#### Windows exporter (node) installation:

You can run the latest MSI installer from the below link, each release provides a .msi installer. The installer will set up the windows\_exporter as a Windows service, as well as create an exception in the Windows Firewall. Node-exporter will be run on port 9182 by default after the installation.

```
https://github.com/prometheus-community/windows_exporter/releases
```

#### Prometheus installation:

Please follow the below steps to install Prometheus on Windows:

* Download the prometheus.ps1 file

```
Invoke-WebRequest 'https://logiq-scripts.s3.ap-south-1.amazonaws.com/windows-prome.ps1' -OutFile windows-prome.ps1

```

* Powershell by default uses TLS 1.0 to connect to the website, but website security requires TLS 1.2, hence run the below.

```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
```

* By default, Windows does not allow you to execute any scripts due to the execution policy set, to enable it, run the below

```
  Get-ExecutionPolicy

  Run Set-ExecutionPolicy like this to switch to the unrestricted mode:

  Set-ExecutionPolicy unrestricted
```

* Execute the below script, the script will download and install Prometheus as a service in the path where the script is executed.

```
   ./windows-prome.ps1
```

* You should see Prometheus running, run the below to check

```
netstat|select-string 9090
```

If you want to add/ modify to enable Prometheus to scrape custom endpoint (ex: windows-exporter), make the changes on prometheus.yml file in the Prometheus directory downloaded by the script above and restart the Prometheus service

{% hint style="info" %}
To enable remote-write on Prometheus, include the remote-write endpoint as shown below in the Prometheus.yml configuration and restart the Prometheus service.
{% endhint %}

```
remote_write:
  - url: https://<Logiq-Endpoint>/v1/receive/prometheus
    tls_config:
      ca_file: <CA-file>
      cert_file: <cert-file>
      key_file: <key-file>
scrape_configs:
  - job_name: "windows-exporter"
    metrics_path: '/metrics'
    static_configs:
      - targets: ['localhost:9182']

```
