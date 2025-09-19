# 2. Scripting the Load Test Session

As a category, once you have a Load Test session, these are the areas that will need addressing

1. [**HTTP Response Verification & Failure Actions:**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/151814171/1.+HTTP+Response+Verification+Actions+on+Failure) Validate HTTP responses and what to do when they are not as expected.
2. [**Var Handler**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/28147864/2.+Dynamic+Session+Parameters+Var+Handler): This powerful tool displays detailed information about a recorded URL and supports composing dynamically exchanged session parameters over the entire Web-surfing session. At the Var Handler’s core is **extracting values** from received HTML pages into variables - from HTML forms or hyperlink-parameters - and to **assign such variables to parameters** of succeeding HTTP requests, instead of using the "burned in" values of a recorded Web surfing session.&#x20;
   1. **Var Finder**: Searches and finds dynamically-exchanged CGI (or form) parameters. Var Finder also supports extracting variables from Input files and from "user input fields" (global load test program parameters).
   2. [**Input fields**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405482/2b.+Var+Handler%3A+Input+Fields): be prompted to Add load test program options (arbitrary global variables), at the start of the load test.
   3. [**Input files**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/152043557/2c.+Var+Handler%3A+Input+Files): extract variables from external text files.
3. [**Inner Loops**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/4620850/3.+Inner+Loops): define “inner loops” which include only some web pages of a recorded web surfing session.
4. [**URL Loops**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/150405627/4.+URL+Loops)**:** add loops with to the recorded session.
5. [**User-Defined Transactions and Page Breaks**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/148865739/5.+User-Defined+Transactions+And+Page+Breaks): defining and inserting Transactions, or belated Page Breaks, into the recorded session.
6. [**Inline Scripts**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/149291571/6.+Inline+Scripts)**:** enhance the load test program with additional features.
7. [**Load Test Plugins**](https://apica-kb.atlassian.net/wiki/spaces/DAZT/pages/151879722/7.+Load+Test+Plug-ins): pre-compiled Java classes that can be loaded into the recorded web session to enhance the functionality of a load test program.
