# DNS Resolver Check

#### Resolver <a href="#dnsresolvercheck-resolver" id="dnsresolvercheck-resolver"></a>

A DNS Resolver is part of a DNS Server. It navigates the [DNS](https://apica-kb.atlassian.net/wiki/spaces/GLOS/pages/4632509) tree to find any available DNS data. The **Resolver** check tests the iterative ability of a DNS Resolver.

#### Check Info <a href="#dnsresolvercheck-checkinfo" id="dnsresolvercheck-checkinfo"></a>



#### Check Configuration <a href="#dnsresolvercheck-checkconfiguration" id="dnsresolvercheck-checkconfiguration"></a>



#### Check Result <a href="#dnsresolvercheck-checkresult" id="dnsresolvercheck-checkresult"></a>



#### Usage <a href="#dnsresolvercheck-usage" id="dnsresolvercheck-usage"></a>

The test record used in the check can’t be stored in the resolver cache and need to be iterated each time.

This check is useful if you have one or more open resolvers for public use or you can use it on the internal resolver if you allow access from the agent (or if you have deployed a local agent on your network).
