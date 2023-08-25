*** Settings ***
Documentation       Automating with Selenium and Edge in IE compatibility mode.

Library    RPA.Browser.Selenium

Variables    variables.py


*** Tasks ***
Open Default Edge In IE Mode
    [Documentation]    Opens Edge in IE mode with default configuration and automatic
    ...    webdriver management. (this might be sufficient for you)

    Open Available Browser    ${URL}    browser_selection=Ie


Open Private Edge In IE Mode
    [Documentation]    Opens Edge in IE mode privately with custom browser executable
    ...    and startup arguments. (if you decide to customize the run with CLI args)
    ...    Learn more about what options you can set here: https://www.selenium.dev/documentation/webdriver/browsers/internet_explorer/

    Open Available Browser    ${URL}    browser_selection=Ie    options=${IE_OPTIONS}


Open Custom Edge In IE Mode
    [Documentation]    Opens Edge in IE mode with custom settings and explicit driver
    ...    and browser executable paths. Use this to have full control over the run.
    ...    See what kind of raw options you can pass here: https://www.selenium.dev/selenium/docs/api/py/webdriver_ie/selenium.webdriver.ie.options.html

    &{ie_opts} =    Create Dictionary
    ...    ie.edgepath    ${BROWSER_PATH}  # binary location
    # ...    initialBrowserUrl    ${URL}  # may freeze if not set, but not necessary
    # Other tweaks in case the automation doesn't work as expected.
    ...    ignoreZoomSetting    ${True}
    ...    requireWindowFocus    ${True}
    # Comment this out if "Protected Mode" is enabled or disabled on all levels.
    ...    ignoreProtectedModeSettings    ${True}
    &{ie_caps} =    Create Dictionary    se:ieOptions    ${ie_opts}
    &{options} =    Create Dictionary    capabilities    ${ie_caps}

    Open Browser    ${URL}    browser=Ie
    ...    executable_path=${WEBDRIVER_PATH}  # webdriver exe which is not in PATH
    ...    options=${options}  # custom options including an explicit browser path
