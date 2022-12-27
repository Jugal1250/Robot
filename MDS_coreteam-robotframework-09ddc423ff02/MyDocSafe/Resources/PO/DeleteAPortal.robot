*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${SettingsButton}    (//button[@class = 'md-button md-default-theme md-ink-ripple']/translate/span[text() = 'Settings'])[2]
${OtherActions}    (//span[text() = 'Other actions'])[1]
${DeletePortalGroup}    //button[@ng-click = 'vm.deletePortalGroup()']/translate
${DeleteTheFolderButton}    //span[text() = 'Yes, delete the folder']

*** Keywords ***

Delete Portal Group    [Arguments]    ${PortalName}

    wait until element is enabled    //button[contains(@aria-label, '${PortalName}')]//parent::div/div[2]/md-menu/button
    click element    //button[contains(@aria-label, '${PortalName}')]//parent::div/div[2]/md-menu/button
    ${count}    get element count    //span[text() = 'Settings']
    wait until element is enabled    (//span[text() = 'Settings']//parent::translate//parent::button)[${count}]
    sleep    2s
    click element    (//span[text() = 'Settings']//parent::translate//parent::button)[${count}]
    wait until element is enabled    ${OtherActions}
    sleep    2s
    click element    ${OtherActions}
    wait until element is enabled    ${DeletePortalGroup}
    sleep    2s
    click element    ${DeletePortalGroup}
    wait until element is enabled  ${DeleteTheFolderButton}
    click element    ${DeleteTheFolderButton}
    sleep    2s
    ${Count}    get element count    //button[contains(@aria-label, '${PortalName}')]//parent::div/div[2]/md-menu/button
    run keyword if    ${Count}>0    fail    #PortalNotDeleted