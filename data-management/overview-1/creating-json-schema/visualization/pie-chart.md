# Pie chart

### Json configuration&#x20;

```json
                {
                    "chart_type": "pie",
                    "data_source_name": "Ascent Metrics",
                    "name": "CPU Cores - auto query",
                    "options": {
                        "description": "CPU Cores - auto query",
                        "label": "CPU Cores",
                        "order": "",
                    },
                    "query": "count(count(node_cpu_seconds_total{instance=~'.*'}) by (cpu))&duration=1h&step=5m",
                    "schema": "node_cpu_seconds_total"
                },
```



<figure><img src="../../../../.gitbook/assets/image (558).png" alt=""><figcaption></figcaption></figure>
