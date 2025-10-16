# Unstructured Logs

### Unstructured Logs Logging

The current log ingestion practices try to unify the logs into the machine-like semi-structured format, using homogeneous field assignments or key-value pair JSON format, to simplify the post analytics. The practice, however, limits logging capability, which is analogous to limiting all the observability log data to only one schema. Moreover, a homogeneous semi-structured machine log such as JSON or XML form is not intuitive and difficult to interpret. The advanced Pattern-Signature AI/ML method here makes the effort fruitful.

Apica Ascent Pattern-Signature autonomously derives the underlying schema for every log stream; see the example below,

```
PS_ID	Log Line
------------------------------------------------------------------------------------------------------------
18	2022-06-08T00:20:18.600784-07:00 #:1757:# Facet6=v18 Facet2=v20 Facet3=v-2 POSSIBLE BREAK-IN ATTEMPT
18	2022-06-08T00:20:18.621094-07:00 #:1759:# Facet6=v18 Facet2=v20 Facet3=v-2 POSSIBLE BREAK-IN ATTEMPT
27	2022-06-08T00:20:19.240826-07:00 #:1821:# Facet1=v19 Facet2=v20 Facet4=v-1 FacetU=b24f2b55-2ec4-4102-a70b-d48863ee7b7d in "quote here"  [ in bracket ] abcdeghijklmn19  ] ) }  POSSIBLE BREAK-IN ATTEMPT
18	2022-06-08T00:20:19.280237-07:00 #:1825:# Facet5=v19 Facet2=v20 Facet4=v-1 POSSIBLE BREAK-IN ATTEMPT
18	2022-06-08T00:20:20.090611-07:00 #:1859:# Facet6=v20 Facet2=v20 Facet3=v0 POSSIBLE BREAK-IN ATTEMPT
18	2022-06-08T00:20:20.251025-07:00 #:1875:# Facet1=v20 Facet2=v20 Facet4=v0 FacetU=b22fb734-1f08-45b3-ad90-facb807e5adb in "quote here"  [ in bracket ] abcdeghijklmn20  ] ) }  POSSIBLE BREAK-IN ATTEMPT
171	2022-06-08T00:20:20.360466-07:00 #:1886:# Facet5=v20 Facet2=v20 HERETWO [ NewPat20FW20 ] NewGen20LX20 ] ) } POSSIBLE BREAK-IN ATTEMPT
27	2022-06-08T00:20:20.580295-07:00 #:1908:# Facet1=v20 Facet2=v20 Facet4=v0 FacetU=abb9e25c-7335-48d5-9385-c7b278daf840 in "quote here"  [ in bracket ] abcdeghijklmn20  ] ) }  POSSIBLE BREAK-IN ATTEMPT
171	2022-06-08T00:20:20.681448-07:00 #:1918:# Facet5=v20 Facet2=v20 HERETWO [ NewPat20FW20 ] NewGen20LX20 ] ) } POSSIBLE BREAK-IN ATTEMPT
27	2022-06-08T00:20:20.850556-07:00 #:1935:# Facet1=v20 Facet2=v20 Facet4=v0 FacetU=1e79b620-6213-492f-8ac9-9a88bbac66e4 in "quote here"  [ in bracket ] abcdeghijklmn20  ] ) }  POSSIBLE BREAK-IN ATTEMPT
18	2022-06-08T00:20:21.481182-07:00 #:1949:# Facet6=v21 Facet2=v20 Facet3=v1 POSSIBLE BREAK-IN ATTEMPT
27	2022-06-08T00:20:21.490098-07:00 #:1950:# Facet1=v21 Facet2=v20 Facet4=v1 FacetU=005b2b1a-cf62-4a79-96b5-9d3d3639fff8 in "quote here"  [ in bracket ] abcdeghijklmn21  ] ) }  POSSIBLE BREAK-IN ATTEMPT
27	2022-06-08T00:20:21.520614-07:00 #:1953:# Facet1=v21 Facet2=v20 Facet4=v1 FacetU=49a539fa-5ec1-4e95-bf5a-231a8b233d7c in "quote here"  [ in bracket ] abcdeghijklmn21  ] ) }  POSSIBLE BREAK-IN ATTEMPT
18	2022-06-08T00:20:21.680362-07:00 #:1969:# Facet6=v21 Facet2=v20 Facet3=v1 POSSIBLE BREAK-IN ATTEMPT
27	2022-06-08T00:20:21.730095-07:00 #:1974:# Facet1=v21 Facet2=v20 Facet4=v1 FacetU=afb071b0-bc69-424b-91fb-0c78d941a202 in "quote here"  [ in bracket ] abcdeghijklmn21  ] ) }  POSSIBLE BREAK-IN ATTEMPT
171	:w2022-06-08T00:20:21.750926-07:00 #:1976:# Facet5=v21 Facet2=v20 HERETWO [ NewPat21FW20 ] NewGen21LX20 ] ) } POSSIBLE BREAK-IN ATTEMPT

```

Derived Pattern-Signatures (PS) or log data Schemas are shown below

```
Psid	Pattern-Signatures
-----------------------------------------------------------------------------------
171	* * * = * * = * HERETWO * * ] ) } POSSIBLE BREAK-IN ATTEMPT
27	* * * = * * = * * = * FacetU = * in * * * ] ) } POSSIBLE BREAK-IN ATTEMPT
18	* * * = * * = * * = * POSSIBLE BREAK-IN ATTEMPT
Notice that * are the variable or mutable fields that can potentially be extracted for reporting.  Everything else is fixed keyword or syntax.  

```

The symbol \* from the PS line is a variable or mutable field that can be extracted for reporting, monitoring, or anomaly tracking. Everything else is a fixed token or constant that gives PS its attribute.
