# Fortinet FortiGate Firewall Logs

You can integrate Apica Flow with your FortiGate Firewall to forward either all or selected logs to Apica Ascent using the firewall's built-in syslog forwarding capabilities.

## Configuration

Drop into the firewall CLI and switch to the log syslogd configuration page

```
config log syslogd setting
```

![Fortigate Firewall configuration](<../../.gitbook/assets/Screen Shot 2022-05-30 at 11.02.18 AM.png>)

## Syslogd forwarding

Once in the syslogd configuration settings, set the following to enable forwarding to Apica Flow

```
set status enable
set server <IP/FQDNS of Apica Ascent Server here>
set mode reliable
set facility local1
set format rfc5424
```

## Log Filtering configurations

For the log forwarding to work, you may need to tweak additional settings such as filtering (see example below - in this configuration, all log-level debug and above are configured to be sent to Apica Flow):

```
FGTAWSX5HFDA6I36 # config log syslogd filter

FGTAWSX5HFDA6I36 (filter) # show
config log syslogd filter
    set severity debug
end

FGTAWSX5HFDA6I36 (filter) # 
```

Additional filtering options can be found under the _**Log & Report**_ section in the UI:

![](<../../.gitbook/assets/Screen Shot 2022-05-30 at 11.12.11 AM.png>)

### Key Validation Steps:

* Set severity to _**warning**_ or _**error**_ at the FortiGate filter for traffic logs, and reserve _**debug**_ for security event and authentication log categories only — use separate _**syslogd filter**_ configs per log type
* Confirm Apica Flow's syslog receiver is configured with octet-counting enabled for RFC5424 over TCP
* Enable TLS on the syslog connection (port 6514, mutual TLS with certificate pinning)
* Assign distinct facility codes per FortiGate appliance to enable per-source routing in Flow
* Use separate syslogd destinations per log category (traffic, event, security) rather than a single catch-all stream
