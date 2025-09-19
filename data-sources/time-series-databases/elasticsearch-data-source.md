---
description: >-
  Elasticsearch data source provides a quick and flexible way to issue queries
  to one or more indexes in an Elasticsearch cluster
---

# Elasticsearch

## Create the Elasticsearch data source

The first step is to create the data source and provide the Elasticsearch cluster URL and optionally provide  the basic auth `login` and `password`.



![Configuring the Elasticsearch data source](../../.gitbook/assets/elastic-1.png)

## Writing queries

In the query editor view, select the _Elasticsearch data source_ created above. On the left column, click on the refresh <img src="../../.gitbook/assets/Screen Shot 2020-08-10 at 10.07.50 PM.png" alt="" data-size="original"> icon to refresh the schemes (indexes). The schemes are expandable and show the schema details.

![Refresh and lookup Elasticsearch indexes](../../.gitbook/assets/elastic-2.png)

You can then proceed to the query editor and run the search query. The query uses JSON as passed to the Elasticsearch search API

![Writing a search query against an Elasticsearch index](<../../.gitbook/assets/Screenshot from 2022-06-29 23-04-10.png>)

