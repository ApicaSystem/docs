# DNS Security Check

With the **Security** check, you can test your DNS environment for vulnerabilities.



### Usage <a href="#dnssecuritycheck-usage" id="dnssecuritycheck-usage"></a>

The flaws the Security check looks for are:

* Whether the name server is an [open resolver](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/4632274/Open+Resolver).
* Whether the name server presents its software and version.
* Whether the name server allows [zone transfers](https://apica-kb.atlassian.net/wiki/spaces/ASMDOCS/pages/4632468/Zone+Transfer) globally.

Any one of these three security vulnerabilities could mean you are at risk and the vulnerability should be addressed.

Each control point of the check can be either `pass`, `fail` or be `inconclusive`.

If all control points pass, the check will report an `Information` message as the name server is correctly configured.

If one or more check fails, the check will report this as a `Warning` or an `Error` message. This means that measures should be taken to fix the potential security flaw.

A control point can also report `Inconclusive` which mean that the control point receives such information that the check can’t determine if there is a security problem. The message will give some information on what the check has encountered.
