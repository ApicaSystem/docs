# How To Pace a Selenium Script

#### How to pace your script <a href="#howtopaceaseleniumscript-howtopaceyourscript" id="howtopaceaseleniumscript-howtopaceyourscript"></a>

The biggest reason you want to pace your script it to have a more optimized runtime. You only wait the minimum amount of time throughout the script. This is mainly done with waitForX or waitForNotX commands, where X represents the different types of elements, text, objects etc. This can be extra important when working with Selenium together with ASM as the there are two different click commands.

**Case #1 - waitForElementPresent or waitForVisible**

When you're creating your script, one of the best ways to have as little wait times as possible between actions is to only wait until the elements you want to use are "ready" to be used. This is usually when the element is either Present or Visible.

**Step-by-step guide**

1\. clickAndNotWait

1\. waitForElementPresent

**Case #2 - waitForElementNotPreset or waitForNotVisible**

In some cases, a site might have things like loading symbols that you don't know how long time they take. This is often solved by putting in a "pause" in the script, but a better solution is to use an extra step that will pause the script while it is loading and will continue as soon as the loading is done.

**Step-by-step guide**

By having an extra step in your script that will wait for a loading symbol to not be visible to you can shave more time out of your script and skip using unnecessary pauses.

1\. clickAndNotWait

2\. waitForNotVisible

3\. waitForElementPresent
