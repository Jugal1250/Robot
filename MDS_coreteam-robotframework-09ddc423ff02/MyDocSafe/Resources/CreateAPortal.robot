*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../Library/CustomKeywords.py
Resource  ../Resources/PO/AddUsers.robot
Resource  ../Resources/PO/CreateClientGroupPage.robot
Resource  ../Resources/PO/CreateContactPage.robot

*** Keywords ***

Creation of Portal

    ${PortalName}    Create a Client group
    Add users to portal group
    [Return]    ${PortalName}

Creation of SubPortal

    ${PortalName}    Create a Client group
    
