# Collect Logs with Rsyslog

### Install Rsyslog

1.  **For Debian/Ubuntu:**

    ```
    sudo apt update
    sudo apt install rsyslog
    ```
2.  **For RHEL/CentOS:**

    ```
    sudo yum install rsyslog
    sudo systemctl enable rsyslog
    sudo systemctl start rsyslog
    ```

Verify that rsyslog is running:

```
sudo systemctl status rsyslog
```

### Configure forwarding

Edit the rsyslog configuration file (usually /etc/rsyslog.conf or /etc/rsyslog.d/\*.conf).

1.  Open the configuration file:

    ```
    sudo nano /etc/rsyslog.conf
    ```
2.  Enable TCP forwarding by adding \*.\* @@remote-server-ip:514 to the config:

    ```
    # /etc/rsyslog.conf configuration file for rsyslog
    #
    # For more information install rsyslog-doc and see
    # /usr/share/doc/rsyslog-doc/html/configuration/index.html
    #
    # Default logging rules can be found in /etc/rsyslog.d/50-default.conf


    #################
    #### MODULES ####
    #################

    *.* @@<YOUR-ASCENT-ENV>:514
    ```
3.  Save your changes and restart rsyslog

    ```
    sudo systemctl restart rsyslog
    ```

### Verify ingestion in Ascent

On your server, use **logger** to log a custom message which you can track easily in order to verify ingestion has been successful.

1.  Use the logger command to trigger a custom log entry:

    ```
    logger "This is a test message from $(hostname)"
    ```

    _It might take a slight moment for this entry to appear in the Ascent platform, so if it doesn’t show up immediately, give it a moment and check again._
2. In your Ascent platform, navigate to **Explore > Logs & Insights**
3. In the filter view, search for namespace **default\_namespace**. Then look for your username which generated the custom log entry, and click on it.
4. This view should only display the custom log entry generated earlier
