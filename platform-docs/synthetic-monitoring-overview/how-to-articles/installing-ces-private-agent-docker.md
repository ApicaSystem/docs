# Installing CES Private Agent (Docker)

A **private agent** is fully managed by a customer yet connected to SaaS. It might be placed in a customer’s network and monitor internal resources unavailable from the Internet.

A **private location** is a group of private agents that are placed in the same geographical location.

## System Requirements <a href="#system-requirements" id="system-requirements"></a>

* **Supported OS:** RedHat 8 or higher, Debian 11 or higher (or compatible systems like Ubuntu and CentOS)
* **Containerization:** Docker 22 (or higher versions)
* **Other software:** Java 11 or higher
* **Nested virtualization**: No

## Installing Prerequisites <a href="#installing-prerequisites" id="installing-prerequisites"></a>

* Java (Ubuntu example, change to your preferred Java version):

<pre data-line-numbers><code><strong>sudo apt -y install openjdk-11-jdk
</strong></code></pre>

* Java (Redhat example, change to your preferred Java version):

{% code lineNumbers="true" %}
```
yum install -y java-11-openjdk-devel
```
{% endcode %}

* Docker (ubuntu example):

{% code overflow="wrap" lineNumbers="true" %}
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
{% endcode %}

{% code overflow="wrap" lineNumbers="true" %}
```
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | 
```
{% endcode %}

{% code overflow="wrap" lineNumbers="true" %}
```
sudo tee /etc/apt/sources.list.d/docker.list > /dev/nullsudo apt update 
sudo apt -y install docker-ce docker-ce-cli containerd.io
```
{% endcode %}

* Docker (Red hat example):

{% code overflow="wrap" lineNumbers="true" %}
```
sudo yum install -y yum-utils
```
{% endcode %}

{% code overflow="wrap" lineNumbers="true" %}
```
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```
{% endcode %}

{% code overflow="wrap" lineNumbers="true" %}
```
sudo yum makecache
```
{% endcode %}

{% code overflow="wrap" lineNumbers="true" %}
```
sudo yum install -y docker-ce docker-ce-cli containerd.io
```
{% endcode %}

## Installing a private location and a private agent <a href="#installing-a-private-location-and-a-private-agent" id="installing-a-private-location-and-a-private-agent"></a>

1. Navigate to **Manage → Private Locations** (Available only for customer admins).

<figure><img src="../../../.gitbook/assets/image (977).png" alt=""><figcaption></figcaption></figure>

2. Click on **Add Private Location** and fill out the form. The locations will appear in **Private Locations**.

<figure><img src="../../../.gitbook/assets/image (978).png" alt=""><figcaption></figcaption></figure>

3. Click on **Add Private Agent** and fill out the form. Download and save the certificates. When an agent is just created it doesn’t have any geolocation. Therefore the agent will appear in **Ungrouped Agents**.

<figure><img src="../../../.gitbook/assets/image (979).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (980).png" alt=""><figcaption></figcaption></figure>

4. Install the required software on the server where the private agent is supposed to be installed.
5. Download the packages from Apica S3 bucket:

