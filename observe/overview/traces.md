# Traces

Apica Ascent ingests traces and logs from OpenTelemetry collector and Jaeger agent. It implements scalable streaming and indexing of spans, traces and logs directly to any object storage. Users can **search** and **visualize** **spans**, **traces**, and **logs** using a simple intuitive **built-in UI**. Our UI borrows several key aspects from the Jaeger UI project while integrating it seamlessly with Apica Ascent's infinitely scalable InstaStore backend built on top of object storage.

### Finding Traces

In the Apica Ascent UI, navigate to _Traces_ under _Explore_ in the navigational menu.

![Traces navigational menu](<../../.gitbook/assets/Screen Shot 2022-07-12 at 5.08.14 PM.png>) ![Search for Tracens and Spans](<../../.gitbook/assets/Screen Shot 2022-07-12 at 5.08.39 PM.png>)

You can now search for traces by _Service_ and _Operation_ name as well as _tags_

![Searching by Operation and Service](<../../.gitbook/assets/Screen Shot 2022-07-12 at 5.11.50 PM.png>) ![Looking at a trace](<../../.gitbook/assets/Screen Shot 2022-07-12 at 5.12.09 PM.png>)

You can also click _Analyze_ and get the full span and logs for the trace for download.

![Analyze to go to get and download all data for a trace](<../../.gitbook/assets/Screen Shot 2022-07-12 at 5.12.29 PM.png>)

![](<../../.gitbook/assets/Screen Shot 2022-07-12 at 5.14.04 PM.png>)
