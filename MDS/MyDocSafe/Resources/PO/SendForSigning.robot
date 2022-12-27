*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource   ../../Resources/PO/CreateStaticTemplate.robot

*** Variables ***

${SendForSigningButton}    //span[text() = 'Send for signing']//parent::span/parent::button
${AddSigningbyEmailTextBox}    //input[@name = 'email']
${Documentloading}    //span[text() = 'Loading the document, please wait.']//parent::p
${SendDocumentButton}    //span[text() = 'Send document']//parent::span//parent::button
${DocumentSentMessage}    //span[text() = 'Return to your documents']//parent::translate//parent::a
${ReturnToYourDocumentsButton}    //span[text() = 'Return to your documents']//parent::translate//parent::a
${NextSendForSigningButton}    //span[text() = 'Next']//parent::translate//parent::button

*** Keywords ***

Click Send For Signing button

    wait until element is enabled    ${SendForSigningButton}
    click element    ${SendForSigningButton}

Add Signee by email or group name    [Arguments]    ${Email}

    wait until element is enabled    ${AddSigningbyEmailTextBox}
    input text    ${AddSigningbyEmailTextBox}    ${Email}
    sleep    2s

Wait for document to load

    wait until element is not visible    ${Documentloading}    20s

Click Send document button

    wait until element is enabled  ${SendDocumentButton}
    click element    ${SendDocumentButton}
    sleep    2s

Verify Document is sent

    wait until element is enabled    ${DocumentSentMessage}
    capture page screenshot    Document_Sent.png

Click Return to your documents button

    wait until element is enabled    ${ReturnToYourDocumentsButton}
    click element    ${ReturnToYourDocumentsButton}

Click Next Button from Send for Signing

    wait until element is enabled    ${NextSendForSigningButton}
    scroll element into view    ${NextSendForSigningButton}
    click element    ${NextSendForSigningButton}

Send For Signing    [Arguments]    ${Email}

    Click Send For Signing button
    Add Signee by email or group name    ${Email}
    Click Next Button from Send for Signing
    Click Next Button
    Click Next Button
    wait for document to load
    Drag the Signature to the document
    Click Send document button
    Verify document is sent
    Click Return to your documents button




