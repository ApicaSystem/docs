# Fluent-bit Troubleshooting

#### Useful commands:

* systemctl start fluent-bit
* systemctl stop fluent-bit
* systemctl restart fluent-bit
* systemctl status fluent-bit
* journalctl -u fluent-bit -n 50 --no-pager

#### Error types:

```
[error] [output:http:http.0] no upstream connections available to http/https://<ascent-url>
```

Verify that the Host in fluent-bit.conf does not include http:// or https://, if you use https you also need to specify port 443 and you might have to **set tls to on**

&#x20;

```
[error] could not open parser configuration file, aborting.
```

* Incorrect filepath specified in fluent-bit.conf
* File permissions prevent Fluent Bit from reading it
* A typo in the filename or a missing mount (if running in a container)

```
[engine] caught signal (SIGSEGV)
```

* You can get this error if fluent-bit crashed due to missing configurations or a bug.
* Test your config with: fluent-bit -c /etc/fluent-bit/fluent-bit.conf --dry-run
* If it works you should see configuration test is successful

```
/opt/fluent-bit/bin/fluent-bit -c //etc/fluent-bit/fluent-bit.conf
```

If you see something like this line when you check the fluent-bit status where you can see the typo it can easily be fixed with the following steps:

1. Run: systemctl cat fluent-bit.service\
   You should see something like this:&#x20;

```
ExecStart=/opt/fluent-bit/bin/fluent-bit -c //etc/fluent-bit/fluent-bit.conf
```

2\.        If you see something like a typo as we do in this example run:&#x20;

```
sudo systemctl edit fluent-bit.service
Enter [Service]
ExecStart=
ExecStart=/opt/fluent-bit/bin/fluent-bit -c /etc/fluent-bit/fluent-bit.conf

*This will first clear the old setting and then replace it with the new. 
```

3. Then reload and restart fluent-bit with the following commands:

```
sudo systemctl daemon-reload
sudo systemctl restart fluent-bit
sudo systemctl status fluent-bit
```

{% code overflow="wrap" %}
```
If the parsers.conf filepath is correct and you get configuration test is successful and it still crashes the issue is likely in /var/log/flb_storage_
```
{% endcode %}

Backup files, create a new folder, provide the correct permissions (in this example we run it with the root user):

```
sudo mv /var/log/flb_storage_ /var/log/flb_storage_backup_
sudo mkdir -p /var/log/flb_storage_
sudo chmod 700 /var/log/flb_storage_
sudo chown root:root /var/log/flb_storage_
sudo systemctl restart fluent-bit
sudo journalctl -u fluent-bit -f
```
