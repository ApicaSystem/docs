# Rsyslogd

Please see below how to configure Rsyslog to send to the Apica Ascent server. Rsyslog can send data to Apica Ascent using either TCP transport or RELP transport. The RELP module for Rsyslog is called `omrelp` and for the TCP forward is called `omfwd`

{% hint style="warning" %}
Apica Ascent strongly recommends sending data using the RELP transport to ensure packets are not lost or dropped. RELP relies on acknowledgments from the receiver to make sure the packet is delivered. Apica Ascent, for its part only sends the acknowledgments back once the data is written to the persistent store.
{% endhint %}

### Using omfwd

Update the syslog config in `/etc/rsyslog.conf` or `/etc/rsyslog.d/50-default.conf`

```
*.* action(type="omfwd"
           queue.type="LinkedList"
           action.resumeRetryCount="-1"
           queue.size="10000"
           queue.saveonshutdown="on"
           target="logiq-server-syslog-host" Port="514" Protocol="tcp"
           )
```

### Using omrelp

#### Installation rsyslog RELP modules

rsyslog is installed by default in most modern OS's, rsyslog needs the omrelp module to send data to a RELP aware endpoint such as Apica Ascent. To enable RELP install packages listed below

* rsyslog-relp, enables RELP protocol for rsyslog
* rsyslog-gnutls, enables rsyslog to communicate over a secure socket

```
sudo apt update
sudo apt install rsyslog-gnutls rsyslog-relp
```

* For Redhat/CentOS/Fedora, use yum to install

```
yum install rsyslog-gnutls rsyslog-relp
```

#### **Configuring rsyslog (TLS)**

Update the syslog config in `/etc/rsyslog.conf` or `/etc/rsyslog.d/50-default.conf`

```
module(load="omrelp")
action(type="omrelp" 
        target="logiq-server-relp-host" 
        port="2514" 
        tls="on" 
        tls.caCert="/etc/ssl/LOGIQ/certs/LOGIQ.crt" 
        tls.myCert="/etc/ssl/LOGIQ/certs/client.crt" 
        tls.myPrivKey="/etc/ssl/LOGIQ/certs/client.key" 
        tls.authMode="fingerprint"
        tls.PermittedPeer=["SHA1:BF:46:AB:9F:A3:77:46:AF:6B:D2:EC:A4:30:72:F1:CC:0E:17:C9:42"]
        action.reportSuspensionContinuation="on"
        action.resumeRetryCount="-1"
        action.resumeInterval="1"
        action.resumeIntervalMax="1"
        queue.type="LinkedList"
        queue.size="250000"
        queue.dequeueBatchSize="4096"
        queue.workerThreads="10"
        queue.workerThreadMinimumMessages="25000"
)
```

**NOTE**: Change _"target", "port", tls.caCert" , "tls.myCert", "tls.myPrivKey", "tls.PermitterPeer"_ above to suit your configuration. For non TLS config, set _"tls"_ parameter as _"off"_ and remove all tls.\* parameters from above config file. E.g. of target=ec2-34-213-110-235.us-west-2.compute.amazonaws.com

#### **Configuring rsyslog (non-TLS)**

Update the syslog config in `/etc/rsyslog.conf` or `/etc/rsyslog.d/50-default.conf`

{% hint style="info" %}
Rsyslog non-TLS uses port 20514 vs TLS which uses port 2514
{% endhint %}

```
module(load="omrelp")
action(type="omrelp" 
        target="logiq-server-relp-host" 
        port="20514" 
        tls="off" 
        action.reportSuspensionContinuation="on"
        action.resumeRetryCount="-1"
        action.resumeInterval="1"
        action.resumeIntervalMax="1"
        queue.type="LinkedList"
        queue.size="25000"
        queue.dequeueBatchSize="1024"
        queue.workerThreads="4"
        queue.workerThreadMinimumMessages="60000"
        queue.saveOnShutdown="on"
        queue.timeoutEnqueue="10"

)
```
