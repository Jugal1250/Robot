*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource    ../Resources/PO/AddANewFolderPage.robot
Resource    ../Resources/PO/SearchAFolder.robot
Resource    ../Resources/PO/UploadANewfilePage.robot
Resource    ../Resources/PO/DocumentsPage.robot


*** Variables ***

${FolderName}


*** Keywords ***

Wait for folder    [Arguments]    ${FolderName}

    wait until element is enabled    //button[contains(@aria-label, '${FolderName}')]    15s

Create a new folder

    Click plus button from documents window
    Click New folder
    ${FolderName}    Enter folder name
    Click Create a new folder button
    Enter text in the search box    ${FolderName}
    Press Enter Key
    press keys    None    TAB
    [Return]    ${FolderName}

Upload file    [Arguments]    ${FILENAME}

    ${FolderName}    Create a new folder
    Select the folder
    File Upload  ${FILENAME}
    [Return]    ${FolderName}

