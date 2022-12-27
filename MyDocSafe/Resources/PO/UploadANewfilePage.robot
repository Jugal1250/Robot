*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${Uploadanewfilebutton}    //span[text() ='Upload new file']//parent::translate//parent::span//parent::div
${Searchforbutton}  //input[@placeholder = 'Search for']
${UploadMoreFileButton}    //span[text() = 'Upload more documents']//parent::translate//parent::button
${CloseButton}    //button[@aria-label = 'Close dialog']
${ChooseDocumentButton}    //span[text() = 'Choose document']//parent::translate//parent::span

*** Keywords ***

File Upload    [Arguments]    ${FILENAME}

    wait until element is enabled    ${Uploadanewfilebutton}    15s    #Wait for Upload new file button
    Drag and Drop    file:${CURDIR}${/}${FILENAME}    ${Uploadanewfilebutton}    #Drag and drop the file
    sleep    4s
    capture page screenshot    File_Upload.png

Click Close Button

    sleep    2s
    wait until element is enabled    ${CloseButton}
    click element    ${CloseButton}

Upload More file    [Arguments]    ${FILENAME}

    wait until element is enabled    ${UploadMoreFileButton}
    click element    ${UploadMoreFileButton}
    Drag and Drop    file:${CURDIR}${/}${FILENAME}    ${ChooseDocumentButton}
    wait until element is enabled    ${UploadMoreFileButton}
    sleep    2s
    click close button
