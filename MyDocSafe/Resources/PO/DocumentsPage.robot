*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py

*** Variables ***

${PlusbuttonDocuments}    //button[@class = 'md-fab md-primary md-button md-default-theme md-ink-ripple']
${Newfolderbutton}    //span[text() = 'New folder']//parent::span//parent::button

*** Keywords ***

Click plus button from documents window

    wait until element is enabled    ${PlusbuttonDocuments}    15s    #Wait for plus button
    click element    ${PlusbuttonDocuments}    #Click Plus button

Click New folder

    wait until element is enabled    ${Newfolderbutton}    #Wait for new folder button
    sleep    1s
    click element    ${Newfolderbutton}    #Click New folder button
