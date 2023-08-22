*** Settings ***
Documentation       Automating with Selenium and Edge in IE compatibility mode.

Library    RPA.Browser.Selenium


*** Variables ***
${URL}    https://robocorp.com
${WEBDRIVER_PATH}    bin${/}IEDriverServer.exe  # 32bit version is recommended
${BROWSER_PATH}    C:${/}Program Files (x86)${/}Microsoft${/}Edge${/}Application${/}msedge.exe


*** Tasks ***
Open Default Edge In IE Mode
    [Documentation]    Opens Edge in IE mode with default configuration and automatic
    ...    webdriver management. (this might be sufficient for you)

    Open Available Browser    ${URL}    browser_selection=Ie


Open Custom Edge In IE Mode
    [Documentation]    Opens Edge in IE mode with custom browser executable and startup
    ...    arguments. (if you decide to customize the run)
    ...    Learn more about what options you can set here: https://www.selenium.dev/documentation/webdriver/browsers/internet_explorer/

    @{ie_args} =    Create List    -port=5555
    &{options} =    Create Dictionary
    ...    arguments    ${ie_args}
    ...    binary_location    ${BROWSER_PATH}

    Open Available Browser    ${URL}    browser_selection=Ie    options=${options}


Open Custom Edge In IE Mode With Capabilities
    [Documentation]    Opens Edge in IE mode with custom settings and explicit driver
    ...    and browser executable paths. Use this to have full control over the run.
    ...    See what kind of raw options you can pass here: https://www.selenium.dev/selenium/docs/api/py/webdriver_ie/selenium.webdriver.ie.options.html

    ${port_arg} =    Set Variable    -port=5555
    &{ie_opts} =    Create Dictionary
    ...    ie.browserCommandLineSwitches    ${port_arg}  # arguments
    ...    ie.edgepath    ${BROWSER_PATH}  # binary location
    ...    initialBrowserUrl    ${URL}  # freezes if not set
    # Other tweaks in case the automation doesn't work as expected.
    ...    ignoreProtectedModeSettings    ${True}
    ...    ignoreZoomSetting    ${True}
    ...    requireWindowFocus    ${True}
    &{ie_caps} =    Create Dictionary    se:ieOptions    ${ie_opts}
    &{options} =    Create Dictionary    capabilities    ${ie_caps}

    Open Browser    ${URL}    browser=Ie
    ...    executable_path=${WEBDRIVER_PATH}  # webdriver exe which is not in PATH
    ...    options=${options}  # custom capaibilities, browser path and CLI args
