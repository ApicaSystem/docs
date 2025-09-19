# How to Mask Sensitive Information Within an ASM Scenario

When command values contain sensitive information, they can be **masked**. This will prevent the value from being displayed in results.

**Example**

Let’s assume you use a scenario with the following commands:

| Command      | Target                                                                                                        | Value                                                        |
| ------------ | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| open         | `/`                                                                                                           |                                                              |
| selectWindow | `null`                                                                                                        |                                                              |
| type         | `id=username`                                                                                                 | `user1`                                                      |
| type         | `id=password`                                                                                                 | <p>{{$</p><p>Unknown macro: {maskapicaPassword}</p><p>}}</p> |
| clickAndWait | `_input`[unnamed link](https://apica-kb.atlassian.net/wiki/404?key=value%253D%2527Log%2Bin%2527%3Bsearch%3Fq) |                                                              |

If you want to mask the value `secretPa$$word` in the Check Result page the following steps are required:

* Add the command `Store` to store the password as a variable with the prefix `maskapica`
* Use this variable with the actual command which uses the password.

Your commands should now look like this:

| Command      | Target                                                                                                        | Value                                                        |
| ------------ | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| store        | `secretPa$$word`                                                                                              | `maskapicaPassword`                                          |
| open         | `/`                                                                                                           |                                                              |
| selectWindow | `null`                                                                                                        |                                                              |
| type         | `id=username`                                                                                                 | `user1`                                                      |
| type         | `id=password`                                                                                                 | <p>{{$</p><p>Unknown macro: {maskapicaPassword}</p><p>}}</p> |
| clickAndWait | `_input`[unnamed link](https://apica-kb.atlassian.net/wiki/404?key=value%253D%2527Log%2Bin%2527%3Bsearch%3Fq) |                                                              |

When Synthetic Monitoring runs a check using this scenario the result will be saved with the executed scenario commands list as the example above. When Synthetic Monitoring shows the check result on the check results page Synthetic Monitoring will recognize that there is a command value which starts with `maskapica`.

The command’s target will be masked on the the check results page:

| Command      | Target                                                                                                         | Value                                                        |
| ------------ | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| store        | `*******`                                                                                                      | `maskapicaPassword`                                          |
| open         | `/`                                                                                                            |                                                              |
| selectWindow | `null`                                                                                                         |                                                              |
| type         | `id=username`                                                                                                  | `user1`                                                      |
| type         | `id=password`                                                                                                  | <p>{{$</p><p>Unknown macro: {maskapicaPassword}</p><p>}}</p> |
| clickAndWait | `//input`[unnamed link](https://apica-kb.atlassian.net/wiki/404?key=value%253D%2527Log%2Bin%2527%3Bsearch%3Fq) |                                                              |
