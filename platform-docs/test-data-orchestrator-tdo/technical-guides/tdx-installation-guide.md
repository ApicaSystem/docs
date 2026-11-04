# TDX Installation Guide

{% hint style="info" %}
Test Data Orchestrator (TDO) has been re-branded to Wayfinder as of Q1 2026. These documents are currently being re-written to reflect that change. Test Data Orchestrator / TDO / Wayfinder all refer to the same product throughout these documents.
{% endhint %}

### Test Data Extractor (TDX) Installation Guide

### Download the Software

TDX is downloaded from [https://storage.googleapis.com/data\_extractor/orson-data-extractor.jar](https://storage.googleapis.com/data_extractor/orson-data-extractor.jar) .

TDX should be run on a Windows-based server. We do not recommend trying to run it from a Linux/Unix based server.

### Create the Directory(s)

Create a directory under ‘Program Files’ for the software. We recommend ‘Data Extractor’ or ‘TDX’ as the directory name.

Create a sub-directory under this labelled ‘Profiles’. This is the directory that you will store saved profiles in.

Place the downloaded file in this directory.

### Start TDX

To start TDX, open a terminal window from the windows start menu.

Right-click the windows icon in your taskbar and select ‘Terminal’.

<figure><img src="../../../.gitbook/assets/image (518).png" alt=""><figcaption><p>Windows Terminal selection</p></figcaption></figure>

In the terminal window, change the directory to your Data Extractor directory.

Then enter the command :

java -jar orson-data-extractor.jar -gui \<Enter>

<figure><img src="../../../.gitbook/assets/image (519).png" alt=""><figcaption><p>TDX start command</p></figcaption></figure>

This will open the TDX application.

<figure><img src="../../../.gitbook/assets/image (520).png" alt=""><figcaption><p>TDX Application</p></figcaption></figure>

Refer to the TDX User Guide for instructions on using this application.
