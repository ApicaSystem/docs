# How to Utilize XPath Within a Selenium Script

#### XPath Creation <a href="#howtoutilizexpathwithinaseleniumscript-xpathcreation" id="howtoutilizexpathwithinaseleniumscript-xpathcreation"></a>

When creating xpath, and some other locators, you have a wide variety of possible ways to create these. Some of them are automatically created from Selenium IDE plugin, FirePath plugin and of course to do it manually. Which ever method you use does not always matter, but what you want is a result which is as specific as possible. This usually means finding something unique in the HTML code which is linked to whatever you want to do on the webpage.

**Selenium IDE:**

Creating an locator with the built in Selenium IDE functionality. There are two basic ways to get xpaths from Selenium IDE. The First us to start the recorder and simply click whichever object you want to record.

After you've recorded the locators will end up in the "target" field in Selenium IDE.

In this case we're getting a relative xpath that is rather unstable due to the fact that it contains a unique ID that is pretty "far" from the target we actually want.

```
div[@id='innerBodyDiv']/header/div[4]/div[2]/ul/li/a/span
```

In this case we will want to use another approach, either firepath or creating a manual xpath.

FirePath:

By using FirePath plugin for FireBug you can often create better, e.g. more unique or shorter xpath's.

When using FireBig the leading "." should not be used in the target field in selenium or in ASM.

It is also best practise to replace the start, "\*", with the actual element type.

In this case the final xpath should look something like

```
li[@id='customer-profile']
```

Manual xpath:

The first thing when creating a manual xpath is to FIND something unique with what you want to find.

```
<a id="burger-menu" class="icon-burger burger" href="javascript:;" tabindex="0" title="Main Menu selected. Select items from the listed sub menus."/>
```

Sometime the automatic functionality of Selenium or FirePath cant find a good unique identifier. Usually the automatic only looks at the id and class. But manually you can match against anything, like in the example above you can look at the href or title.

```
a[@href='javascript:;']
```

This is not unique enough, but is a good example of the ability to match against things that you normally cant by using the automatic functionality.

```
a[contains(@title, 'Main Menu')]
```

By using contains you can match against parts of a identifier instead of the entire thing. This can be good if for example the site uses bootstrap and can add/remove things to the class to make it look different but a part of the class is always static.
