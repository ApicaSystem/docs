# Installing CES Private Agent (Podman)

A **private agent** is fully managed by a customer yet connected to SaaS. It might be placed in a customer’s network and monitor internal resources unavailable from the Internet.

A **private location** is a group of private agents that are placed in the same geographical location.

### System requirements

**Supported OS:** RedHat 8 or higher, Debian 11 or higher (or compatible systems like Ubuntu and CentOS)

**Containerization:** Podman 3.x (or higher versions)

**Other software:** Java 11 or higher

**Nested virtualization**: Yes

### Installing prerequisites

* Java (example, change to your version):

```
sudo apt -y install openjdk-11-jdk
```

* Podman (ubuntu example):

```
sudo apt -y install podman
```

```
sudo apt -y install qemu-system-x86
```

* gvproxy (ubuntu example):

```
wget https://github.com/containers/gvisor-tap-vsock/releases/download/v0.7.3/gvproxy-linux-amd64
```

Your location may vary below for where to put gvproxy, find the valid one for you in /usr/local/libexec/podman or /usr/local/lib/podman or /usr/libexec/podman or /usr/lib/podman

```
mv gvproxy-linux-amd64 gvproxy
sudo mv gvproxy /usr/libexec/podman/
```

```
sudo chmod +x /usr/libexec/podman/gvproxy
```

* Go to /etc/systemd/system/ and run the following commands:

```
mkdir user@.service.d
```

```
cd user@.service.d
```

```
sudo nano delegate.conf
```

* And place the following in the file:

```
[Service]
Delegate=memory pids cpu cpuset
```

* Reboot the machine to set the new cpu delegation values for all the users.

### Installing a private location and a private agent

1.  Navigate to **Manage → Private Locations** (Available only for customer admins).&#x20;

    <figure><img src="../../../.gitbook/assets/image (1122).png" alt=""><figcaption></figcaption></figure>
2.  Click on **Add Private Location** and fill out the form. The locations will appear in **Private Locations**.&#x20;

    <figure><img src="../../../.gitbook/assets/image (1123).png" alt=""><figcaption></figcaption></figure>
3.  Click on **Add Private Agent** and fill out the form. Download and save the certificates. When an agent is just created it doesn’t have any geolocation. Therefore the agent will appear in **Ungrouped Agents**.&#x20;

    <figure><img src="../../../.gitbook/assets/image (1124).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../../../.gitbook/assets/image (1125).png" alt=""><figcaption></figcaption></figure>
4. Download the packages from Apica S3 bucket:

