# Selenium browser automation with Edge in Internet Explorer mode

This robot demonstrates how to run your Edge browser on a Windows machine in IE mode.
This is useful for web apps that cannot run in other browsers (like Chromium Edge or
Chrome) due to compatibility issues.


## Requirements

This was tested on Windows 10 and 11 by running the tasks below. On the system, the
latest Microsoft Edge (Chromium based browser) was installed and also Internet Explorer
11 was enabled in Windows Features.

Please read more about the prerequisites and how to enable IE mode for Edge below:
- [What is Internet Explorer (IE) mode?](https://learn.microsoft.com/en-us/deployedge/edge-ie-mode)
- [Enable IE mode on Microsoft Edge](https://docs.oracle.com/cd/F52330_01/installation_guides/insbridge_rm_client_guide/Content/Guides_RateManager/Insbridge%20RateManager%20Client%20Setup%20Guide/Enable%20IE%20mode%20on%20Microsoft%20Edge.htm)
- [IE Driver Server configuration](https://www.selenium.dev/documentation/ie_driver_server/#required-configuration)

### Edge browser configuration for IE mode

Allow websites to use this mode
![Edge IE Settings](https://raw.githubusercontent.com/robocorp/example-ie-mode-edge/master/bin/1-edge-ie-settings.png)

Enable button for page reload in this mode
![Edge IE Button](https://raw.githubusercontent.com/robocorp/example-ie-mode-edge/master/bin/2-edge-ie-button.png)


## Tasks

- `Open Default Edge In IE Mode`: Simplest example which opens IE with the well known
  `Open Available Browser` keyword.
- `Open Custom Edge In IE Mode`: Same as above, but this time you have the possibility
  to specify a custom MS Edge binary path along with its optional arguments.
- `Open Custom Edge In IE Mode With Capabilities`: You're in full control over the
  arguments, capabilities and both webdriver and browser's used executables in order to
  fully customize the run. Since the `Open Browser` keyword is used here, a webdriver
  has to be explicitly provided. (the other tasks will automatically download and use
  such a webdriver executable)
