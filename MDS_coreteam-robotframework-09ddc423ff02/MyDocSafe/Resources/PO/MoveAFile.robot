*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource    ../../Resources/PO/MoveFolder.robot
Resource    ../../Resources/PO/DocumentsPage.robot
Resource    ../../Resources/PO/UploadANewfilePage.robot
Resource    ../../Resources/PO/AddANewFolderPage.robot
Resource    ../../Resources/PO/SearchAFolder.robot
Resource    ../../Resources/PO/OpenDocument.robot

*** Variables ***

${DocumentUploadButton}    //span[text() = 'Document upload']//parent::span//parent::button
${ChooseDocumentButton}    //span[text() = 'Choose document']//parent::translate//parent::span//parent::label
${Created}    //span[text() = 'Created']//parent::span//parent::button
${AddAFolderButton}    //span[text() = 'Add Folder']//parent::translate//parent::button

*** Keywords ***

Click Document Upload Button

    wait until element is enabled    ${DocumentUploadButton}
    sleep    1s
    click element    ${DocumentUploadButton}

Sort by Date


    wait until element is enabled    ${Created}    30s
    sleep    1s
    click element    ${Created}
    wait until element is enabled    ${Created}    30s
    sleep    1s
    click element    ${Created}

Choose Document    [Arguments]    ${FILENAME}

    wait until element is enabled    ${ChooseDocumentButton}    #Wait for Upload new file button
    Drag and Drop    file:${CURDIR}${/}${FILENAME}    ${ChooseDocumentButton}    #Drag and drop the file
    sleep    5s
    capture page screenshot    File_Upload.png

Click Add a Folder button

    wait until element is enabled    ${AddAFolderButton}
    click element    ${AddAFolderButton}

Document Upload    [Arguments]    ${FILENAME}

    Click Document Upload Button
    Choose Document    ${FILENAME}
    Click Close Button

Verify the file is moved successfully    [Arguments]    ${FolderName}    ${FileName}

    Search A Folder    ${FolderName}
    Select the folder
    Open the document    ${FileName}

Move File

    [Return]    ${FolderName}
    Click Three Dot Button
    Click Move button
    Click Add a Folder button
    ${FolderName}    Enter folder name
    Click Create a new folder button
    Click Move Here Button