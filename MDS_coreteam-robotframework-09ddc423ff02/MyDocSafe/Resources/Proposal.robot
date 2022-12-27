*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../Library/CustomKeywords.py
Resource    ../Resources/PO/CreateProposal.robot

*** Keywords ***

Create a Proposal

    ${ClientEmail}    Enter Client Information
    Select a Service    Payroll
    Select a Form
    Click Skip Verification button
    Select Documents
    Click Skip Payment button
    Click Skip Fact form button
    Click Create Proposal Button
    [Return]    ${ClientEmail}