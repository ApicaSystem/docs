# How to Move a ZebraTester Script to an Older Format

It is easy to export a ZebraTester script to a .HAR file so that you can re-import it within an older ZebraTester version. For example, if you have created a script in ZebraTester 7.5A but need to convert it to an older version, such as 7.0B, follow the steps outlined in this article.

## Step 1: Click the “Export” Icon in the ZebraTester Toolbar <a href="#howtomoveazebratesterscripttoanolderformat-step1-clickthe-export-iconinthezebratestertoolbar" id="howtomoveazebratesterscripttoanolderformat-step1-clickthe-export-iconinthezebratestertoolbar"></a>



## Step 2: Click the “HAR Format” Button <a href="#howtomoveazebratesterscripttoanolderformat-step2-clickthe-harformat-button" id="howtomoveazebratesterscripttoanolderformat-step2-clickthe-harformat-button"></a>



Click the “HAR Format” button and click “Save HAR”. Then click “Download HAR”.

## Step 3: Import the Downloaded .HAR File into the Older ZebraTester Version <a href="#howtomoveazebratesterscripttoanolderformat-step3-importthedownloaded.harfileintotheolderzebratesterv" id="howtomoveazebratesterscripttoanolderformat-step3-importthedownloaded.harfileintotheolderzebratesterv"></a>

Move the .har into your /MyTests folder in your old ZT instance (or whatever folder you have configured within the mytests.dat file in the root ZebraTester directory to host your test scripts). Click the “convert HAR to recorded session” button to the right of the .har file in the Project Navigator:



The button will convert the .har file into a .prxdat file, which you can then open in the old ZebraTester instance.

Unfortunately, exporting and importing a har file will not save any inline scripts, plugins, variable extractions/assignments, and many other ZebraTester-specific script features. As such you will need to re-extract and re-assign variables, re-import inline scripts, and re-import any other features which were a part of the original script.
