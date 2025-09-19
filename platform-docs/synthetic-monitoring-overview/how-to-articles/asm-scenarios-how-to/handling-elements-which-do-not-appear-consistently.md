# Handling Elements Which Do Not Appear Consistently

It is possible to handle an element within an ASM scenario only if it appears. That way, if the banner does not appear, you do not have to execute any commands which interact with that element.

The following screenshot provides an example of the correct syntax and explains how the process works:



The keywords “popup” and “noPopup” refer to existing labels in the above screenshot. They are not values in the “value” field for steps 12 and 13!

## Step 1: Create an initial label “checkForPopup” <a href="#handlingelementswhichdonotappearconsistently-step1-createaninitiallabel-checkforpopup" id="handlingelementswhichdonotappearconsistently-step1-createaninitiallabel-checkforpopup"></a>

This label name is arbitrary. It may be customized to better describe what you are checking for. As noted by the step numbers in the above screenshot, the script will return to this step later if it clicks on the popup which may or may not appear.

## Step 2: Attempt to store the element <a href="#handlingelementswhichdonotappearconsistently-step2-attempttostoretheelement" id="handlingelementswhichdonotappearconsistently-step2-attempttostoretheelement"></a>

Check for the existence of the element with the “storeElementPresent” command. This command returns a boolean value - True if the element is present, and False if the element is not present.

## Step 3: use the gotoIf command to skip to different parts of the page <a href="#handlingelementswhichdonotappearconsistently-step3-usethegotoifcommandtoskiptodifferentpartsofthepag" id="handlingelementswhichdonotappearconsistently-step3-usethegotoifcommandtoskiptodifferentpartsofthepag"></a>

If “storeElementPresent” returns True, the script will not skip any steps and will execute the “click” command on the banner and the “goto” command to go back and look for the popup again by returning to the “checkForPopup” label. If “storeElementPresent” returns False, the button does not exist, the script will skip over the attempt to interact with the element, and the rest of the script will continue uninterrupted.
