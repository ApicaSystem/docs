# Apica YAML

Apica YAML is a scripting solution which allows users to monitor scripted web transactions without the use of a GUI-based scripting tool. The intent of the solution is to provide a platform where scripts can be created using specific [YAML syntax](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/2123300865/Scripting+with+Apica+YAML+-+Syntax+Usage) and to reduce the need for new tool adoption. Users can [create Apica YAML scripts within ASM itself](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/2123104570/Create+New+Apica+YAML+Script):



For users who are familiar with the Apica ZebraTester product, consider Apica YAML to be a GUI-less version of ZebraTester. In fact, Apica YAML scripts are actually compiled into ZebraTester scripts:



The solution allows for a headless method of creating ZebraTester scripts which does not require software to be downloaded to the machine. It also allows for greater automation/code re-usability when creating ZebraTester scripts.

## Comparing ZebraTester to ApicaYAML <a href="#apicayaml-comparingzebratestertoapicayaml" id="apicayaml-comparingzebratestertoapicayaml"></a>

| <h3 id="apicayaml-feature"><strong>Feature</strong></h3> | <h3 id="apicayaml-zebratester"><strong>ZebraTester</strong></h3> | <h3 id="apicayaml-apicayaml"><strong>Apica YAML</strong></h3> |
| -------------------------------------------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------- |
| **Graphical User Interface**                             | AlagEO5Hmj35                                                     |                                                               |
| **DevOps API Scripting**                                 |                                                                  | eZYUatrDFTOQ                                                  |
| **Medium Level Scripting**                               |                                                                  | L07k9gaatgNU                                                  |
| **Advanced Scripting**                                   | 1Tfy2EnFa16J                                                     |                                                               |
| **Streaming Scripts**                                    | wlb7pRUhqvcV                                                     |                                                               |
| **WebSocket & MQTT Scripts**                             | gKe6SjkKG3yH                                                     |                                                               |
| **Record Scripts**                                       | FDMd2d846vIl                                                     |                                                               |
| **Add Requests Manually**                                | nl5BTtG1RGEH                                                     | v26LKVjYgkwW                                                  |
| **Run the Script on Your Desktop**                       | fj95Mvr0m06V                                                     | Xt0DO8CEkgUm                                                  |
| **Script Variables, Extractors, Assigners**              | 8eo2Z5HFNByy                                                     | zruu2Z2ORkr9                                                  |
| **Parameter File Support**                               | NYSGBjfa64Z9                                                     | FJNeCxGgueJI                                                  |
| **Inline Code**                                          | YLtczDqjcV5a                                                     | pEyCpmfqb3cu                                                  |
| **Java Plugins**                                         | y5mWlEgOnKbt                                                     | 2Gdt3k1JLNga                                                  |
| **Upload Scripts to Apica LoadTest**                     |                                                                  | WXssonMrZoQp                                                  |
| **Upload Scripts for Synthetic Monitoring**              |                                                                  | sjTtkWHdvdoS                                                  |
| **Create Scripts Within ASM Portal**                     |                                                                  | 1NaH9uKZgILB                                                  |
| **LoadRunner Conversion**                                | 8an6eTM7q62J                                                     |                                                               |

## Example Syntax <a href="#apicayaml-examplesyntax" id="apicayaml-examplesyntax"></a>

The following syntax provides an example of an ApicaYAML script which will be compiled into a working ZebraTester script. Refer to the [syntax guide](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/2123300865/Scripting+with+Apica+YAML+-+Syntax+Usage) for more information.

```
config:
   # production:
  target: 'http://ticketmonster.apicasystem.com/ticket-monster' 
  inputs:
    - name: 'production'
      default: 'http://ticketmonster.apicasystem.com/ticket-monster'
    - name: 'integrationTest'
      default: 'http://ticketmonsterdev.apicasystem.com/ticket-monster'
  #nextproxy:
  #  httphost: "zebracli.zebracli.zebracli"
  headers:
    accept: 'application/json'
    content-type: 'application/json'
  #externalfiles:
  inputfiles:
    - path: "users.csv" # This file must be located in the /script subdirectory
      fields:
        - "username" # 1st column will be used for the variable 'username' 
        - "password" # 2nd column will be used for the variable 'password'
      order: "sequential" # The data vill be picked line for line in sequential order 
      scope: "loop" # A new line will be read for each test iteration
      eof: "close"
scenarios: # we can define multiple scenarios in 1 yml file if we want to
 -
    name: "TM_OrderTickets_v2"
    flow:
      - page:
          name: "Test"
          thinktime: 0
      - get:
          # url: "{{BASE_URL}}/ticket-monster/"
          url: "https://www.google.com"
          assert:
            - status:
                codes:
                  - 200
            - text:
                string1: "My Test String"
```

\


**Example Script:**

```
config:
  target: "http://ticketmonster.apicasystem.com"
scenarios:
  - name: "TM_OrderTickets"
    flow:
      - page:
          name: "Get Events"
          thinktime: 0
      - get:
          url: "/ticket-monster/rest/events?_{{epoch_TS}}"
          assert:
            - status:
                codes:
                  - 200
          capture:
            -
              json: 
                occurrence: 1
                random: false
                target: "$[*].id"
                as: "event_id"
          before:
            - inline:
                code: |
                  epoch_TS=getUnixTimestampMillis()
                output:
                - '{{epoch_TS}}'
      - page:
          name: "Get Shows"
          thinktime: 3
      - get:
          url: "/ticket-monster/rest/shows?event={{event_id}}&_{{epoch_TS}}"
          assert:
            - status:
                codes:
                  - 200
          capture:
            -
              json: 
                occurrence: 1
                random: true
                target: "$[*].id"
                as: "show_id"
          before:
            - inline:
                code: |
                  epoch_TS=getUnixTimestampMillis()
                output:
                - '{{epoch_TS}}'
      - get:
          url: "/ticket-monster/rest/shows/{{show_id}}?_{{epoch_TS}}"
          assert:
            - status:
                codes:
                  - 200
          capture:
            - json: 
                target: "$.performances[*].id"
                as: "performance_id"
            - json: 
                target: "$.ticketPrices[*].id "
                as: "ticketprice_id"
          before:
            - inline:
                code: |
                  epoch_TS=getUnixTimestampMillis()
                output:
                - '{{epoch_TS}}'
      - page:
          name: "Order tickets"
          thinktime: 1
      - post:
          url: "/ticket-monster/rest/bookings"
          json: 
            ticketRequests: 
            -
              ticketPrice: "10"
              quantity: "{{quantity}}"
            email: "{{email}}"
            performance: "{{performance_id}}" 
          capture:
            - json: 
                target: "$.id"
                as: "booking_id" 
          assert:
            - status:
                codes:
                  - 200
                  - 201
          before:
            - inline:
                code: |
                  quantity=random(1,3)
                  email="user"+(getUserNumber() + 1) + "@acme.com"
                output:
                - '{{email}}'  
                - '{{quantity}}'   
      - get:
          url: "/ticket-monster/rest/bookings/{{booking_id}}?_{{epoch_TS}}"
          assert:
            - status:
                codes:
                  - 200
          before:
            - inline:
                code: |
                  epoch_TS=getUnixTimestampMillis()
                output:
                - '{{epoch_TS}}'
      - page:
          name: "Delete tickets"
          thinktime: 1
      - delete:
          url: "/ticket-monster/rest/bookings/{{booking_id}}"
          assert:
            - status:
                codes:
                  - 200
                  - 204
```
