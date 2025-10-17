# Config PS

## Configuring Pattern-Signature

Pattern-Signature feature is activated and controlled via the configuration steps below,

1. Go to the “Ingest Configuration” menu item to display the PS configuration fillers.
2. Four rows are used to manage PS features: “PS\_Configure”, “PS\_STREAM\_ENABLE”, “PS\_STEAM\_MAX\_SIZE”, “PS\_TOTAL\_STREAM\_MAX\_SIZE”.

![](../../../.gitbook/assets/ps-cfg-1-2022-06-21_20-36-10.jpg)

#### PS\_STREAM\_MAX\_SIZE

Maximum number of Pattern-Signatures (PS) that each namespace-application log stream can create. The ingestion turns off the Pattern-Signature engine and assigns default null PS id \*6 to that log stream. The default max count is set to 8,000.

#### PS\_TOTAL\_STREAM\_MAX\_SIZE

A maximum number of total Pattern-Signatures (PS) the cluster can create. Once the total maximum count is reached, subsequent log event PS will be set to default PS id \*6. The default max count is set to 20,000.

#### PS\_STREAM\_ENAB <a href="#ps_stream_enable" id="ps_stream_enable"></a>

**\[ ( \<ns> \<app>,)\*]**

\<ns> is the namespace string, a valid namespace specifier.

\<app> is the application name string, a valid application specifier.

#### PS\_CONFIG

Reserved for internal use.

#### PS Id Default Code

* \*3 : Disable PS generation at the top level.
* \*4 : PS feature is turned off from log stream configuration or FlashOps level.
* \*6 : Exceed PS count at either total PS count or per log stream PS count max.