Find actual version [here (Docs - Download Links)](https://docs.apica.io/platform-docs/synthetic-monitoring-overview/how-to-articles/ces-private-agent-download-links)

5. Upload the RPM or deb package on the server and install it with the following command:

deb package:

```
[sudo] dpkg -i apica-private-agent_1.0.1_amd64.deb
```

rpm package:

```
[sudo] rpm -i apica-private-agent-1.0.1-1.x86_64.rpm
```

The agent will be installed to /opt/apica-private-agent

6. Log out of the agent machine and unzip the certificates archive and upload the certificates to /opt/apica-private-agent/certificates. The certificates directory should have the following files: client.pem issuer.pem key.pem
   1. This can be done with the following commands:
      1.  ```
          scp -i "Certfile" client.pem issuer.pem key.pem ubuntu@ec2-11-11-111-11.eu-north-1.compute.amazonaws.com:/tmp/
          ```

          ```
          ssh -i "Certfile" ubuntu@ec2-11-11-111-11.eu-north-1.compute.amazonaws.com 'sudo mkdir -p /opt/apica-private-agent/certificates && sudo mv /tmp/client.pem /tmp/issuer.pem /tmp/key.pem /opt/apica-private-agent/certificates/'
          ```
7. Run the configuration script /opt/apica-private-agent/configure.sh You might need to chmod + x the file to run it. During the configuration process, you will be asked for the following parameters:
   1. **Websocket host**: [npx.ces.apicasystem.com](http://npx.ces.beta.apicasystem.com)
   2. **Websocket port**: 443
   3. **Username**: Enter whatever you want (but remember this username, we’ll need it for later)
   4. **Password**: Enter whatever you want (but remember this password, we’ll need it for later)
   5. **Agent ID**: Click **Edit** near the private agent (In ASM) and copy **Agent ID**
   6. **asm\_geoloc**: Copy the Gelocation string from the Private location you want to use (or created previously in ASM)
   7.  **asm\_agent\_access\_group**: It can be found on the top right side on the private locations page&#x20;

       <figure><img src="../../../.gitbook/assets/image (1126).png" alt=""><figcaption></figcaption></figure>
8. Log in as the user you created or specified during the configuring.
   1. ```
      su <username>
      ```
9. Run the following command and remember the ID.
   1. ```
      id -u
      ```
10. Open the bashrc file using nano \~/.bashrc and add the following to the end of the file (replace \<user-id> with the ID from the step above):
    1. ```
       export XDG_RUNTIME_DIR=/run/user/<user-id>
       ```
11. Verify that it’s working by running the following:
    1. ```
       source ~/.bashrc
       echo $XDG_RUNTIME_DIR
       ```
12. Log out of the user by running exit and then enable lingering for the user running podman with the following command (replace \<username or id> with the username of the user or the ID from the above step):
    1. ```
       sudo loginctl enable-linger <username or id>
       ```
13. Log back into the user using su \<username> and enable the podman socket:
    1. ```
       systemctl --user start podman.socket
       systemctl --user enable podman.socket
       ```
14. Start podman:
    1. ```
       podman machine init
       podman machine start
       ```
    2. You may get an error or two but that’s fine if you’ve followed the guide. If it says “Killed” after podman machine init then you’re not running on a machine supporting nested virtualization.
15. Start **apica-sidecar** with the following command:

```
[sudo] systemctl start apica-sidecar
```

If you run systemctl status apica-sidecar you should see something like this if it is correctly configured:

```
Jul 02 10:41:03 ip-172-31-29-9 systemd[1]: Started Apica Sidecar.
Jul 02 10:41:04 ip-172-31-29-9 java[65288]: 10:41:04.603 [main] INFO  c.a.n.sidecar.ApicaSidecarApp - Logger configuration loaded: /opt/apica-private-agent/sidecar>
Jul 02 10:41:04 ip-172-31-29-9 java[65288]: 10:41:04.614 [main] INFO  c.a.n.sidecar.ApicaSidecarApp - Nomad Sidecar is starting, Version: 1.0.7, API Version: V_1
Jul 02 10:41:04 ip-172-31-29-9 java[65288]: 10:41:04.623 [main] INFO  c.a.n.sidecar.ApicaSidecarApp - Configuration loaded: /opt/apica-private-agent/sidecar-config>
Jul 02 10:41:05 ip-172-31-29-9 java[65288]: 10:41:05.476 [main] INFO  c.a.n.s.p.SidecarProxyFactoryImpl - Connecting to Nomad Proxy...
Jul 02 10:41:06 ip-172-31-29-9 java[65288]: 10:41:06.242 [pool-1-thread-1] INFO  c.a.n.sidecar.proxy.SidecarProxy - Sidecar has connected
```

16. Start **nomad** node with the following command:

```
[sudo] systemctl start nomad
```

If you run systemctl status nomad you should see something like this if it is correctly configured:

```
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:55.593Z [WARN]  client.fingerprint_mgr.network: unable to parse speed: path=/usr/sbin/ethtool dev>
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:55.597Z [WARN]  client.fingerprint_mgr.cni_plugins: failed to read CNI plugins directory: cni_pat>
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:55.632Z [INFO]  client.proclib.cg2: initializing nomad cgroups: cores=0-1
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:55.632Z [INFO]  client.plugin: starting plugin manager: plugin-type=csi
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:55.632Z [INFO]  client.plugin: starting plugin manager: plugin-type=driver
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:55.633Z [INFO]  client.plugin: starting plugin manager: plugin-type=device
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:56.169Z [INFO]  client: started client: node_id=asd-adsasdasd-asdas-asdasd
Jul 02 10:51:56 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:51:56.327Z [INFO]  client: node registration complete
Jul 02 10:52:02 ip-172-31-29-9 nomad[65503]:     2024-07-02T10:52:02.902Z [INFO]  client: node registration complete
```

17. You might need to open port 15647 (on Red Hat) for nomad to reach apica-sidecar which can done with the following command:

    ```
    [sudo] iptables -I INPUT -p tcp --dport 15647 -j ACCEPT
    ```
18. Make sure that both services are running. After a while, the agent should move from **Ungrouped Agents** to the location that you used in **asm\_geoloc**. If **asm\_geoloc** doesn’t match any existing private location the agent will appear under **Unmapped Locations**.
19. Make sure that the agent has “green” status.
20. Hover over **Location Settings** and click on **Enable** to make the location visible for users. After a while, the location will appear in the location list on the create/edit check pages.

### Set up the services to run on machine reboot

Run the following two commands:

* sudo systemctl enable apica-sidecar.service
* sudo systemctl enable nomad

### Private Agent Components

A private agent consists of the following components:

* Check executors
* Apica sidecar
* Nomad node

#### Executors

An executor is a docker container responsible for running specific check types. There are 4 executors:

* **fpr-executor** - browser checks
* **zebratester-executor** - zebratester checks
* **postman-executor** - postman checks
* **runbin-executor** - URLv2, SSL checks, scripted checks, etc

The executors should be uploaded to a docker repository accessible to the private agent.

Nomad mounts the following directories to the container:

* /opt/apica-private-agent/certificates → /runner-certs
* /opt/apica-private-agent/runner-config → /config

#### Apica Sidecar

Apica sidecar is a sidecar application responsible for establishing an HTTP over WebSocket tunnel to Apica SaaS. The tunnel is secured with TLS and JWT.

#### Nomad Node

A nomad node is a nomad client node responsible for running checks. It uses the tunnel provided by Apica Sidecar to connect to Apica’s Nomad cluster.

### Configuring private docker repositories

By default, nomad uses default Apica’s docker hub repository. It might not be available from the location where a private agent is installed. If this is the case you would need to configure your own private repository and upload Apica’s docker images to it.

1. Upload docker images provided by Apica to your docker repository.
2.  After the repository is created click on **Repository Settings → Configure Repository** for the location where the repository needs to be used and configure it:&#x20;

    <figure><img src="../../../.gitbook/assets/image (1127).png" alt=""><figcaption></figcaption></figure>
3. Set the repository URL that is available for the private agent, repository name, username, and password.
4. Set tags of the uploaded images that are to be used for running checks.
5. Click **Save Repository**
6.  Add the repository to other locations if needed by selecting it in the dropdown and click **Save Repository**:&#x20;

    <figure><img src="../../../.gitbook/assets/image (1128).png" alt=""><figcaption></figcaption></figure>



    <figure><img src="../../../.gitbook/assets/image (1129).png" alt=""><figcaption></figcaption></figure>

### Enabling/Disabling Private Locations

By default, when a private location is created it is disabled to avoid creating checks in locations that are not ready yet. When a location is ready click **Location Settings → Enable** to make the location visible for users.

A private can be disabled for maintenance. If a location is disabled:

* It’s not shown on create/edit check pages
* Existing checks still work

### Configuring proxy server

A private agent might be behind a proxy server. To make the private agent work with the server fill up the following properties:

1. in /opt/apica-private-agent/sidecar-config/sidecar.properties

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

2. in /opt/apica-private-agent/runnec-config/appllication.properties

```
# Proxy Settings
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
com.apicasystems.checkrunner.proxy.krb.config-path=/config/krb/krb5.conf
com.apicasystems.checkrunner.proxy.krb.config.principal=
com.apicasystems.checkrunner.proxy.krb.config.service-principal=
com.apicasystems.checkrunner.proxy.krb.config.useKeyTab=true
com.apicasystems.checkrunner.proxy.krb.config.keyTab=/config/krb/check-runner.keytab
com.apicasystems.checkrunner.proxy.krb.config.refreshKrb5Config=true
com.apicasystems.checkrunner.proxy.krb.config.storeKey=true
com.apicasystems.checkrunner.proxy.krb.config.use-canonical-hostname=false
com.apicasystems.checkrunner.proxy.krb.debug=false

# Custom TLS Settings
com.apicasystems.checkrunner.tls.enabled=true
# Possible cert types: ARCHIVE, FILE
com.apicasystems.checkrunner.tls.cert-type=FILE
com.apicasystems.checkrunner.tls.cert-path=/runner-certs/nomad-proxy-ca.pem
com.apicasystems.checkrunner.tls.trust-store-password=
```

**Note:** certificates and runner-config are mounted to the container with the following paths:

/opt/apica-private-agent/certificates → /runner-certs

/opt/apica-private-agent/runner-config → /config

### Troubleshooting

#### Apica Sidecar can’t connect to Nomad Proxy

1. Check websocket-host and websocket-port in /opt/apica-private-agent/sidecar-config/sidecar.properties

#### Apica Sidecar not authorized

1. Make sure that directory /opt/apica-private-agent/certificates is not empty
2. Make sure that the following properties from /opt/apica-private-agent/sidecar-config/sidecar.properties point to the certificates and the key
   * jwt.client-cert - client certificate
   * jwt.issuer-cert - issuer certificate
   * jwt.private-key - private key
3. Make sure that the following properties from /opt/apica-private-agent/runner-config/application.properties have the correct names of the certificates and the private key. They will be provided to the container with a volume, therefore only names are needed.
   * com.apicasystems.checkrunner.client-cert-name - client certificate
   * com.apicasystems.checkrunner.ca-cert-name - issuer certificate
   * com.apicasystems.checkrunner.client-key-name - private key
4. If needed reissue certificates in ASM UI

#### Wrong Client Id

1. Go to /opt/apica-private-agent/datadir/client
2. Make sure that client-id has only ASCII text with the following command file ./client-id. The output must be something like ./client-id: ASCII text, with no line terminators
3. If needed delete the file and create it once again with the following command:

```
echo -n "{agent_id}" > client-id
```

for example:

```
echo -n "6350e379-21e9-4921-bf63-3a172d5e95c1" > client-id
```

#### Podman is not working

1. Enable linger for the user

```
sudo loginctl enable-linger <username>
```

2. Configure XDG\_RUNTIME\_DIR for the user
   1. Switch to the user
   2. Get the user id: id -u
   3. Open \~/.bachrc
   4. Add export XDG\_RUNTIME\_DIR=/run/user/\<user-id> save and exit
   5. Apply changes: source \~/.bashrc
3. Start and enable podman socker
   1. systemctl --user start podman.socket
   2. systemctl --user enable podman.socket
4. Init and start podman machine
   1. podman machine init
   2. podman machine start

#### Resize the partition

We might face the issue of low disk space available, so we can resize the partition using following commands

```
df -Th /home
sudo lvextend -L +10G <path-from-previous-command>
sudo xfs_growfs /home
```

Here we have added 10Gb of extra space to our home directory

#### Refresh

In case there are some issues and we want to start the installation from scratch, we need to tear down everything. For same, we need to run the following commands

```
sudo systemctl stop nomad.service
sudo systemctl stop apica-sidecar.service
sudo truncate -s 0 /opt/apica-private-agent/logs/apica-sidecar.log
sudo truncate -s 0 /opt/apica-private-agent/logs/nomad.log
sudo rpm -e apica-private-agent
rm apica-private-agent-1.0.0-1.x86_64.rpm
```

Please note that the last command, in the section above, will remove the package from the VM. Hence, to start again we will have to copy the package again to the VM or skip running the command.
