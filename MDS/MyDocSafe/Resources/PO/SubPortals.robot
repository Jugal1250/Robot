*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource  ../../Resources/PO/CreateClientGroupPage.robot

*** Variables ***

${SubPortalsMenuButton}    //a[@aria-label = 'Subportals']//parent::div

*** Keywords ***  a Portal

    ${PortalName}    Create a Client group
    [Return]    ${PortalName}

Navigate to SubPortals Menu

    wait until element is enabled    ${SubPortalsMenuButton}    15s
    click element    ${SubPortalsMenuButton}

Create a Subportal

    ${SubPortalName}    Create a Client group
    [Return]    ${SubPortalName}


Check Subportal is created    [Arguments]    ${SubPortalName}

    wait until element is enabled    //button[contains(@aria-label, '${SubPortalName}')]//parent::div    15s
    capture page screenshot    SubPortal_Creation.png