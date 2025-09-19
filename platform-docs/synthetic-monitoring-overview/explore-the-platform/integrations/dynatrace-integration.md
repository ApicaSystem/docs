# Dynatrace Integration

**Caveat**: each of the following integration directions was based on the UI when it was written. The UIs may change by the time you read this, so _UI updates are beyond the scope of these articles_. Please go to the integration target sites for their latest information on integration directions.

With the Dynatrace integration, you can access stack monitoring information provided by the DynaTrace platform.

When Dynatrace integration has been enabled for a check, the check details view will contain information provided by the Dynatrace client installed on the application server.

## Setup <a href="#dynatraceintegration-setup" id="dynatraceintegration-setup"></a>

The Dynatrace integration is configured by enabling Dynatrace in the application and checking the “**Enable Dynatrace PurePath**” option in the Edit Check menu.



When this **Dynatrace PurePath** option is enabled, a request header is added (overriding any existing header).

Checks can then access the `X-dynaTrace` response header containing the `PurePathID`.

The request header contains Dynatrace information:

```
    X-dynaTrace: ID={unique check run GUID};NA={check name, (%CHECK_NAME%)}
```

Dynatrace responds with a response header containing the PurePathID:

```
    X-dynaTrace:PT=0;PA=78476734;SP=Monitoring;PS=-1701008692.
```

### Check Result Example <a href="#dynatraceintegration-checkresultexample" id="dynatraceintegration-checkresultexample"></a>



### Dynatrace PurePath <a href="#dynatraceintegration-dynatracepurepath" id="dynatraceintegration-dynatracepurepath"></a>

More information: [PurePath Explained](https://www.dynatrace.com/support/doc/appmon/getting-started/purepath-explained/) at Dynatrace Community.
