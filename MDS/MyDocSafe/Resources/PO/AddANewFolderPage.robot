*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py

*** Variables ***

${Foldernametextbox}    //input[@name = 'name']
${CreateaNewfolderbutton}    //span[text() = 'Create a new folder']//parent::translate//parent::button
${FolderName}

*** Keywords ***

Enter folder name

    [Return]    ${FolderName}
    ${FolderName}    randomword
    sleep    2s
    wait until element is enabled    ${Foldernametextbox}    #Wait for folder name field
    input text    ${Foldernametextbox}     ${FolderName}    #Enter folder name


Click Create a new folder button

    wait until element is enabled    ${CreateaNewfolderbutton}    #Wait for Create a new folder button
    click element    ${CreateaNewfolderbutton}    #Click Create a new folder button
    sleep    5s
    Log    ${FolderName}