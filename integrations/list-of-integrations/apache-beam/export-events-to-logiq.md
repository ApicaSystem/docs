# Export Events to Apica Ascent

Using the[Apica Ascent IO Connector](https://github.com/logiqai/logiq-io), We can easily stream our data to Apica Ascent for further processing.

Let's look at this by going over the sample starter repository provided [here](https://github.com/logiqai/logiqio-apache-beam-starter).

<pre class="language-java"><code class="lang-java"><strong>// Main.java
</strong>
<strong>package ai.logiq.example;
</strong>
import logiqio.LogiqError;
import logiqio.LogiqIO;
import org.apache.beam.sdk.Pipeline;
import org.apache.beam.sdk.transforms.Create;
import org.apache.beam.sdk.transforms.MapElements;
import org.apache.beam.sdk.transforms.SimpleFunction;

class PrintElement extends SimpleFunction&#x3C;LogiqError, String> {
    @Override
    public String apply(LogiqError input) {
        System.out.println(input != null ? input.getResponse() : "");
        return input != null ? input.getResponse() : "";
    }
}

public class Main {
    public static void main(String[] args) {
        var pipeline = Pipeline.create();

        var logLines = Create.of(
                "FileNotFoundError: [Errno 2] No such file or directory: '/app/stats'",
                "[2023-03-16 08:22:20,583][PID:10737][ERROR][root] prometheus alert manager error: connection error or timeout",
                "[2023-03-16 08:22:20,585][PID:10737][INFO][werkzeug] 127.0.0.1 - - [16/Mar/2023 08:22:20] \"GET /api/alerts HTTP/1.1\" 200",
                "INFO[2023-03-16T12:58:41.004021186+05:30] SyncMetadata Complete                         File=trigger.go Line=109 SleepTime=521 Took=2.180907ms",
                "INFO[2023-03-16T13:00:14.452461041+05:30] License Manager doing license test            File=server.go Line=287",
                "INFO[2023-03-16T13:00:48.438338692+05:30] Running GC - Final GC                         File=gc.go Line=273",
                "INFO[2023-03-16T13:00:48.44403175+05:30] Running GC - Final GC: Total id's processed:34  File=gc.go Line=312",
                "INFO[2023-03-16T13:00:48.444231874+05:30] Running GC - Final GC: cleaned up 0 files in total  File=gc.go Line=313",
                "INFO[2023-03-16T13:01:50.438244706+05:30] Running GC - MarkforGC                        File=gc.go Line=317",
                "INFO[2023-03-16T13:01:50.440538077+05:30] Running GC - MarkforGC: Total id's processed:0  File=gc.go Line=344"
        );

        var local_endpoint = "http://localhost:9999/v1/json_batch";
        var ingest_token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2Nlc3MiOltdLCJhdWQiOiJsb2dpcS1jbGllbnRzIiwianRpIjoiZGI2YmM2MTUtYjQ4OS00YTFjLWI3ZWEtYzMxZjhiMDYwMGNkIiwiaWF0IjoxNjc4OTU0NzA1LCJpc3MiOiJsb2dpcS1jb2ZmZWUtc2VydmVyIiwibmJmIjoxNjc4OTU0NzA1LCJzdWIiOiJrZXZpbmRAbG9naXEuYWkiLCJVaWQiOjEsInJvbGUiOiJhZG1pbiJ9.Xkw-GlS08Wzut-A5_hFtL6T92g2oVjY2dSYQfv6FtgjeCPPOTCPGkl9fygIDxZSUiJV70JfqXDlWm277xxRa-jsAfKDN9Lc5TV_MmLjxi6AAS_UQkbUhuqJSygrjC2WKH6S0CRX8wffeWfG0Vp5g6fFA6hNLibhg0RL-zFmcTr47c3CuXL9E88ygfLhUvCIEkVHLLMnE4DL5Dj3mB9yY8v2Iw3Wl-ZrVmyJXOsgdKo4iyf_PYHSNUTnB2WhvRp3Qe1dxFeXx9u8xNmDGzYyvSpwQEWSVM3l4QD5aLjIP53xF6ki_XT_KWr86oaTtYmEy69Nu8CSQFaLw3EohGBUwIg";
        pipeline.apply("Add Elements", logLines).apply(new Transformer()).apply(new LogiqIO.Write(local_endpoint, ingest_token)).apply(MapElements.via(new PrintElement()));

        pipeline.run().waitUntilFinish();
    }
}
</code></pre>

As you can see in this, we have simulated a pipeline flow with sample log lines as our input which will then be pushed to Apica Ascent.

### Transforming the Logs to LogiqEvent.

We can not simply push the log lines to Apica Ascent. Instead, we first need to transform the log lines to LogiqEvent(s). Here is the `Transformer()` class that handles the transformations.

```java
// Transformer.java
package ai.logiq.example;

import logiqio.LogiqEvent;
import org.apache.beam.sdk.transforms.PTransform;
import org.apache.beam.sdk.transforms.ParDo;
import org.apache.beam.sdk.values.PCollection;

public class Transformer extends PTransform<PCollection<String>, PCollection<LogiqEvent>> {
    @Override
    public PCollection<LogiqEvent> expand(PCollection<String> input) {
        return input.apply(ParDo.of(new TransformEvent()));
    }
}
```

```java
// TransformEvent.java
package ai.logiq.example;

import logiqio.LogiqEvent;
import org.apache.beam.sdk.transforms.DoFn;

class Config {
    public static String namespace = "ns";
    public static String host = "test-env";
    public static String appName = "test-app";
    public static String clusterID = "test-cluster";
}

public class TransformEvent extends DoFn<String, LogiqEvent> {
    @ProcessElement
    public void processElement(@Element String element, OutputReceiver<LogiqEvent> receiver) {
        LogiqEvent event = new LogiqEvent()
                .withAppName(Config.appName)
                .withTimestamp(0)
                .withClusterId(Config.clusterID)
                .withHost(Config.host)
                .withAppName(Config.appName)
                .withNamespace(Config.namespace)
                .withMessage(element);

        receiver.output(event);
    }
}
```

Once, we have successfully transformed the log lines to LogiqEvent(s), we can now use the LOGIQ-IO Connector to export these LogiqEvent(s) to our Apica Ascent Instance.

### Writing to Apica Ascent

```
.apply(new LogiqIO.Write(local_endpoint, ingest_token))
```

Specify the ingest endpoint and your ingest token. You can find the ingest token in your Apica Ascent Settings.

Hooray, you should now be able to see logs flowing into Apica Ascent from your Pipeline with `namespace="ns", host="test-env", appName="test-app" and clusterId as "test-cluster"`.

<figure><img src="../../../.gitbook/assets/image (233).png" alt=""><figcaption></figcaption></figure>
