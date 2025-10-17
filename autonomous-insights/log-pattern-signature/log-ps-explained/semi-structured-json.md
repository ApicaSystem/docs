# Semi-structured JSON

### Semi-structured JSON Logs Logging (Available@v3.9)

A JSON log is a semi-structured log type in which the log sub-fields are organized in a JSON schema. The well-defined deterministic JSON schema makes parsing logs a cinch for the observability analytics backend.  Nevertheless, the JSON log carries the downside burden of structured machine logs, which are difficult and unnatural for human clients to interpret.  &#x20;

The JSON log pattern-signature clustering or grouping is introduced in addition to the existing general-type log clustering. General-type logs are logs of any form: structured, semi-structured, or unstructured logs. It's powerful but lacks specifics or details if a log format is known beforehand. In the example of JSON logs, the pattern-signature group will be based on JSON characteristics. Due to the generalization capability of the original PS grouping method, all valid JSON logs will be categorized into one type, and this might not be the desired outcome for handling JSON logs.   The improved PS with added JSON log awareness becomes more effective because it appropriately drills into the JSON schema and groups the JSON logs based on JSON schema and keys.&#x20;

One primary requirement for JSON log format is that the log needs to be enclosed in the curly bracket "{...}". &#x20;

An example of a one-level JSON log below belongs to the same PS group.

* {“A”: 23, “B”: 24, “C”:25}
* {“C”: 33, “B”:32, “A”:”Not here”}
* Common pattern family of pattern-signature (PS) group {“A”: \*, “B”: _, “C”:\*_}&#x20;

Another JSON log with multiple levels. If the maximum JSON level depth is set at 3, then both logs are in the same group. If the maximum JSON level depth >=5, then both logs will be in a separate PS group. The maximum JSON level configuration will be shown in the later section.

{% code title="Example#1 Max Depth=3" fullWidth="false" %}
```json
{
	“key1”: 23,
	“key2”: [{“key3”: 24}, 25, 26],
	“key4”: 26
}
```
{% endcode %}

{% code title="Example#2 Max Depth=5" %}
```json
{
  “key1”: 23,
  “key4”: 26,
  “key2”: [{“key3”: {“key3a”: [200, 201]},25, 26],
}
```
{% endcode %}
