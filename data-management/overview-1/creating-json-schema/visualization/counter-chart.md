# Counter chart

To configure a Counter chart that  use the following JSON object.&#x20;

### Json configuration&#x20;

```json
                {
                    "chart_type": "counter",
                    "data_source_name": "Ascent Metrics",
                    "name": "CPU Cores - auto query",
                    "options": {
                        "description": "CPU Cores - auto query",
                        "label": "CPU Cores",
                        "order": 10,
                    },
                    "query": "count(count(node_cpu_seconds_total{instance=~'.*'}) by (cpu))&duration=1h&step=5m",
                    "schema": "node_cpu_seconds_total"
                },
```





<figure><img src="../../../../.gitbook/assets/image (553).png" alt=""><figcaption></figcaption></figure>
