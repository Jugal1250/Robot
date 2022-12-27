*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${ThreeDotOptionsButton}    //button[@custom-popover-text = 'Options']
${CreateStaticTemplateButton}    //span[text() ='Create static template']//parent::span//parent::button
${NextButton}    //span[text() = 'Next']//parent::translate//parent::span//parent::button
${Document}    //div[@id = 'html-0']
${SignatureButton}    //span[text() = 'Signature']//parent::translate//parent::a
${SignatureButton1}    //span[text() = 'Signature']
${SaveTemplateButton}    //span[text() = 'Save template']//parent::span//parent::button


*** Keywords ***

Click Three Dot Button

     wait until element is enabled    ${ThreeDotOptionsButton}
     sleep    1s
     click element    ${ThreeDotOptionsButton}
     sleep    2s

Click Create static Template button

     wait until element is enabled    ${CreateStaticTemplateButton}
     click element    ${CreateStaticTemplateButton}

Click Next Button

     wait until element is enabled    ${NextButton}
     sleep    1s
     click element    ${NextButton}

Drag the Signature to the document

     sleep    5s
     wait until element is enabled    ${Document}    60s
     SeleniumLibrary.drag and drop    ${SignatureButton}|${SignatureButton1}     ${Document}
     capture page screenshot    Signature_added.png

Click Save Template Button

     wait until element is enabled    ${SaveTemplateButton}
     click element    ${SaveTemplateButton}
     wait until element is enabled    //p[contains(text(), '01_DOC.tpl')]
     capture page screenshot    Template_Created.png

Create static Template

    Click Three Dot Button
    Click Create static Template button
    Click Next Button
    Drag the Signature to the document
    Click Save Template Button