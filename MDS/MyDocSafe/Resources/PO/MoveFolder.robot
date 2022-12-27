*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/CreateStaticTemplate.robot


*** Variables ***

${MoveFolder}    //span[text() = 'Move']//parent::span//parent::button
${FolderSelecterSearchBox}    //input[@ng-model = 'vm.searchTerm']
${MoveHereButton}    //span[contains(text(), 'Move here')]//parent::button

*** Keywords ***

Click Move button

    wait until element is enabled    ${MoveFolder}
    click element    ${MoveFolder}

Folder Selector    [Arguments]    ${FolderName}

    wait until element is enabled    ${FolderSelecterSearchBox}
    sleep    2s
    input text    ${FolderSelecterSearchBox}    ${FolderName}
    press keys    ${FolderSelecterSearchBox}    ENTER
    wait until element is enabled    //button[contains(@aria-label, '${FolderName}')]
    sleep    2s
    click element    //button[contains(@aria-label, '${FolderName}')]

Click Move Here Button

    wait until element is enabled    ${MoveHereButton}
    click element    ${MoveHereButton}

Move folder    [Arguments]    ${FolderName}

    press keys    None    TAB
    Click Three Dot Button
    Click Move button
    Folder Selector    ${FolderName}
    Click Move Here Button