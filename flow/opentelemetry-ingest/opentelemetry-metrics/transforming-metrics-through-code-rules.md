# Transforming Metrics through Code Rules

## OTLP Metric Code Rule Examples

Here are common patterns to help you enrich, clean, or modify incoming OTLP-formatted metrics.

***

#### &#x20;1. **Add Custom Attribute to All Gauge Metrics**

```javascript
const u = ascent.decode.unflatten(Event);

u.resourceMetrics.forEach((rm) => {
    rm.scopeMetrics.forEach((sm) => {
        sm.metrics.forEach((m) => {
            if (m.gauge) {
                m.gauge.dataPoints.forEach((dp) => {
                    dp.attributes ||= [];
                    dp.attributes.push({
                        key: "env",
                        value: { stringValue: "prod" }
                    });
                });
            }
        });
    });
});

Event = ascent.encode.flatten(u);
```

***

#### 🧹2. **Drop Metric by Name**

Drop all metrics with the name `http_requests_unwanted`.

```javascript
const u = ascent.decode.unflatten(Event);

u.resourceMetrics.forEach((rm) => {
    rm.scopeMetrics.forEach((sm) => {
        sm.metrics = sm.metrics.filter(m => m.name !== "http_requests_unwanted");
    });
});

Event = ascent.encode.flatten(u);
```

***

#### 3. **Rename Metric**

Rename `latency_ms` to `request_duration_ms`.

```javascript
const u = ascent.decode.unflatten(Event);

u.resourceMetrics.forEach((rm) => {
    rm.scopeMetrics.forEach((sm) => {
        sm.metrics.forEach((m) => {
            if (m.name === "latency_ms") {
                m.name = "request_duration_ms";
            }
        });
    });
});

Event = ascent.encode.flatten(u);
```

***

#### 4. **Convert Gauge to Sum**

Convert a `gauge` to a `sum` with cumulative aggregation.

```javascript
const u = ascent.decode.unflatten(Event);

u.resourceMetrics.forEach((rm) => {
    rm.scopeMetrics.forEach((sm) => {
        sm.metrics.forEach((m) => {
            if (m.gauge) {
                m.sum = {
                    dataPoints: m.gauge.dataPoints,
                    aggregationTemporality: 2,  // CUMULATIVE
                    isMonotonic: false
                };
                delete m.gauge;
            }
        });
    });
});

Event = ascent.encode.flatten(u);
```

***

#### &#x20;5. **Filter Out Data Points by Value**

Only keep gauge datapoints where value > 0.

```javascript
const u = ascent.decode.unflatten(Event);

u.resourceMetrics.forEach((rm) => {
    rm.scopeMetrics.forEach((sm) => {
        sm.metrics.forEach((m) => {
            if (m.gauge) {
                m.gauge.dataPoints = m.gauge.dataPoints.filter(dp => dp.asDouble > 0);
            }
        });
    });
});

Event = ascent.encode.flatten(u);
```

***

&#x20;6\. **Tag Metrics Based on Name**

Add a `type: db` attribute if metric name contains `sql`.

```javascript
const u = ascent.decode.unflatten(Event);

u.resourceMetrics.forEach((rm) => {
    rm.scopeMetrics.forEach((sm) => {
        sm.metrics.forEach((m) => {
            if (m.name.includes("sql")) {
                (m.gauge?.dataPoints || []).forEach((dp) => {
                    dp.attributes ||= [];
                    dp.attributes.push({
                        key: "type",
                        value: { stringValue: "db" }
                    });
                });
            }
        });
    });
});

Event = ascent.encode.flatten(u);
```

***

#### Tips

* Always wrap transformations in a try/catch if you're unsure about event structure.
* You can modify `resource.attributes`, `scope.name`, or any part of the OTLP model.
