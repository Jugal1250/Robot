*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource   SigningDocuments.robot
Resource   ../../Resources/PO/ChangeSigneeMail.robot

*** Variables ***
${SendAutomaticReminder}    //md-checkbox[@aria-label="Send a automatic reminder"]
${RepeatField}    //input[@ng-model="inputs.signatureAutomaticReminderLimit"]
${RepeatFrequency}    //md-select[@ng-model="inputs.reminderWhen"]
${HourOption}    //md-option[@value="hours"]
${NextButtonAdvOptions}    //button[@ng-click="saveOptions()"]


*** Keywords ***

Add mail and go to advance option    [Arguments]    ${RandomMail}

    sleep    3s
    Input Text    ${Email_Field}    ${RandomMail}
    Log To Console    Adding Mail
    sleep    2s
    log to console    1st signee added
    click element    ${Next1}
    Log To Console    Click Next Button
    click element    ${NextButton}
    Log To Console    Click Next Button

Add value in reminder

    sleep    1s
    click element    ${SendAutomaticReminder}
    Log To Console    Click On Auto Reminder
    Clear Element Text    ${RepeatField}
    Input Text    ${RepeatField}    1
    Log To Console    Entering value of the Repeatfield
    Click Element    ${RepeatFrequency}
    Log To Console    Adding Repeat frequency
    Click Element    ${HourOption}
    Log To Console    Add Hour option
    click element    ${NextButtonAdvOptions}
    Log To Console    Click Next Button

Add Signature field

    sleep    4s
    SeleniumLibrary.drag and drop    ${FirstSigneeSignatureButton}    ${Document}
    Log To Console    Adding Signature
    Click Element    ${SendDocumentButton}
    Log To Console    Click On Send Doc Button

Add Reminder and Send Signee    [Arguments]    ${RandomMail}

    Add mail and go to advance option    ${RandomMail}
    Add value in reminder
    Add Signature field
    Return to your Documents
    Delete the File

