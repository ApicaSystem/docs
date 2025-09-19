# Understanding ApicaYAML Scripting and Syntax

* [Formatting an Apica YAML Script](broken-reference)
  * [Sample Formatting](broken-reference)
* [Notes on Special Characters](broken-reference)
* [The “config” section](broken-reference)
  * [Attributes of the “config” section](broken-reference)
    * [target](broken-reference)
    * [headers](broken-reference)
    * [inputs](broken-reference)
    * [variables](broken-reference)
      * [Examples of variable usage](broken-reference)
    * [externalfiles](broken-reference)
    * [inputfiles](broken-reference)
* [The “scenarios” section](broken-reference)
  * [Name](broken-reference)
  * [Flow](broken-reference)
    * [Page](broken-reference)
    * [HTTP Methods](broken-reference)
      * [Get:](broken-reference)
      * [Post](broken-reference)
      * [Put](broken-reference)
      * [Delete](broken-reference)
    * [Transactions & Loops](broken-reference)
      * [Transaction](broken-reference)
      * [Loop](broken-reference)
    * [Capture](broken-reference)
    * [JSON](broken-reference)
    * [RegEx](broken-reference)
    * [Xpath](broken-reference)
    * [Boundary (Left Right Boundary)](broken-reference)
    * [Header](broken-reference)
    * [Regex Header](broken-reference)
    * [Assert](broken-reference)
      * [Status](broken-reference)
      * [Text](broken-reference)
    * [Mimetype](broken-reference)
    * [Size](broken-reference)
    * [Before & After](broken-reference)
      * [Before](broken-reference)
      * [After](broken-reference)
      * [A list that contains plugins or inline scripts that will be executed after the current HTTP request.](broken-reference)
    * [Plugins & Inline Scripts](broken-reference)
      * [Plugin](broken-reference)
      * [Inline](broken-reference)
* [Example Scenarios](broken-reference)
  * [Simple Scenario](broken-reference)
  * [Complex Scenario](broken-reference)

YAML scripts are divided into two main sections - a “config” section and a “scenarios” section. The “config” contains global parameters which are applied to all scripts within the “scenarios” section. The “scenarios” section contains the actual script(s) that will run during the test.

Dashes or other special characters cannot be used in the name of the scenario since the scenario name will become the Java class name and special characters are not allowed in the Java class name.

## Formatting an Apica YAML Script <a href="#understandingapicayamlscriptingandsyntax-formattinganapicayamlscript" id="understandingapicayamlscriptingandsyntax-formattinganapicayamlscript"></a>

Each indentations level must be made with either two or four space characters, as long as it is consistent. The example below was done with an indent equaling 2 spaces.

### Sample Formatting <a href="#understandingapicayamlscriptingandsyntax-sampleformatting" id="understandingapicayamlscriptingandsyntax-sampleformatting"></a>

Note the comments explaining the formatting.

```
config:                         # start of configuration. no indent.
  target: null                  # mandatory for the script. 1 indent.
  defaults:                     # start of settings for requests. 1 indent.
    headers:                    # start of a specific default setting. 2 indents.
      name: value               # default setting parameters. 3 indents.
  environments:                 # start of settings. 1 indent.
    name:                       # environment identifier. 2 indents.
      target: null              # environment address. 3 indents.
  inputs:                       # start of settings. 1 indent.
    - name: null                # mandatory input identifier. 2 indents and a dash.
    default: null               # optional default value. 2 indents.
  files:                        # start of settings. 1 indent.
    - path:"path/to/file"       # mandatory path to the file. 2 indents and dash followed by a quoted path.
      - fields:                 # start of list of variables to map to. 3 indents and dash.
        - name: "arbitraryName" # start of list of variables to map to. 4 indents and dash, followed by a quoted name.
      order: "sequential"       # read order (sequential / random). 3 indents followed by quoted order.
      scope: "global"           # file scope (global / user / loop). 3 indents followed by quoted scope.
  variables:                    # start of the Variables section. 1 indent.
    - date: null                # start of the date variables, each with a 2 indent dash and quoted name.
      - format: null
      - offset: null
      - hour: null
      - second: null
      - day: null
      - year: null
      - timestamp: null
    - random:                   # start of a variable. 2 indent dash and quoted name.
      scope: null               # variable Scope (global / user / loop). 3 indents followed by quoted scope.
      from: null                # start value. 3 indents followed by quoted scope.
      to: null                  # end value. 3 indents followed by quoted scope.
      leadingzeros: null        # an optional number of zeros to prefix the value. 3 indents followed by quoted scope.
    - java_property:            # start of a variable. 2 indent dash and quoted name.
      key: null.                # Java property key. 3 indent and quoted name.
      value: null               # Java property value. 3 indent and quoted value.
scenario:                       # Start of Scenario: No indentation.
  -name:                        # Name of: Dash and 1 indentation followed by the script name.
    flow:                       # Start of the section: 2 indents
      - get:                    # Start of Step: 3 indents and dash followed by the command.
        url:                    # URL to be accessed: 4 indents. The URL counts as the first attribute. Include https://www
        assert:                 # allow both 302 and 200 in the response code of the url you're getting. 4 indents
          - status:             # assert the returned URL is a certain status. 5 indents
            codes:              # assert status codes. 5 indents
              - 200             # assert given status codes. 6 indents
              - 302             # assert given status codes. 6 indents
```