* Find actual version[ here (CES download links)](https://app.gitbook.com/o/-LmzGjHypGkPBzYc0fF0/s/-LmzGprckLqwd5v6bs6m/~/changes/1598/platform-docs/synthetic-monitoring-overview/how-to-articles/ces-private-agent-download-links)

6. Upload the RPM or deb package on the server and install it with the following command:

deb package:

{% code overflow="wrap" lineNumbers="true" %}
```
[sudo] dpkg -i apica-private-agent_1.0.1_amd64.deb
```
{% endcode %}

rpm package:

{% code overflow="wrap" lineNumbers="true" %}
```
[sudo] rpm -i apica-private-agent-1.0.1-1.x86_64.rpm
```
{% endcode %}

The agent will be installed to: [`/opt/apica-private-agent`](#user-content-fn-1)[^1]&#x20;

6.  Log out of the agent machine and unzip the certificates archive and upload the certificates to `/opt/apica-private-agent/certificates`. The certificates directory should have the following files: `client.pem` `issuer.pem` `key.pem`

    1. This can be done with the following commands:

    `scp -i "Certfile" client.pem issuer.pem key.pem ubuntu@ec2-11-11-111-11.eu-north-1.compute.amazonaws.com:/tmp/`

    `ssh -i "Certfile" ubuntu@ec2-11-11-111-11.eu-north-1.compute.amazonaws.com 'sudo mkdir -p /opt/apica-private-agent/certificates && sudo mv /tmp/client.pem /tmp/issuer.pem /tmp/key.pem /opt/apica-private-agent/certificates/'`
7. Run the configuration script `/opt/apica-private-agent/configure.sh` You might need to `chmod + x` the file to run it. During the configuration process, you will be asked for the following parameters:
   1. **Websocket host**: npx.ces.apicasystem.com
      1. beta host: npx.ces.beta.apicasystem.com
   2. **Websocket port**: 443
   3. **Username**: Enter whatever you want
   4. **Password**: Enter whatever you want
   5. **Agent ID**: Click **Edit** near the private agent (In ASM) and copy **Agent ID**
   6. **asm\_geoloc**: Copy the Gelocation string from the Private location you want to use (or created previously in ASM)
   7. **asm\_agent\_access\_group**: It can be found on the top right side on the private locations page

<figure><img src="../../../.gitbook/assets/image (981).png" alt=""><figcaption></figcaption></figure>

8. Start **apica-sidecar** with the following command:

{% code overflow="wrap" lineNumbers="true" %}
```
[sudo] systemctl start apica-sidecar
```
{% endcode %}

If you run `systemctl status apica-sidecar` you should see something like this if it is correctly configured:

{% code overflow="wrap" lineNumbers="true" %}
```
Jul 02 10:41:03 ip-172-31-29-9 systemd[1]: Started Apica Sidecar. 
Jul 02 10:41:04 ip-172-31-29-9 java[65288]: 10:41:04.603 [main] INFO c.a.n.sidecar.ApicaSidecarApp - Logger configuration loaded: /opt/apica-private-agent/sidecar> 
Jul 02 10:41:04 ip-172-31-29-9 java[65288]: 10:41:04.614 [main] INFO c.a.n.sidecar.ApicaSidecarApp - Nomad Sidecar is starting, Version: 1.0.7, API Version: V_1 
Jul 02 10:41:04 ip-172-31-29-9 java[65288]: 10:41:04.623 [main] INFO c.a.n.sidecar.ApicaSidecarApp - Configuration loaded: /opt/apica-private-agent/sidecar-config> 
Jul 02 10:41:05 ip-172-31-29-9 java[65288]: 10:41:05.476 [main] INFO c.a.n.s.p.SidecarProxyFactoryImpl - Connecting to Nomad Proxy... 
Jul 02 10:41:06 ip-172-31-29-9 java[65288]: 10:41:06.242 [pool-1-thread-1] INFO c.a.n.sidecar.proxy.SidecarProxy - Sidecar has connected
```
{% endcode %}

9. Start **nomad** node with the following command:

{% code overflow="wrap" lineNumbers="true" %}
```
[sudo] systemctl start nomad
```
{% endcode %}

If you run `systemctl status nomad` you should see something like this if it is correctly configured:

{% code overflow="wrap" lineNumbers="true" %}
```
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:55.593Z [WARN] client.fingerprint_mgr.network: unable to parse speed: path=/usr/sbin/ethtool dev> 
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:55.597Z [WARN] client.fingerprint_mgr.cni_plugins: failed to read CNI plugins directory: cni_pat> 
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:55.632Z [INFO] client.proclib.cg2: initializing nomad cgroups: cores=0-1 
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:55.632Z [INFO] client.plugin: starting plugin manager: plugin-type=csi 
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:55.632Z [INFO] client.plugin: starting plugin manager: plugin-type=driver 
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:55.633Z [INFO] client.plugin: starting plugin manager: plugin-type=device 
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:56.169Z [INFO] client: started client: node_id=asd-adsasdasd-asdas-asdasd 
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:51:56.327Z [INFO] client: node registration complete 
Jul 02 10:52:02 ip-172-31-29-9 nomad[65503]: 2024-07-02T10:52:02.902Z [INFO] client: node registration complete
```
{% endcode %}

10. You might need to open port 15647 (on Red Hat) for nomad to reach apica-sidecar which can done with the following command:

    `[sudo] iptables -I INPUT -p tcp --dport 15647 -j ACCEPT`
11. Make sure that both services are running. After a while, the agent should move from **Ungrouped Agents** to the location that you used in **asm\_geoloc**. If **asm\_geoloc** doesn’t match any existing private location the agent will appear under **Unmapped Locations**.
12. Make sure that the agent has “green” status.
13. Hover over **Location Settings** and click on **Enable** to make the location visible for users. After a while, the location will appear in the location list on the create/edit check pages.

## Set up the services to run on machine reboot <a href="#set-up-the-services-to-run-on-machine-reboot" id="set-up-the-services-to-run-on-machine-reboot"></a>

Run the following two commands:

* `sudo systemctl enable apica-sidecar.service`
* `sudo systemctl enable nomad`

## Private Agent Components <a href="#private-agent-components" id="private-agent-components"></a>

A private agent consists of the following components:

* Check executors
* Apica sidecar
* Nomad node

### Executors <a href="#executors" id="executors"></a>

An executor is a docker container responsible for running specific check types. There are 4 executors:

* **fpr-executor** - browser checks
* **zebratester-executor** - zebratester checks
* **postman-executor** - postman checks
* **runbin-executor** - URLv2, SSL checks, scripted checks, etc

The executors should be uploaded to a docker repository accessible to the private agent.

Nomad mounts the following directories to the container:

* `/opt/apica-private-agent/certificates` → `/runner-certs`
* `/opt/apica-private-agent/runner-config` → `/config`

### Apica Sidecar <a href="#apica-sidecar" id="apica-sidecar"></a>

Apica sidecar is a sidecar application responsible for establishing an HTTP over WebSocket tunnel to Apica SaaS. The tunnel is secured with TLS and JWT.

### Nomad Node <a href="#nomad-node" id="nomad-node"></a>

A nomad node is a nomad client node responsible for running checks. It uses the tunnel provided by Apica Sidecar to connect to Apica’s Nomad cluster.

## Configuring private docker repositories <a href="#configuring-private-docker-repositories" id="configuring-private-docker-repositories"></a>

By default, nomad uses default Apica’s docker hub repository. It might not be available from the location where a private agent is installed. If this is the case you would need to configure your own private repository and upload Apica’s docker images to it.

1. Upload docker images provided by Apica to your docker repository.
2. After the repository is created click on **Repository Settings → Configure Repository** for the location where the repository needs to be used and configure it:

<figure><img src="../../../.gitbook/assets/image (982).png" alt=""><figcaption></figcaption></figure>

3. Set the repository URL that is available for the private agent, repository name, username, and password.
4. Set tags of the uploaded images that are to be used for running checks.
5. Click **Save Repository**
6. Add the repository to other locations if needed by selecting it in the dropdown and click **Save Repository**:

<figure><img src="../../../.gitbook/assets/image (983).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (984).png" alt=""><figcaption></figcaption></figure>

## Enabling/Disabling Private Locations <a href="#enabling-disabling-private-locations" id="enabling-disabling-private-locations"></a>

By default, when a private location is created it is disabled to avoid creating checks in locations that are not ready yet. When a location is ready click **Location Settings → Enable** to make the location visible for users.

A private can be disabled for maintenance. If a location is disabled:

* It’s not shown on create/edit check pages
* Existing checks still work

## Configuring proxy server <a href="#configuring-proxy-server" id="configuring-proxy-server"></a>

A private agent might be behind a proxy server. To make the private agent work with the server fill up the following properties:

1. in `/opt/apica-private-agent/sidecar-config/sidecar.properties`

{% code overflow="wrap" lineNumbers="true" %}
```
# SSL 
ssl.enabled=true 
# Custom TLS Settings 
# Possible cert types: ARCHIVE, FILE 
ssl.certificate.type=FILE 
ssl.certificate.path=/opt/apica-private-agent/certificates/nomad-proxy-ca.pem 
ssl.certificate.password= 

# Proxy Settings 
proxy.enabled=false 
# Possible proxy types: HTTP, SOCKS_V4 or SOCKS_V5 
proxy.type=HTTP 
# Possible auth types: NONE, BASIC, KERBEROS 
proxy.auth.type=NONE 
# Proxy host and port 
proxy.host= 
proxy.port= 
# proxy.auth.type == BASIC 
proxy.username= 
proxy.password= 
# proxy.auth.type == KERBEROS 
proxy.krb.realm= 
proxy.krb.config-path=/etc/krb5.conf 
proxy.krb.config.principal= 
proxy.krb.config.service-principal= 
proxy.krb.config.useKeyTab=true 
proxy.krb.config.keyTab=/opt/apica-private-agent/krb/sidecar.keytab 
proxy.krb.config.refreshKrb5Config=true 
proxy.krb.config.storeKey=true 
proxy.krb.config.use-canonical-hostname=false 
proxy.krb.debug=true
```
{% endcode %}

2. in `/opt/apica-private-agent/runnec-config/appllication.properties`

<pre data-overflow="wrap" data-line-numbers><code># Proxy Settings 
com.apicasystems.checkrunner.proxy.enabled=false 
# Possible proxy types: HTTP, SOCKS_V4 or SOCKS_V5 
com.apicasystems.checkrunner.proxy.type=HTTP 
# Possible auth types: NONE, BASIC, KERBEROS 
com.apicasystems.checkrunner.proxy.auth.type=NONE 
# Proxy host and port 
com.apicasystems.checkrunner.proxy.host= 
com.apicasystems.checkrunner.proxy.port= 
# proxy.auth.type == BASIC 
com.apicasystems.checkrunner.proxy.username= 
com.apicasystems.checkrunner.proxy.password= 
# proxy.auth.type == KERBEROS 
com.apicasystems.checkrunner.proxy.krb.realm= 
<strong>com.apicasystems.checkrunner.proxy.krb.config-path=/config/krb/krb5.conf 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.config.principal= 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.config.service-principal= 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.config.useKeyTab=true 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.config.keyTab=/config/krb/check-runner.keytab 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.config.refreshKrb5Config=true 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.config.storeKey=true 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.config.use-canonical-hostname=false 
</strong><strong>com.apicasystems.checkrunner.proxy.krb.debug=false 
</strong><strong>
</strong><strong># Custom TLS Settings 
</strong><strong>com.apicasystems.checkrunner.tls.enabled=true 
</strong><strong># Possible cert types: ARCHIVE, FILE 
</strong><strong>com.apicasystems.checkrunner.tls.cert-type=FILE 
</strong><strong>com.apicasystems.checkrunner.tls.cert-path=/runner-certs/nomad-proxy-ca.pem 
</strong><strong>com.apicasystems.checkrunner.tls.trust-store-password=
</strong></code></pre>

**Note:** `certificates` and `runner-config` are mounted to the container with the following paths:

`/opt/apica-private-agent/certificates` → `/runner-certs`

`/opt/apica-private-agent/runner-config` → `/config`

## Troubleshooting <a href="#troubleshooting" id="troubleshooting"></a>

#### Apica Sidecar can’t connect to Nomad Proxy <a href="#apica-sidecar-cant-connect-to-nomad-proxy" id="apica-sidecar-cant-connect-to-nomad-proxy"></a>

1. Check `websocket-host` and `websocket-port` in `/opt/apica-private-agent/sidecar-config/sidecar.properties`

#### Apica Sidecar not authorized <a href="#apica-sidecar-not-authorized" id="apica-sidecar-not-authorized"></a>

1. Make sure that directory `/opt/apica-private-agent/certificates` is not empty
2. Make sure that the following properties from `/opt/apica-private-agent/sidecar-config/sidecar.properties` point to the certificates and the key
   * `jwt.client-cert` - client certificate
   * `jwt.issuer-cert` - issuer certificate
   * `jwt.private-key` - private key
3. Make sure that the following properties from `/opt/apica-private-agent/runner-config/application.properties` have the correct names of the certificates and the private key. They will be provided to the container with a volume, therefore only names are needed.
   * `com.apicasystems.checkrunner.client-cert-name` - client certificate
   * `com.apicasystems.checkrunner.ca-cert-name` - issuer certificate
   * `com.apicasystems.checkrunner.client-key-name` - private key
4. If needed reissue certificates in ASM UI

#### Wrong Client Id <a href="#wrong-client-id" id="wrong-client-id"></a>

1. Go to `/opt/apica-private-agent/datadir/client`
2. Make sure that `client-id` has only ASCII text with the following command `file ./client-id`. The output must be something like `./client-id: ASCII text, with no line terminators`
3. If needed delete the file and create it once again with the following command:

{% code overflow="wrap" lineNumbers="true" %}
```
echo -n "{agent_id}" > client-id
```
{% endcode %}

for example:

{% code overflow="wrap" lineNumbers="true" %}
```
echo -n "6350e379-21e9-4921-bf63-3a172d5e95c1" > client-id
```
{% endcode %}

#### Podman is not working <a href="#podman-is-not-working" id="podman-is-not-working"></a>

1. Enable linger for the user

`sudo loginctl enable-linger <username>`

2. Configure `XDG_RUNTIME_DIR` for the user
   1. Switch to the user
   2. Get the user id: `id -u`
   3. Open `~/.bachrc`
   4. Add `export XDG_RUNTIME_DIR=/run/user/<user-id>` save and exit
   5. Apply changes: `source ~/.bashrc`
3. Start and enable podman socker
   1. `systemctl --user start podman.socket`
   2. `systemctl --user enable podman.socket`
4. Init and start podman machine
   1. `podman machine init`
   2. `podman machine start`

#### Resize the partition <a href="#resize-the-partition" id="resize-the-partition"></a>

We might face the issue of low disk space available, so we can resize the partition using following commands

`df -Th /home sudo lvextend -L +10G <path-from-previous-command> sudo xfs_growfs /home`

Here we have added 10Gb of extra space to our home directory

#### Refresh <a href="#refresh" id="refresh"></a>

In case there are some issues and we want to start the installation from scratch, we need to tear down everything. For same, we need to run the following commands

{% code overflow="wrap" lineNumbers="true" %}
```
sudo systemctl stop nomad.service 
sudo systemctl stop apica-sidecar.service 
sudo truncate -s 0 /opt/apica-private-agent/logs/apica-sidecar.log 
sudo truncate -s 0 /opt/apica-private-agent/logs/nomad.log 
sudo rpm -e apica-private-agent 
rm apica-private-agent-1.0.0-1.x86_64.rpm
```
{% endcode %}

Please note that the last command, in the section above, will remove the package from the VM. Hence, to start again we will have to copy the package again to the VM or skip running the command.

[^1]: 
