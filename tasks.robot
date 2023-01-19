*** Settings ***
Documentation       Automating with Selenium and Edge in IE compatibility mode.

Library    RPA.Browser.Selenium


*** Variables ***
${URL}    https://robocorp.com
${WEBDRIVER_PATH}    bin${/}IEDriverServer.exe
${BROWSER_PATH}    C:${/}Program Files (x86)${/}Microsoft${/}Edge${/}Application${/}msedge.exe


*** Tasks ***
Open Default Edge In IE Mode
    [Documentation]    Opens Edge in IE mode with default configuration and automatic
    ...    webdriver management. (this might be sufficient for you)

    Open Available Browser    ${URL}    browser_selection=ie


Open Custom Edge In IE Mode
    [Documentation]    Opens Edge in IE mode with custom browser executable and startup
    ...    arguments. (if you decide to customize the run)

    @{ie_args} =    Create List    --ie-mode-test
    &{options} =    Create Dictionary
    ...    arguments    ${ie_args}
    ...    binary_location    ${BROWSER_PATH}

    Open Available Browser    ${URL}    browser_selection=ie    options=${options}


Open Custom Edge In IE Mode With Capabilities
    [Documentation]    Opens Edge in IE mode with custom settings and explicit driver
    ...    and browser executable paths. (use this to have full control over the run;
    ...    complete list of supported options: https://www.selenium.dev/selenium/docs/api/py/webdriver_ie/selenium.webdriver.ie.options.html)

    &{ie_opts} =    Create Dictionary
    ...    ie.browserCommandLineSwitches    --ie-mode-test  # arguments
    ...    ie.edgepath    ${BROWSER_PATH}  # binary location
    ...    initialBrowserUrl    https://www.google.com  # freezes if left with default
    ...    ignoreProtectedModeSettings    ${True}
    ...    ignoreZoomSetting    ${True}
    ...    requireWindowFocus    ${True}
    &{ie_caps} =    Create Dictionary    se:ieOptions    ${ie_opts}
    &{options} =    Create Dictionary    capabilities    ${ie_caps}

    Open Browser    ${url}    browser=ie
    ...    executable_path=${WEBDRIVER_PATH}  # webdriver exe which is not in PATH
    ...    options=${options}  # custom capaibilities, browser path and CLI args
