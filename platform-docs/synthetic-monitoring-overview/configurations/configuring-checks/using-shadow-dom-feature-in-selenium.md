# Using Shadow DOM feature in Selenium

In order to interact with the shadow-root on your application you will need to make sure that it’s open, you can see this by right clicking > inspect on the page. This will bring up the browser dev tools, look for the text `shadow-root (open)` above the element that you want to interact with. If the shadow-root is closed you will not be able to interact with it.

The elements JS path is required for the target in your browser check, longer targets will affect performance so optimization to the target is recommended if possible but not required.

<figure><img src="../../../../.gitbook/assets/image (1099).png" alt=""><figcaption></figcaption></figure>

&#x20;

### Supported Commands: <a href="#supported-commands" id="supported-commands"></a>

* click
* submit
* type
* storeText
* storeValue
* assertValue
* assertText
* sendKeys
* waitForElementPresent

### How to interact with shadow-root in Apica <a href="#how-to-interact-with-shadow-root-in-apica" id="how-to-interact-with-shadow-root-in-apica"></a>

1. Right click on the thing that you want to interact with
2. Click on Inspect
3. Right click on the element that you inspected
4. Hover over Copy and click on JS path
5.  **(The following two steps are not required but it is recommended for performance)**\
    Click on the console tab in the browser dev tools and paste your path there, it should look something like this and the element should be highlighted:

    `document.querySelector("body > form-container").shadowRoot.querySelector("form > label:nth-child(2) > input[type=text]")`
6.  Remove as much of the path as possible leaving on the last part of each element while making sure that the element remains highlighted like this:

    `document.querySelector("form-container").shadowRoot.querySelector("input[type=text]")`
7. Prepare the target by removing `document.querySelector("` at the beginning and `")` at the end
8.  Replace all `").shadowRoot.querySelector("` with `^__APICA_SDOM^` so that it looks something like this:

    `form-container ^__APICA_SDOM^ input[type=text]`
