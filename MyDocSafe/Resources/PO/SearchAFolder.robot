*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False


*** Variables ***

${Searchtexbox}    //input[@placeholder = 'Search for']
${Folder}    (//button[@class = 'md-no-style md-button md-default-theme md-ink-ripple'])[8]

*** Keywords ***

Enter text in the search box    [Arguments]    ${FolderName}

    clear element text    ${Searchtexbox}
    wait until element is enabled  ${Searchtexbox}    15s    #Wait for Search field
    input text    ${Searchtexbox}    ${FolderName}  #Enter Folder name to searcg

Press Enter Key

    press keys    ${Searchtexbox}    ENTER    #Press Enter to search
    sleep    2s

Verify the folder is created

    press keys    None    TAB
    wait until element is enabled    ${Folder}
    capture page screenshot    Folder_creation.png

Select the folder

    wait until element is enabled    ${Folder}    #wait for the folder name to appear
    double click element    ${Folder}    #Click Folder name

Search A Folder    [Arguments]    ${FolderName}

    sleep    3s
    Enter text in the search box    ${FolderName}
    sleep    3s
    press keys    ${Searchtexbox}    ENTER
    sleep    2s
    press keys    None    TAB