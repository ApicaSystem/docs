# Deploying Apica Ascent PaaS on MicroK8s

[**MicroK8s**](https://microk8s.io) is a lightweight, pure-upstream Kubernetes aiming to reduce entry barriers for K8s and cloud-native application development. It comes in a single package that installs a single-node (standalone) K8s cluster in under 60 seconds. The lightweight nature of Apica Ascent PaaS enables you to deploy Apica Ascent on lightweight, single-node clusters like MicroK8s. The following guide takes you through deploying Apica Ascent PaaS on MicroK8s.

## Prerequisites

* Ubuntu OS x64 22.04 LTS or RedHat Enterprise Linux 8/9
* 32 vCPU
* 64GB RAM
* 500GB disk space on the root partition

## Installing MicroK8s

The first step in this deployment is to install MicroK8s on your machine.&#x20;

{% tabs %}
{% tab title="Ubuntu" %}
The following instructions pertain to Debian-based Linux systems.

1.  Update package lists by running the following command.

    ```bash
    sudo apt-get -y update
    ```
2.  Install `core` using Snap by running the following command.

    ```
    sudo snap install core
    ```
3.  Install MicroK8s using Snap by running the following command.

    ```bash
    sudo snap install microk8s --classic --channel=1.21/stable
    ```
4.  Join the group created by MicroK8s that enables uninterrupted usage of commands that require admin access by running the following command.

    <pre class="language-bash"><code class="lang-bash"><strong>sudo usermod -a -G microk8s $USER
    </strong></code></pre>
5.  Create the .kube directory.

    ```bash
    mkdir ~/.kube
    ```
6.  Add your current user to the group to gain access to the `.kube` caching directory by running the following command.

    ```bash
    sudo chown -f -R $USER ~/.kube
    ```
7.  Generate your MicroK8s configuration and merge it with your Kubernetes configuration by running the following command.

    ```bash
    sudo microk8s config > ~/.kube/config
    ```
8.  Check whether MicroK8s is up and running with the following command.

    ```bash
    sudo microk8s status
    ```

MicroK8s is now installed on your machine.
{% endtab %}

{% tab title="RHEL" %}
The following instructions pertain to RHEL-based Linux systems.

1.  Update package lists by running the following command.

    we need to use following commands to install microk8s on Red Hat

    ```bash
    sudo yum -y update
    ```

    {% code overflow="wrap" %}
    ```bash
    # Follow the article for installation of [microk8s] (https://snapcraft.io/install/microk8s/rhel)

    # The EPEL repository can be added to RHEL 9 with the following command:

    sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
    sudo dnf upgrade

    # The EPEL repository can be added to RHEL 8 with the following command:

    sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
    sudo dnf upgrade
    ```
    {% endcode %}

    Once you added these repl repos to server we need to run the below commands - Note: If you are running RHEL On-Premises with Red Hat CDN (Connected Environment) where subscription management is handled automatically:

    {% code overflow="wrap" %}
    ```bash
    sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
    sudo yum -y update

    # If you are using RHEL in Disconnected or Air-Gapped Environments
    # like cloud environments AWS, Azure, and Google Cloud then you need to
    # run below commands in order to pull RHEL updates via RHUI:

    sudo yum-config-manager --enable codeready-builder-for-rhel-8-rhui-rpms
    sudo yum-config-manager --enable rhel-8-supplementary-rhui-rpms

    # Enable snapd for installation
    sudo yum install snapd

    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
    ```
    {% endcode %}
2.  Install `core` using Snap by running the following command.

    ```bash
    sudo snap install core

    # In case the core installation gives timeouts or throws any error because
    # snapd socket couldn't activate, then try the following commands to install
    # core successfully:

    sudo dnf install -y epel-release
    sudo dnf update -y
    sudo dnf install -y snapd
    systemctl status snapd.socket
    sudo systemctl disable --now snapd.socket
    sudo systemctl restart snapd
    sudo ln -s /var/lib/snapd/snap /snap
    sudo snap install core
    sudo firewall-cmd --add-service=https --permanent
    sudo firewall-cmd --reload
    sudo snap refresh core
    yum repolist
    sudo snap install core
    ```
3.  Install MicroK8s using Snap by running the following command.

    ```bash
    sudo snap install microk8s --classic --channel=1.21/stable
    ```
4.  Join the group created by MicroK8s that enables uninterrupted usage of commands that require admin access by running the following command.

    <pre class="language-bash"><code class="lang-bash"><strong>sudo usermod -a -G microk8s $USER
    </strong></code></pre>
5.  Create the .kube directory.

    ```bash
    mkdir ~/.kube
    ```
6.  Add your current user to the group to gain access to the `.kube` caching directory by running the following command.

    ```bash
    sudo chown -f -R $USER ~/.kube
    ```
7.  Generate your MicroK8s configuration and merge it with your Kubernetes configuration by running the following command.

    ```bash
    microk8s config > ~/.kube/config
    ```
8.  Check whether MicroK8s is up and running with the following command.

    ```bash
    microk8s status
    ```

MicroK8s is now installed on your machine.
{% endtab %}
{% endtabs %}

## Enabling add-ons

Now that we have MicroK8s up and running, let’s set up your cluster and enable the add-ons necessary such as Helm, CoreDNS, ingress, storage, and private registry. MicroK8s readily provides these addons and can be enabled and disabled at any time. Most of these add-ons are pre-configured to work without any additional setup.

To enable add-ons on your MicroK8s cluster, run the following commands in succession.

1. Enable Helm 3.

```bash
microk8s enable helm3
```

If you get a message telling you have insufficient permissions, a few of the commands above which tried to interpolate your current user into the command with the $USER variable did not work. You can easily fix it by adding your user to the microk8s group by specifying the name of the user explicitly:

```bash
sudo usermod -a -G microk8s ubuntu
sudo chown -R ubuntu ~/.kube
```

2. Enable a default storage class that allocates storage from a host directory.

```bash
microk8s enable storage
```

3. Enable CoreDNS.

```bash
microk8s enable dns
```

4. Enable ingress.

To enable the Ingress controller in MicroK8s, run the following command:

```bash
microk8s enable ingress
```

5. Enable HTTPS (strongly recommended for all production setups)

{% hint style="info" %}
If HTTPS is not configured, the platform can still be accessed over HTTP without installing an SSL certificate on the host.

To enable HTTP access, add the following environment variable to the `coffee-server` service:

`CASDOOR_SECURE_COOKIE=false`
{% endhint %}

How to Create a Self-Signed Certificate using OpenSSL:

*   Create server private key

    ```bash
    openssl genrsa -out cert.key 2048
    ```
*   Create certificate signing request (CSR)

    ```bash
    openssl req -new -key cert.key -out cert.csr
    ```
*   Sign the certificate using the private key and CSR

    ```bash
    openssl x509 -req -days 3650 -in cert.csr -signkey cert.key -out cert.crt
    ```

To create a TLS secret in MicroK8s using `kubectl`, use the following command:

```bash
microk8s kubectl create secret tls https --cert=cert.crt --key=cert.key
```

This command creates a secret named "https" containing the TLS keys for use in your Kubernetes cluster. Ensure you have the `cert.crt` and `cert.key` files in your current directory or specify full paths.

To enable Ingress on microk8s with a default SSL certificate, issue the following command:

```sh
microk8s enable ingress:default-ssl-certificate=secret/https
```

6. Enable private registry.

{% code fullWidth="false" %}
```sh
microk8s enable registry
```
{% endcode %}

7. Copy over your MicroK8s configuration to your Kubernetes configuration with the following command.

{% code fullWidth="false" %}
```shell
microk8s.kubectl config view --raw > $HOME/.kube/config
```
{% endcode %}

## Provisioning an IP address (optional)

{% hint style="info" %}
**Note:** This step is optional and will depend on your individual access needs - for instance, if you need to access the PaaS instance from a certain IP. You can skip this step if you are installing the app locally - in that case, you can access the UI after installation via the machine's public IP address.
{% endhint %}

In this step, we'll provision an endpoint or an IP address where we access Apica Ascent PaaS after deploying it on MicroK8s. For this, we'll leverage [MetalLB](https://metallb.universe.tf/) which is a load-balancer implementation that uses standard routing protocols for bare metal Kubernetes clusters.

{% hint style="info" %}
**Note:** Since MetalLB is available as an add-on for MicroK8s, you can also run these steps while enabling add-ons for your MicroK8s cluster.
{% endhint %}

To provision an IP address, do the following:

1.  Check your local machine's IP address by running the `ifconfig` command, as shown below.

    ```sh
     ifconfig:
     wlp60s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST> mtu 1500
     inet 192.168.1.27 netmask 255.255.255.0 broadcast 192.168.1.255
    ```
2.  Enable MetalLB by running the following command.

    ```sh
     microk8s enable metallb
     Enabling MetalLB
     Enter each IP address range delimited by comma (e.g.     '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 192.168.1.27-192.168.1.27
    ```

{% hint style="info" %}
**Note:** MetalLB will not work on macOS due to network filtering that macOS applies. MetalLB might not work if you're provisioning an EC2 instance on AWS due to your private/public IP configuration.
{% endhint %}

## Installing Apica Ascent PaaS

Now that your MicroK8s environment is configured and ready, we can proceed with installing Apica Ascent PaaS on it. To install Apica Ascent PaaS using Helm, do the following:

1.  Add the Apica Ascent PaaS Helm chart to your Helm repository by running the following command.

    ```
    microk8s helm3 repo add apica-repo https://apicasystem.github.io/apica-ascent-helm
    ```
2.  Update your Helm repository by running the following command.

    ```
    microk8s helm3 repo update
    ```
3.  Create a namespace on MicroK8s on which to install Apica Ascent PaaS.

    <pre data-full-width="true"><code><strong>microk8s kubectl create namespace apica-ascent
    </strong></code></pre>
4. Prepare your values.microk8s.yaml file. You can use the [**starter `values.microk8s.yaml`**](https://raw.githubusercontent.com/ApicaSystem/ApicaHub/refs/heads/master/integrations/microk8s/values.yaml) file we've created to configure your Apica Ascent PaaS deployment. If you need to download the file to your own machine, edit, and then transfer to a remote linux server, use this command:

{% code overflow="wrap" fullWidth="false" %}
```sh
scp -i /path/to/private_key.pem /path/to/local/file username@remote_host:/path/to/remote/directory
```
{% endcode %}

5.  Create a namespace on MicroK8s on which to install Apica Ascent PaaS.

    <pre class="language-bash" data-full-width="true"><code class="lang-bash"><strong>microk8s kubectl create namespace apica-ascent
    </strong></code></pre>

Make sure you have the necessary permissions to copy a file to the specified folder on the Linux machine.

> Optionally, if you are provisioning public IP using Metallb, use the [values.yaml](https://raw.githubusercontent.com/logiqai/logiq-installation/refs/heads/main/values/values.yaml) instead. run the following command.
>
> {% code overflow="wrap" %}
> ```
> microk8s enable metallb
> Enabling MetalLB
> Enter each IP address range delimited by comma (e.g.  '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 192.168.1.27-192.168.1.27
> ```
> {% endcode %}
>
> In the values file, add the below fields global-> environment section with your own values.
>
> ```
> s3_bucket: <your-s3-bucket>
> AWS_ACCESS_KEY_ID: <your-aws-access-key-id>
> AWS_SECRET_ACCESS_KEY: <your-aws-secret-access-key-id>
> ```
>
> In the global -> chart section, change S3gateway to false.
>
> ```
> s3gateway: false
> ```
>
> In the global -> persistence section, change storageClass as below.
>
> ```
> storageClass: microk8s-hostpath
> ```

6. Install Apica Ascent PaaS using Helm with the storage class set to `microk8s-hostpath` with the following command.

{% code overflow="wrap" fullWidth="false" %}
```bash
microk8s helm3 install apica-ascent -n apica-ascent --set global.persistence.storageClass=microk8s-hostpath apica-repo/apica-ascent -f  values.microk8s.yaml  --debug --timeout 10m
```
{% endcode %}

If you see a large wall of text listing configuration values, the installation was successful - Ascent PaaS is now installed in your MicroK8s environment!

**Spin up an internal S3 bucket using minio** - If you are not using S3 cloud related variables in the values.yaml file and want to create an internal S3 bucket, then create a s3-batch.yaml file and execute the below batch job to spin S3 bucket using minio:

Create s3-batch.yaml file and insert the below contents:

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: s3-gateway-make-bucket-job
  namespace: apica-ascent
  labels:
    app: s3gateway-make-bucket-job
    chart: s3gateway-5.0.20
    release: apica-ascent
    heritage: Helm
  annotations:
    "helm.sh/hook": post-install
    "helm.sh/hook-weight": "1"
    "helm.sh/hook-delete-policy": hook-succeeded,before-hook-creation
spec:
  template:
    metadata:
      labels:
        app: s3gateway-job
        release: apica-ascent
    spec:
      restartPolicy: OnFailure

      volumes:
        - name: minio-configuration
          projected:
            sources:
            - configMap:
                name: s3-gateway
            - secret:
                name: s3-gateway
      serviceAccountName: "s3-gateway"
      containers:
      - name: minio-mc
        image: "minio/mc:RELEASE.2020-03-14T01-23-37Z"
        imagePullPolicy: IfNotPresent
        command: ["/bin/sh", "/config/initialize"]
        env:
          - name: MINIO_ENDPOINT
            value: s3-gateway
          - name: MINIO_PORT
            value: "9000"
        volumeMounts:
          - name: minio-configuration
            mountPath: /config
        resources:
          {}
```

Apply the batch job:

```bash
kubectl apply -f s3-batch.yaml
```

Delete the Thanos pods (apica-ascent-thanos-compactor-XXXXXX and apica-ascent-thanos-storegateway-0) so it can created again after applying the s3-batch.yaml:

{% code overflow="wrap" %}
```bash
kubectl delete pod apica-ascent-thanos-storegateway-0 apica-ascent-thanos-compactor-XXXXXX -n apica-ascent
```
{% endcode %}

## Accessing Apica Ascent PaaS

Now that Apica Ascent PaaS is installed on your MicroK8s cluster, you can visit the Apica Ascent PaaS UI by either accessing the MetalLB endpoint we defined in the pre-install steps (if you installed/configured MetalLB), or by accessing the public IP address of the instance over HTTP(S) (if you aren't utilizing MetalLB).

If you are load balancing the hosting across multiple IPs using MetalLB, do the following to access the Apica Ascent PaaS UI:

1.  Inspect the pods in your MicroK8s cluster in the `apica-ascent` namespace by running the following command.

    ```
    microk8s kubectl get pod -n apica-ascent
    ```
2.  Find the exact MetalLB endpoint that's serving the Apica Ascent PaaS UI by running the following command.

    ```
    microk8s kubectl get service -n apica-ascent |grep -i loadbalancer
    ```

    The above command should give you an output similar to the following.

    ```
    logiq-kubernetes-ingress  LoadBalancer   10.152.183.45  192.168.1.27

    80:30537/TCP,20514:30222/TCP,24224:30909/TCP,24225:31991/TCP,2514:30800/TCP,3000:32680/TCP,514:32450/    TCP,7514:30267/TCP,8081:30984/TCP,9998:31425/TCP     18m
    ```
3. Using a web browser of your choice, access the IP address shown by the load balancer service above. For example, `http://192.168.1.27:80`.

If you aren't utilizing MetalLB, you can access the Ascent UI simply by accessing the public IP or hostname of your machine over HTTP(S); you can utilize HTTPS by following the "enabling HTTPS" step in the "Enabling Add-Ons" section above.

You can log into Apica Ascent PaaS using the following default credentials.

* **Username**: `flash-admin@foo.com`
* **Password**: `flash-password`

{% hint style="info" %}
**Note:** You can change the default login credentials after you've logged into the UI.
{% endhint %}

**MicroK8s Networking Note:**\
Services default to host IP using `NodePort`/`ClusterIP`; MetalLB is enabled for explicit `LoadBalancer` use only. Automatic MetalLB IP assignment is disabled.

4\. Deactivates MetalLB, enabling services of type `LoadBalancer` to utilize the host's IP, thereby designating the host as the load

```
microk8s kubectl disable metallb
```

### Troubleshooting

If we have any issues on injecting the logs are something then we have to add new paths that we need to add as part of upgrade of the image, from cli edit the ingress.

```
microk8s kubectl get ingress -n<namespace>
microk8s kubectl edit ingress -n<namespace>
```

Copy the below paths and paste them and save.

````yaml
          - path: /
            pathType: Prefix
            backend:
              service:
                name: coffee
                port:
                  number: 80
          - backend:
              service:
                name: logiq-flash
                port:
                  number: 8080
            path: /live
            pathType: Prefix
          - path: /live
            pathType: Prefix
            backend:
              service:
                name: logiq-flash
                port:
                  number: 8080
          - backend:
              service:
                name: logiq-flash
                port:
                  number: 8080
            path: /ready
            pathType: Prefix
          - backend:
              service:
                name: logiq-flash
                port:
                  number: 9999
            path: /v1/logs
            pathType: Prefix
          - backend:
              service:
                name: logiq-flash
                port:
                  number: 9999
            path: /v1/traces
            pathType: Prefix
          - backend:
              service:
                name: logiq-flash
                port:
                  number: 9999
            path: /v1/metrics
            pathType: Prefix

          - path: /v1/json_batch
            pathType: Prefix
            backend:
              service:
                name: logiq-flash
                port:
                  number: 9999
          - path: /v1/json
            pathType: Prefix
            backend:
              service:
                name: logiq-flash
                port:
                  number: 9999
          - path: /v1/tenant
            pathType: Prefix
            backend:
              service:
                name: logiq-flash
                port:
                  number: 9999
          - path: /api/traces
            pathType: Prefix
            backend:
              service:
                name: logiq-flash
                port:
                  number: 14268
          - path: /v1
            pathType: Prefix
            backend:
              service:
                name: logiq-flash-ml
                port:
                  number: 9999
          - path: /v2
            pathType: Prefix
            backend:
              service:
                name: logiq-flash-ml
                port:
                  number: 9999
          - path: /dtracing
            pathType: Prefix
            backend:
              service:
                name: logiq-flash-ml
                port:
                  number: 16686
          - path: /v1/receive/prometheus
            pathType: Prefix
            backend:
              service:
                name: apica-ascent-thanos-receive
                port:
                  number: 19291
```
````

#### Kubernetes cluster is unreachable

If you see an error message indicating the Kubernetes cluser is unreachable, the Microk8s service has stopped - simply restart it. Error text:

{% code overflow="wrap" %}
```
Error: INSTALLATION FAILED: Kubernetes cluster unreachable: Get "https://127.0.0.1:16443/version": dial tcp 127.0.0.1:16443: connect: connection refused
helm.go:84: [debug] Get "https://127.0.0.1:16443/version": dial tcp 127.0.0.1:16443: connect: connection refused
...
```
{% endcode %}

Solution:

```
ubuntu@ip-172-31-31-72:~$ microk8s status
microk8s is not running. Use microk8s inspect for a deeper inspection.
ubuntu@ip-172-31-31-72:~$ microk8s start
```

#### Restarting the Ascent installation after a failed installation

If the Ascent installation using the supplied .yaml file fails, you must first remove the name in use. Error text:

```
Error: INSTALLATION FAILED: cannot re-use a name that is still in use
helm.go:84: [debug] cannot re-use a name that is still in use
helm.sh/helm/v3/pkg/action.(*Install).availableName
...
```

Solution:

{% code overflow="wrap" %}
```
$ microk8s helm3 uninstall apica-ascent -n apica-ascent
release "apica-asent" uninstalled
$ microk8s helm3 install apica-ascent -n apica-ascent --set global.persistence.storageClass=microk8s-hostpath apica-repo/apica-ascent -f values.microk8s.yaml --debug --timeout 10m
```
{% endcode %}
