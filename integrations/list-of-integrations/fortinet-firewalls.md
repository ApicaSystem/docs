# FortiNet Firewalls

You can integrate Apica Ascent with your FortiGate Firewall to forward either all or selected logs to Apica Ascent using the firewall's built-in syslog forwarding capabilities.

## Configuration

Drop into the firewall CLI and switch to the log syslogd configuration page

```
config log syslogd setting
```

![Fortigate Firewall configuration](<../../.gitbook/assets/Screen Shot 2022-05-30 at 11.02.18 AM.png>)

## Syslogd forwarding

Once in the syslogd configuration settings, set the following to enable forwarding to Apica Ascent

```
set status enable
set server <IP/FQDNS of Apica Ascent Server here>
set mode reliable
set facility local1
set format rfc5424
```

## Log Filtering configurations

For the log forwarding to work, you may need to tweak additional settings such as filtering. E.g. in the below configuration all logs level debug and above are configured to be sent to Apica Ascent

```
FGTAWSX5HFDA6I36 # config log syslogd filter

FGTAWSX5HFDA6I36 (filter) # show
config log syslogd filter
    set severity debug
end

FGTAWSX5HFDA6I36 (filter) # 
```

Additional filtering options can be found under the _Log & Report_ section in the UI

![](<../../.gitbook/assets/Screen Shot 2022-05-30 at 11.12.11 AM.png>)
