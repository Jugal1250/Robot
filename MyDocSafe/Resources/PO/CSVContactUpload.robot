*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource    ../../Resources/Contacts.robot

*** Variables ***

${CSVFileLocator}    //input[@type = 'file']
${MaptoDropdownLocator}    (//select[@ng-model = 'modalScope.mappingData[key]'])
${ContinueButton}    //span[text() = 'Continue']//parent::button
${ImportCompletemsg}    //h4[text() = 'Import complete']//parent::div
${CloseButtonContacts}    //span[text() = 'Close']//parent::button

*** Keywords ***

Upload CSV File

    wait until element is enabled    //input[@type = 'file']
    choose file    //input[@type = 'file']    ${CURDIR}${/}2_contacts.csv

Import contacts    [Arguments]    ${Index}    ${Value}

    wait until element is enabled    (//select[@ng-model = 'modalScope.mappingData[key]'])[${Index}]
    select from list by value    (//select[@ng-model = 'modalScope.mappingData[key]'])[${Index}]    ${Value}

Click Continue Button

    wait until element is enabled    ${ContinueButton}
    click element    ${ContinueButton}
    Sleep    1s

Verify the Import completion message

    wait until element is enabled    ${ImportCompletemsg}
    capture page screenshot    Import_Complete.png

Click Close

    wait until element is enabled    ${CloseButtonContacts}
    click element    ${CloseButtonContacts}

Verify contact is imported    [Arguments]    ${Contact_1}    ${Contact_2}

     Search Contact    ${Contact_1}
     Contact should be displayed    ${Contact_1}    ${EMPTY}    ${EMPTY}
     Search Contact    ${Contact_2}
     Contact should be displayed    ${Contact_2}    ${EMPTY}    ${EMPTY}

CSV Contact Upload

    Upload CSV File
    Import contacts    5    email
    Import contacts    9    contactType
    Click Continue Button
    Click Continue Button
    Verify the Import completion message
    click close

Delete the imported contacts    [Arguments]    ${Contact_1}    ${Contact_2}

    sleep    2s
    Search Contact    ${Contact_1}
    Select Contact    ${Contact_1}
    Delete Contact
    Search Contact    ${Contact_2}
    Select Contact    ${Contact_2}
    Delete Contact
    sleep    2s



