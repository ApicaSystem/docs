# Logstash

### Syslog output plugin

```
input {

file {
    path => "/var/log/syslog"
    type => "syslog"
    start_position => "beginning"
  }

filter {
  uuid {
    target => "uuid"
  }
}

output {
  syslog { appname => "my-awesome-app"
           host => "logiq-server-dns.my-domain.com"
           protocol => "ssl-tcp"
           msgid => "%{uuid}"
           ssl_cert => "client.crt"
           ssl_key => "client.key"
           ssl_cacert => "logiq.crt"
           ssl_verify => true
           port => "7514"
           rfc => "rfc5424"
           id => "%{uuid}"
         }
  stdout { codec => rubydebug }
}
```

**NOTE**: Change _"host" , "appname", "ssl\_cert", "ssl\_key", "ssl\_cacert"_ above to suit your configuration

### HTTP output plugin

```
output {
   http {
        url => "https://apica-ascent-dns-or-ip/v1/json_batch"
        headers => { "Authorization" => "Bearer <Auth token>" }
        http_method => "post"
        format => "json_batch"
        content_type => "json_batch"
        pool_max => 300
        pool_max_per_route => 100
        socket_timeout => 60
       }
}
```

You can additionally control the data organization by specifying additional fields

```
filter {
  mutate {
    add_field => { "cluster_id" => "demo-http-test" }
    add_field => { "namespace" => "namespace_name" }
    add_field => { "app_name" => "application_name" }
    add_field => { "proc_id" => "process_or_pod_identifier" }
  }
}
```