## Notes on Special Characters <a href="#understandingapicayamlscriptingandsyntax-notesonspecialcharacters" id="understandingapicayamlscriptingandsyntax-notesonspecialcharacters"></a>

Do not use a Word processor when creating ApicaYAML scripts; instead, treat the scripts as code and create/edit them in an IDE with integrated YAML formatting.

* Indentations have a major impact on how the script is interpreted. If a script is indented incorrectly, it will not work.
* Indentations must be made with “space” (in the examples we always use 2 spaces per indentation)
* Single quotes (') are not escaped
* Double quotes (“) are escaped
* “\n” denotes a new line
* “#” denotes a comment
* Refer to the following rules for constructing arrays of attributes within ApicaYAML scripts:
  1. “-” (dash) denotes a member of an array of attributes.
  2. Only certain attributes are intended to be items in an array and only some attributes can be placed in arrays. The concept of an array is completely different here than it is in regular coding languages; instead arrays are intended an syntax component which specifies a one to many relationship in the ZT script. For instance, a user can have one to many input files in a script.
  3. The first item in the array is the first item which is specified after the dash and the last item in the array is the last item in the indentation block! That is, the array starts with a dash and ends when the indentation block ends.
  4. The dash can be placed on the same line as the first array item or on a separate line before the first array item. Arrays have no bearing on indentation level.
  5.  Every member of an array must have a dash in front of it.\
      \
      This is acceptable syntax for an array:

      ```
      config:
        target: 'http://ticketmonster.apicasystem.com/ticket-monster' 
        inputs:
        - name: 'integrationTest'
          default: 'http://ticketmonsterdev.apicasystem.com/ticket-monster'
        - name: 'production'
          default: 'http://ticketmonster.apicasystem.com/ticket-monster'
      ```

      This is also acceptable syntax for an array:

      ```
      config:
        target: 'http://ticketmonster.apicasystem.com/ticket-monster' 
        inputs:
        - 
          name: 'integrationTest'
          default: 'http://ticketmonsterdev.apicasystem.com/ticket-monster'
        - 
          name: 'production'
          default: 'http://ticketmonster.apicasystem.com/ticket-monster'
      ```

## The “config” section <a href="#understandingapicayamlscriptingandsyntax-the-config-section" id="understandingapicayamlscriptingandsyntax-the-config-section"></a>

```
config:
  target: "https://www.google.com"
  headers:
    acept: 'application/json'
    content-type: 'application/json'
  inputs: # here we define input variables that we can change in ASM
  - name: "inputsTestVar"
    default: "/vod/999/example(999).ism/example(999).m3u8"
  variables:
  - timestamp:
      as: "time111"
  - random:
      as: "ran111"
      from: 3
      to: 100
      leadingZeroes: false
  - javaproperty:
      key: "testJavaKey"
      value: "testJavaValue"
      as: "java11"
  externalfiles: # we can declare external files that we want to be added to the zip file that results from running ZebraCLI e.g host files
  - path: "test1014.yml" # the relative path to the file (inside the yml folder)
    javaoption: "addtoclasspath" # declare possible java options like classpath and xbootclasspath
  inputfiles:
  - path: "testInputFile1.csv"
    fields:
    - "testfield"
    order: "sequential"
    scope: "global"
    eof: "close"
  - path: "testInputFile2.csv"
    fields:
    - "testfield2"
```

### Attributes of the “config” section <a href="#understandingapicayamlscriptingandsyntax-attributesofthe-config-section" id="understandingapicayamlscriptingandsyntax-attributesofthe-config-section"></a>

Note the tabs and spaces in the following code sections!

There is no default order for config attributes.

The config section begins with the “config:” keyword:

```
config:
```

#### target <a href="#understandingapicayamlscriptingandsyntax-target" id="understandingapicayamlscriptingandsyntax-target"></a>

The “target” keyword is mandatory!

The main URL of the application you want to test. This will become the base URL for all requests in the scenarios section unless you provide a full url for the request. If the protocol (HTTP or HTTPS) is omitted, the request will default to HTTP. Target may also include part of the URI path following the hostname.

```
  target: "https://ven03142.service-now.com"
```

#### headers <a href="#understandingapicayamlscriptingandsyntax-headers" id="understandingapicayamlscriptingandsyntax-headers"></a>

Specified headers will be applied to all requests in the YAML definition file. For example, the following headers will direct the YAML script to accept the “application/json” Content-Type in the response headers which comes back after the request is made:

```
  headers:
    accept: 'application/json'
    content-type: 'application/json'
```

The following image shows an example response header from a ZT script which was compiled from a YAML file which contains the above headers:



#### inputs <a href="#understandingapicayamlscriptingandsyntax-inputs" id="understandingapicayamlscriptingandsyntax-inputs"></a>

It is possible to provide inputs which become User Input Fields within the compiled ZebraTester script. In the following example, two “inputs” are provided in the YAML file. They should be inserted into the YAML script using the following syntax:

```
  inputs:
  - name: 'integrationTest'
    default: 'http://ticketmonsterdev.apicasystem.com/ticket-monster'
  - name: 'production'
    default: 'http://ticketmonster.apicasystem.com/ticket-monster'
```

The following inputs become User Input Fields in the final ZebraTester script:



#### variables <a href="#understandingapicayamlscriptingandsyntax-variables" id="understandingapicayamlscriptingandsyntax-variables"></a>

The “variables” keyword specifies runtime variables whose values are initialized when starting the test. You can either provide one field or an array of fields to use. The available runtime variables include:

* `timestamp`: Create a Unix timestamp based on the time when the test is started. By default, the value of the variable will be reinitialized with every test iteration.
* `random`: Create a random number in a range. By default, the value of the variable will be reinitialized with every test iteration.
* `javaproperty`: Create a java system property. By default, the value of the variable will be reinitialized with every test iteration.

**Examples of variable usage**

```
  variables: 
  - timestamp: 
      as: 'myTimestamp' # Note that the key is the variable type that will be used. The value becomes the variable.  
  - random:
      as: 'myRandomNumber'
      scope: 'loop' # The variable will be reinitialized every time a new loop starts. 
      from: 1 # This is the lowest value that the random number may get.
      to: 1337 # This is the highest value that the random number may get. 
      leadingZeroes: true # Optional. All random numbers will be of equal length. Any values shorter than the max value will have zeros prepended to fill the remaining length.  
  - javaproperty: 
      as: 'myJavaProperty'
      key: 'myCustomKey' # This will be the name of the java system property 
      value: 'value' # This will be the initial value of the system property
```

The following screenshot shows how the above code translates into a ZebraTester script:



#### externalfiles <a href="#understandingapicayamlscriptingandsyntax-externalfiles" id="understandingapicayamlscriptingandsyntax-externalfiles"></a>

It is possible to declare external files to be used within a compiled ApicaYAML script. This functionality mirrors the external file import functionality which is built into ZebraTester and can be accessed by opening a URL Details window within a ZebraTester script and by clicking on the Folder icon at the top right of the Var Handler:



Clicking on that icon brings up the “Config External Resource” page:



You can specify an external file to add by adding the following attributes to your ApicaYAML definition file:

```
  externalfiles: # we can declare external files that we want to be added to the zip file that results from compiling an ApicaYAML script
    - path: "externalResource.java" # the relative path to the file (inside the yml folder)
      javaoption: "addtoclasspath" # declare possible java options like classpath and xbootclasspath
```

Place the input file (in this case, externalResource.java) within the “input” folder within your ApicaYAML Solutions folder:



When you compile an ApicaYAML script with the “externalfiles” attribute included and the specified file in the “input” folder, the file will be declared and added as a resource to the final script. This option is most commonly used for importing Java files and adding them to your classpath so they can be utilized by your ZebraTester script or a plugin which is referenced by your ZebraTester script.

#### inputfiles <a href="#understandingapicayamlscriptingandsyntax-inputfiles" id="understandingapicayamlscriptingandsyntax-inputfiles"></a>

It is possible to specify input files which contain test data which can be used by the ZebraTester script. These files will be shown in the “Input Files” section in ZT. External files should be placed in the “/scripts” subfolder of the project folder. You can either provide one file or an array of files to use. Supported file formats are .txt and .csv. Columns must be separated by “,” (comma). Attributes include:

* `Path` (mandatory): The file path to the test data file. Remember that the path is relative to the YAML definition file.
* `Fields` (mandatory): A list of variables that the fields in the test file should map to. The variables will be mapped to the columns in the order that they appear in the list. Columns must be separated by "," (comma).
* `Order` (optional): How the rows in the test file will be picked during the test. Valid options are 'sequential' and 'random'. Random selection is chosen if this option is omitted.
* `Scope` (optional): The scope the extracted variables should have during the test. Valid options are 'global', 'user' and 'loop'. Loop scope is chosen if this option is omitted.
  * Global: Same value (row) is used for each and all test iteration
  * User: One value (row) is used by each Virtual User for the whole test duration (one row per VU)
  * Loop: A new value (row) is selected for each test iteration
* `EOF`: the action to take when the end of the file is reached\


The following syntax will add the following files and input fields within the compiled ZebraTester script:

```
  inputfiles:
    - path: "users.csv" # This file must be located in the /script subdirectory
      fields:
      - "username" # 1st column will be used for the variable 'username' 
      - "password" # 2nd column will be used for the variable 'password'
      order: "sequential" # The data vill be picked line for line in sequential order 
      scope: "loop" # A new line will be read for each test iteration
      eof: "close" # defines the action to take when the file is finished being read
```

The following screenshot shows a created input file.



The following screenshots show the created variables. These can be assigned manually in the ZT script.



## The “scenarios” section <a href="#understandingapicayamlscriptingandsyntax-the-scenarios-section" id="understandingapicayamlscriptingandsyntax-the-scenarios-section"></a>

```
scenarios: # we can define multiple scenarios in 1 yml file if we want to
  - name: "TV_Test_iosE789" # in this case we have only 1 scenario, this is the name of the scenario
    flow:
      - page: # URLs need to be attached to pages, if a page is not defined, then one is automatically created
          name: "FirstPage" # name of the page
          thinktime: 6000
      - transaction:
          transactionname: "Trans1"
          flow:
            - get: # HTTP method goes here
                url: "https://www.google.com" # this is an example of using a relative URL
            - get:
                url: "https://www.unsplash.com" # this is an example of using a relative URL
      - loop:
          loopname: "Loop1"
          count: 3
          flow:
            - page:
                name: "DRM"
            - get:
                url: "https://www.google.com"
                headers: # signifies the adding or updating of a header field
                  Authorization: "{{inputsTestVar}}" # variables go inside curly brackets

      - page:
          name: "Manifest"
      - get:
          capture:
            - header:
                target: 'x-cdn-forward'
                as: 'cdncompare'
          assert: # allow both 302 and 200 because the cdn can change
            - status:
                codes:
                  - 200
                  - 302
            - text:
                string1: "test"
                operand: "1"
                string2: "test2"
                onfail: "continue"
          after:
            - inline:
                code: |
                  isakamai = strCompareIgnoreCase(cdncompare,"Akamai")
                  IF isakamai THEN
                  Location = getHTTPResponseHeaderField("Location")
                  temp1 = strSplit(Location,"\\/vod")
                  temp2 = temp1(1)
                  temp3 = strSplit(temp2,"https:\\/\\/")
                  cdnforward = temp3(2)
                  ELSE
                  cdnforward = "lbs-usp-hls-vod.cmore.se"
                  ENDIF
                input:
                  - '{{testVarInlineAfterInput1}}'
                output:
                  - '{{testVarInlineAfterOutput1}}'
          before:
            - inline:
                code: |
                  isakamai = strCompareIgnoreCase(cdncompare,"Akamai")
                  IF isakamai THEN
                  Location = getHTTPResponseHeaderField("Location")
                  temp1 = strSplit(Location,"\\/vod")
                  temp2 = temp1(1)
                  temp3 = strSplit(temp2,"https:\\/\\/")
                  cdnforward = temp3(2)
                  ELSE
                  cdnforward = "lbs-usp-hls-vod.cmore.se"
                  ENDIF
                input:
                  - '{{testVarInlineBeforeInput1}}'
                output:
                  - '{{testVarInlineBeforeOutput1}}'
          url: "https://www.google.com/inputsTestVar"

      - get:
          capture:
            - regex:
                target: '([a-zA-Z0-9\(\)\_]+-audio_eng=[a-zA-Z0-9\(\)\_]+-video_eng=.*m3u8)'
                as: "submanifest_url"
            - xpath:
                target: 'test'
                as: "xpath_test"
            - json:
                target: 'jsonstring'
                as: "json_target"
          url: "http://zebracli.zebracli.zebracli"

      - page:
          name: "Submanifest"
      - get:
          capture:
            - boundary:
                leftboundary: "leftTest"
                rightboundary: "rightTest"
                as: 'boundaryVar'
            - regex:
                target: '(.*\.ts?)'
                occurrence: 1
                as: 'regexVar'
            - header:
                target: "headerName"
                as: "headerVar"
          url: "http://zebracli.zebracli.zebracli"

      - page:
          name: "Segments"
      - loop:
          flow:
            - page:
                name: "testPagex"
            - transaction:
                transactionname: "testTransactionx"
                flow:
                  - post:
                      url: "http://zebracli.zebracli.zebracli/segment_loop_Item"
                      body: "<html><body><h1>Hello,
                             World!</h1></body></html>"
                      before:
                        - inline:
                            code: |
                              print("test")
                            input:
                              - '{{testVarInlineBeforeInput2}}'
                            output:
                              - '{{testVarInlineBeforeOutput2}}'
                        # - plugin:
                        #     file: "addNumbers.class"
                        #     output:
                        #       - "testvaroutput"
                        #     input:
                        #       - "testvarinput"
                      # after:
                      #   - inline:
                      #       code: |
                      #         print("test")
                      #       input:
                      #         - '{{testVarInlineAfterInput2}}'
                      #       output:
                      #         - '{{testVarInlineAfterOutput2}}'
                      #   - plugin:
                      #       output:
                      #         - "testvaroutput2"
                      #       input:
                      #         - "testvarinput2"
                      #       file: "addNumbers.class"
                  - get:
                      url: "http://zebracli.zebracli.zebracli"          
            - get: # the "segment_loop_Item" part of the url is replaced with a segment defined in the "over" list
                after:
                  - inline:
                      code: |
                        print("test")
                      input:
                        - '{{testVarInlineAfterInput3}}'
                      output:
                        - '{{testVarInlineAfterOutput3}}'
                before:
                  - inline:
                      code: |
                        print("test")
                      input:
                        - '{{testVarInlineBeforeInput3}}'
                      output:
                        - '{{testVarInlineBeforeOutput3}}'
                url: "http://zebracli.zebracli.zebracli"
            - page:
                name: "testPagey"
          loopname: "segment_loop"
          over: # the loop iterates once over each item in the "over" list
            - "{{boundaryVar}}"
            - "{{regexVar}}"
            - "{{headerVar}}"
```

The scenarios section of the definition file is where one or more scripts are defined. If multiple scripts are defined, the config options will be applied to all scripts within the “scenarios” section.

### Name <a href="#understandingapicayamlscriptingandsyntax-name" id="understandingapicayamlscriptingandsyntax-name"></a>

The “name” keyword is mandatory!

The “name” value specified in the ApicaYAML definition file becomes the name of the script.

This syntax

```
scenarios:
- name: "TM_OrderTickets_v2"
```

Becomes



### Flow <a href="#understandingapicayamlscriptingandsyntax-flow" id="understandingapicayamlscriptingandsyntax-flow"></a>

The “Flow” keyword denotes any content which will be parsed into runnable pages, URLs, etc. within the ZebraTester script. It is where you will define URLs to GET, data to POST, etc.

The following flow objects are supported:

* get
* post
* put
* delete
* page
* loop
* transaction

```
...
  flow:
      - page:
          ...
      - get:
          ...
      - post:
          ...
      - put:
          ...
      - delete:
          ...
      - loop:
          ...
      - transaction:
          ...
      
```

#### Page <a href="#understandingapicayamlscriptingandsyntax-page" id="understandingapicayamlscriptingandsyntax-page"></a>

A page break. Every script must start with a page break. Page breaks are followed by HTTP requests.

Can contain the following keywords:

* name (mandatory)
* thinktime

```
- page:
    name: "Page 1"
    thinktime: 3      
```

#### HTTP Methods <a href="#understandingapicayamlscriptingandsyntax-httpmethods" id="understandingapicayamlscriptingandsyntax-httpmethods"></a>

**Get:**

Can contain the following keywords:

* url (mandatory)
* capture
* assert
* before
* after
* headers

```
- get:
    url: "http://ticketmonster.apicasystem.com"
```

**Post**

Can contain the following keywords:

* url (mandatory)
* capture
* assert
* before
* after
* json
* data
* form
* plain
* headers

```
- post:
    url: "http://ticketmonster.apicasystem.com"
```

**Put**

Can contain the following keywords:

* url (mandatory)
* capture
* assert
* before
* after
* json
* data
* form
* plain
* headers

```
- put:
    url: "http://ticketmonster.apicasystem.com"
```

**Delete**

Can contain the following keywords:

* url (mandatory)
* capture
* assert
* before
* after
* headers

```
- delete:
    url: "http://ticketmonster.apicasystem.com"
```

#### Transactions & Loops <a href="#understandingapicayamlscriptingandsyntax-transactions-and-loops" id="understandingapicayamlscriptingandsyntax-transactions-and-loops"></a>

Transactions and loops must contain a flow that works the same way as the flow at the highest level of the script. This allows for nested transactions and loops.

**Transaction**

Used to declare multiple requests as part of a single transaction.

Can contain the following keywords:

* flow (mandatory)
* transactionname (mandatory)

```
- transaction:
    transactionname: "Transaction 1"
    flow:
      - get:
          url: "http://ticketmonster.apicasystem.com"
```

**Loop**

Used to loop over multiple requests.

* flow (mandatory)
* loopname (mandatory)
* count
* over

```
- loop:
    loopname: "Loop 1"
    count: 3
    flow:
      - get:
          url: "http://ticketmonster.apicasystem.com"
```

#### Capture <a href="#understandingapicayamlscriptingandsyntax-capture" id="understandingapicayamlscriptingandsyntax-capture"></a>

This is a list of captures. A capture signifies the extraction of data from an HTTP response.

The capture keywords are:

* json
* regex
* xpath
* boundary
* header
* regexheader

#### JSON <a href="#understandingapicayamlscriptingandsyntax-json" id="understandingapicayamlscriptingandsyntax-json"></a>

Can contain the following keywords:

* target (mandatory)
* as (mandatory)
* fallback
* random
* occurrence

```
- get:
    url: "/ticket-monster/rest/events?_{{epoch_TS}}"
    capture:
      - json: 
          occurrence: 1
          random: true
          target: "$[*].id"
          as: "event_id"
```

#### RegEx <a href="#understandingapicayamlscriptingandsyntax-regex" id="understandingapicayamlscriptingandsyntax-regex"></a>

Can contain the following keywords:

* target (mandatory)
* as (mandatory)
* fallback
* random
* occurrence

#### Xpath <a href="#understandingapicayamlscriptingandsyntax-xpath" id="understandingapicayamlscriptingandsyntax-xpath"></a>

Can contain the following keywords:

* target (mandatory)
* as (mandatory)
* fallback
* random
* occurrence

#### Boundary (Left Right Boundary) <a href="#understandingapicayamlscriptingandsyntax-boundary-leftrightboundary" id="understandingapicayamlscriptingandsyntax-boundary-leftrightboundary"></a>

Can contain the following keywords:

* leftboundary (mandatory)
* rightboundary (mandatory)
* as (mandatory)
* fallback
* random
* occurrence

#### Header <a href="#understandingapicayamlscriptingandsyntax-header" id="understandingapicayamlscriptingandsyntax-header"></a>

Can contain the following keywords:

* target (mandatory)
* as (mandatory)
* fallback
* random
* occurrence

#### Regex Header <a href="#understandingapicayamlscriptingandsyntax-regexheader" id="understandingapicayamlscriptingandsyntax-regexheader"></a>

Can contain the following keywords:

* target (mandatory)
* as (mandatory)
* fallback
* random
* occurrence

#### Assert <a href="#understandingapicayamlscriptingandsyntax-assert" id="understandingapicayamlscriptingandsyntax-assert"></a>

This is a list of asserts. An assert signifies the verification of a status code, text string, mime type or the size of response data. The load test can be configured to abort if an assert fails.

Can contain the following keywords:

* status
* text
* size
* mimetype

**Status**

Can contain the following keywords:

* codes
* onfail

```
assert:
  - status:
      codes:
        - 200
        - 302
      onfail: "continue"
```

**Text**

Can contain the following keywords:

* string1
* string2
* operand
* onfail

```
assert:
  - text:
      string1: "Teststring1"
      string2: "Teststring2"
      operand: 2
      onfail: "abort"
```

#### Mimetype <a href="#understandingapicayamlscriptingandsyntax-mimetype" id="understandingapicayamlscriptingandsyntax-mimetype"></a>

Can contain the following keywords:

* target
* onfail

#### Size <a href="#understandingapicayamlscriptingandsyntax-size" id="understandingapicayamlscriptingandsyntax-size"></a>

Can contain the following keywords:

* target
* deviation
* onfail

```
assert:
  - size:
      target: 3000
      deviation: 5
      onfail: "continue"
```

#### Before & After <a href="#understandingapicayamlscriptingandsyntax-before-and-after" id="understandingapicayamlscriptingandsyntax-before-and-after"></a>

The before and after keywords signify a list of plugins and inline scripts that can be run either before or after an HTTP request.

**Before**

A list that contains plugins or inline scripts that will be executed before the current HTTP request.

Can contain the following keywords:

* plugin
* inline

```
before: 
  - plugin
    ...
  - inline:
    ...
```

**After**

**A list that contains plugins or inline scripts that will be executed after the current HTTP request.**

Can contain the following keywords:

* plugin
* inline

#### Plugins & Inline Scripts <a href="#understandingapicayamlscriptingandsyntax-plugins-and-inlinescripts" id="understandingapicayamlscriptingandsyntax-plugins-and-inlinescripts"></a>

**Plugin**

Plugins are java programs specifically created for ZebraTester/ZebraCLI. Plugins extend the functionality of ZebraCLI and allow java code to be run before and after HTTP requests.

Can contain the following keywords:

* file (mandatory)
* input
* output

```
before:
  - plugin:
      file: "addNumbers.class"
      input:
        - "1"
        - "2"
      output:
        - "result"
```

**Inline**

Inline scripts are written in BASIC and extend the functionality of ZebraCLI. Inline scripts can be run before and after HTTP requests.

Can contain the following keywords:

* code (mandatory)
* input
* output

```
before:
  - inline:
      code: |
        quantity=random(1,3)
        email="user"+(getUserNumber() + 1) + "@acme.com"
      output:
      - '{{email}}'  
      - '{{quantity}}'
```

## Example Scenarios <a href="#understandingapicayamlscriptingandsyntax-examplescenarios" id="understandingapicayamlscriptingandsyntax-examplescenarios"></a>

The following scenarios serve as examples to reference when creating and modifying scripts.

Note the indentations used in the script!

### Simple Scenario <a href="#understandingapicayamlscriptingandsyntax-simplescenario" id="understandingapicayamlscriptingandsyntax-simplescenario"></a>



### Complex Scenario <a href="#understandingapicayamlscriptingandsyntax-complexscenario" id="understandingapicayamlscriptingandsyntax-complexscenario"></a>

