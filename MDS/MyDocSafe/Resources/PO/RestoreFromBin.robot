*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${RestoreButton}    //span[text() = 'Restore']//parent::span//parent::button

*** Keywords ***

Restore File or folder    [Arguments]    ${FileorFolderName}

    sleep    10s
    wait until element is enabled    //p[contains(text(), '${FileorFolderName}')]//parent::div//parent::div//parent::div/div[2]/button    15s
    scroll element into view    //p[contains(text(), '${FileorFolderName}')]//parent::div//parent::div//parent::div/div[2]/button
    sleep    1s
    click element    //p[contains(text(), '${FileorFolderName}')]//parent::div//parent::div//parent::div/div[2]/button
    sleep    1s
    wait until element is enabled    ${RestoreButton}    10s
    click element    ${RestoreButton}
    Sleep    10s
    capture page screenshot    Restore.png