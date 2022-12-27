*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${LoadAll}    //span[contains(text(),'Load all')]

*** Keywords ***

Navigate to tabs    [Arguments]    ${Tabname}

    wait until element is enabled    //span[text() = '${Tabname}']//parent::translate//parent::span//parent::button    #Wait for Portals tab
    sleep    2s
    wait until keyword succeeds    120s    5s    click element    //span[text() = '${Tabname}']//parent::translate//parent::span//parent::button    #Click Portals tab
    sleep    2s

Navigate to Side Pane    [Arguments]    ${PaneName}

    sleep    10s
    wait until element is visible    //span[text() = '${PaneName}']//parent::span//parent::div
    sleep    2s
    double click element    //span[text() = '${PaneName}']//parent::span//parent::div

