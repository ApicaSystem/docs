# Adding an Agent Type Installation Package

## Structure of the Package Directories:

<figure><img src="../../.gitbook/assets/image (1033).png" alt=""><figcaption></figcaption></figure>

The _packages_ directory contains a list of agent\_type package directories. There are 2 directories for each agent type. One starting with a .(dot/period) and the other without it.  The directory starting without the dot contains a zip file of the contents of the `<agent-type>_<package-version>` directory that is placed within the directory beginning with a .(period/dot).&#x20;

> Note: The package directory for an agent\_type starting with a .(dot/period) is not fetched by Apica's Fleet Control Plane, it is used as a reference to what is actually within the zip file. All updates can made here and then zipped. The zip file should then be moved to the other package directory that is not starting without a .(dot/period). Apica's Fleet control plane fetchs only the directory starting without a .(period/dot). &#x20;

The package directory for an agent\_type follows the following package structure:

```
.<agent-type>/
└── <platform>/
    └── <agent-type>_<package-version>/
        ├── checkmd5
        ├── install.sh
        └── uninstall.sh 
```

The `checkmd5` , `install.sh` , and `uninstall.sh` should be given executable permission and zipped together. The following is the structure of the package directory that Apica Fleet uses:

```
<agent-type>/
└── <platform>/
    └── <agent-type>_<package-version>.zip
```

## Package Install Script:

The Package install script is executed by Fleet when the agent manager is first set up in an environment or when there is a package update initiated through the Fleet UI.

The install script should achieve the following to establish a working agent:

1. Create a directory where the agent's binary should be placed. The path of the binary should match the  `executable` field declared in the `<agent_type>.yaml`  file.
2. Download the agent binary from the agent's official releases or downloads page. This is often in the form of a zip file or a tarball, and has a few extra documentation files or a default configuration file.
3. Perform a [CheckMD5 hash comparison](adding-an-agent-type-installation-package.md#checkmd5-hash-comparison). Proceed only if the verification passes; exit with code `1` otherwise.
4. Extract the contents.&#x20;
5. Rename the binary if required (should match the executable path mentioned in the `<agent_type>.yaml` file).
6. Create a configuration directory (preferrable with the following format: _/etc/\<agent\_type>_).
7. Add any additional steps specific to the agent's smooth execution.

Below is an example of a Grafana Alloy&#x20;

```
/#!/bin/sh

DIR=$PWD

mkdir -p /opt/grafana-alloy/bin/

cd /opt/grafana-alloy/bin/

wget -O alloy-1.4.1.zip https://github.com/grafana/alloy/releases/download/v1.4.1/alloy-linux-amd64.zip
if $DIR/checkmd5 --hash=84dc0915b84ad3755325b527c03e361970a10183a08feb4ba55dd0c10425a7e4628a7d8b9aa708a6522ebbcef60f0af65fe38a4e50d55a0f486f550ae36cafdb --file=alloy-1.4.1.zip; then
    sudo apt-get install unzip;
    unzip alloy-1.4.1.zip;
    mv alloy-linux-amd64 grafana-alloy;
    chmod +x grafana-alloy;
    mkdir -p /etc/grafana-alloy/;
    cd /etc/grafana-alloy;
    touch index.log;
else
    echo "Downloaded package files do not match checksum";
    exit 1;
fi
```



## Package Uninstall script:

The package uninstall script is a very simple script file executed when there is a delete command issued through the Fleet UI. The main intention of this file should be to:

1. Remove the agent's binary
2. Perform any clean-ups, if required.

Below is the uninstall script for the Grafana Alloy agent.&#x20;

```
#!/bin/sh

rm -rf /opt/grafana-alloy
```

### CheckMD5 Hash Comparison:

To verify the integrity of an input file, use the `CheckMD5` binary by providing the expected MD5 hash. If the provided hash does not match the actual hash of the file, `CheckMD5` will return the file’s actual hash value.

When generating the installation script, you can determine the correct MD5 hash by intentionally passing an incorrect hash along with a valid input file (e.g., a `.zip` or `.tar.gz` archive). The verification will fail and `CheckMD5` will output the actual MD5 hash of the file, which can then be used for future validations.
