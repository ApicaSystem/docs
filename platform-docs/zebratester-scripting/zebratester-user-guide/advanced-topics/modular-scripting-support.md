# Modular Scripting Support

Here is an example of the modularization of the script:

* Users want to test a scenario in which that user only wants to log in one time and do multiple actions on the application, and then the end-user wants to log out.
* In ZebraTester, generally, all the pages will execute for every loop, so the above scenario is not possible by using the outer loop for a Virtual user. ZT has a possibility that the user can have inner loops around the pages, which will execute as many inner loops as the user sets. But still, there is no way that ZT can control the execution of the last page (for example, log out) only at the last loop for a Virtual user. So here we are explaining how we can achieve this scenario in ZT with the help of inner loops and a plugin called "SupportModularScripts." The plugin will be available as a part of the ZT installation.
* Suppose we have 5 pages in a script, where the first and last pages should only execute one time for a Virtual user. The first page should execute on the first loop, and the last page should execute on the last loop for a Virtual user.
* The linked Modular Scripting Example video (based on ZebraTester V5.5X) describes how to achieve this and has the replay of the script and a load test with multiple users.
  * [https://apica-packages.s3.eu-central-1.amazonaws.com/current/zebratester/docs/55Z/modular+scripting.mov](https://apica-packages.s3.eu-central-1.amazonaws.com/current/zebratester/docs/55Z/modular+scripting.mov)
