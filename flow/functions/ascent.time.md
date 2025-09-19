# Ascent.time

#### ascent.time.adjustTZ

Adjusts an epoch timestamp from one timezone to another

```
ascent.time.adjustTZ(epoch: number, to: string, from: string = 'UTC'): number;
```

| Parameter | Type   | Description           |
| --------- | ------ | --------------------- |
| epoch     | number | timestamp             |
| to        | String | destination time zone |
| from      | string | source time zone      |

#### ascent.time.strftime

Formats an epoch timestamp according to a specified format and timezone

```
ascent.time.strftime(epoch: number, format: string, tzTo: string = 'UTC'): string;
```

| Parameter | Type   | Description                  |
| --------- | ------ | ---------------------------- |
| epoch     | number | timestamp                    |
| format    | String | The desired date-time format |
| tzTo      | string | Target timezone              |
