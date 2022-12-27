*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${DocViewer}    //div[@id = 'html-0']
${DocumentCloseButton}    //button[@ng-click = 'closeModal()']


*** Keywords ***

Navigate to folder    [Arguments]    ${Foldername}

    wait until element is enabled    //button[contains(@aria-label,'${Foldername}')]    10s
    sleep    1s
    click element    //button[contains(@aria-label,'${Foldername}')]

Open the document    [Arguments]    ${DocName}

    wait until element is enabled    //button[contains(@aria-label,'${DocName}')]    30s
    click element    //button[contains(@aria-label,'${DocName}')]
    sleep    2s
    wait until element is visible    //div[@id = 'html-0']    20s
    capture page screenshot

Close Document

    wait until element is enabled    ${DocumentCloseButton}
    click element    ${DocumentCloseButton}

