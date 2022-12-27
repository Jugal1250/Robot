*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    OperatingSystem
Resource   ../../Resources/PO/CreateStaticTemplate.robot

*** Variables ***

${DownloadButton}    //span[text() ='Download']//parent::span//parent::button

*** Keywords ***

Click Download Button

    wait until element is enabled    ${DownloadButton}
    click element    ${DownloadButton}

Check if file is downloaded and exists    [Arguments]    ${User}

    Click Three Dot Button
    Click Download Button
    wait until created   /home/${User}/Downloads/01_DOC.doc    #C:\\Users\\${User}\\Downloads\\01_DOC.doc
    file should exist    /home/${User}/Downloads/01_DOC.doc    #C:\\Users\\${User}\\Downloads\\01_DOC.doc

