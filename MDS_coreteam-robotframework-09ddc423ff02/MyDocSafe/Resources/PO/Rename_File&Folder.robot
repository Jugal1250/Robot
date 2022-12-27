*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource    AddANewFolderPage.robot
Resource    ../FileUpload.robot
Resource    CreateStaticTemplate.robot
Resource    Deletion.robot
Resource    SearchAFolder.robot

*** Variables ***

${Rename_Icon}    //span[contains(text(),"Rename")]
${Rename_Field}    //input[@name="name"]
${Rename_Button}    //button[@ng-click="ctrl.save()"]//span[contains(text(),"Rename")]
${AddNew}    //div[@class="layout-align-start-center layout-row"]//md-menu
${F_name}    f01
${D_name}    d01


*** Keywords ***

Enter name in rename Field    [Arguments]    ${Renew_name}

    Sleep    2s
    Wait Until Element Is Visible    ${Rename_Field}
    Click Element    ${Rename_Field}
    Log To Console    Enter the Rename of file or folder
    Input Text    ${Rename_Field}    ${Renew_name}
    Click Element    ${Rename_Button}
    Log To Console    save the rename

Click on RenameButton

    Wait Until Element Is Visible    ${Rename_Icon}
    Click Element    ${Rename_Icon}
    Log To Console   clicked on rename button

Rename file

    Sleep    2s
    Click on RenameButton
    Enter name in rename Field    ${D_name}
    Log To Console    Renamed file
    Delete the File
    Log To Console    delete file

Rename folder

    Create a new folder
    Click Three Dot Button
    Click on RenameButton
    Enter name in rename Field    ${F_name}
    Search A Folder    ${F_name}
    Log To Console    Renamed folder
    Delete the folder
    Log To Console    delete folder



