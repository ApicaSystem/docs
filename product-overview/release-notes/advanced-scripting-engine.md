# Advanced Scripting Engine

## Major Release V7.5-B (Installation Kit dated April 17, 2024)

ZebraTester 7.5-B release contains the following new features.

* Support for Color Blindness: To improve support for vision impairments and color blindness adaptation we have added new themes to the GUI configuration section.
* Ability to change request method from the ZT GUI: This gives the users the ability to change request method from the ZT GUI. Depending on the request method the Request body field will be enabled & visible or not.
* Support user agent details from a file: Provides an option in ZT personal settings GUI settings area, where user can upload a JSON file, which have all the latest User-Agents details.
* Updated Browser Agent List: All the current and latest browser agent list has been updated. • Option to Disable Page Breaks: Option to comment/disable a page break in the recorded session.
* Variables as Page Break Names: Users can use variables when setting my page-breaks names to make scripts more dynamic.
* Add OR condition for content type validation: Logical OR condition against content type validation can be tested by users.
* ZebraTester Controller Pull file (.wri): User will be able to pull files from the execagent that have been written by the feature "writetofile". For this the files need to be pulled to the controller as any other out/err/result file.
* WebSocket Extension (MS1):  WebSocket implementation capabilities of Zebra Tester, allowing users to conduct more comprehensive testing of WebSocket-based applications. A detailed how guide on how to use WebSocket extension is added in the documentation folder.

&#x20;\
In addition, Zebra Tester V7.5-B release contains the following bug fixes / improvements:

* Bug Fix for XML extractor giving 500 internal error in ZT scripts.
* .Har file conversion issue.
* Conflict when using variables as Mime Type validation.
* Zebra Tester -Auto assign Fix
* Fix for time zone lists, shows the java standard supported time zones without the deprecated ones.
* Detailed Replay logs in ZT (extended logs)
* ALPN Protocol Negotiation
* Page Break - Threshold Breach (Trigger & Abort)
* Library Update (Update JGit library): Updated the JGit library to the latest version to leverage new features and improvements.
* Fix issues with JavaScript editor in ZT.

Read previous Release notes,&#x20;
