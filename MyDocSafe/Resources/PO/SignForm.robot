*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../library/CustomKeywords.py


*** Variables ***

${FormsButtonRecipient}    //span[text() = 'Forms'] //parent::translate//parent::a
${SearchFormInputtextBox}    //input[@type = 'text']
${SubmitAndSignButton}    (//span[text() = 'SUBMIT and SIGN'] //parent::translate//parent::button)[2]
${ApproveTheDocumentButton}    //span[text() = 'Approve the document']//parent::translate
${SubmitSignature}    //span[text() = 'Submit signature']//parent::button
${PopupWindow}    //ion-modal-view[@id = 'editSignatureDialog']
${AddSignatureButton}    //span[text() = 'Add signature']//parent::span//parent::button

*** Keywords ***

Click Forms

    wait until element is enabled    ${FormsButtonRecipient}    15s
    click element    ${FormsButtonRecipient}
    wait until element is enabled    ${SearchFormInputtextBox}    10s

Search and Select Form    [Arguments]    ${Formname}

    sleep    2s
    wait until element is enabled    ${SearchFormInputtextBox}
    input text    ${SearchFormInputtextBox}    ${Formname}
    press keys    ${SearchFormInputtextBox}    ENTER
    press keys    ${SearchFormInputtextBox}    ENTER
    wait until element is enabled    //button[contains(@aria-label, '${Formname}')]
    double click element    //button[contains(@aria-label, '${Formname}')]

Click Submit and Sign Button

    wait until element is enabled    ${SubmitAndSignButton}    15s
    sleep    1s
    click element    ${SubmitAndSignButton}

Click Approve Button

    wait until element is enabled    ${ApproveTheDocumentButton}    30s
    sleep    1s
    click element    ${ApproveTheDocumentButton}


Submit Signature

     wait until element is enabled    ${AddSignatureButton}
     sleep    1s
     press keys    //input[@ng-model = 'vm.name']    TAB
     press keys    ${AddSignatureButton}    ENTER
     run keyword and ignore error    click element    ${AddSignatureButton}


Wait for Home page

    wait until element is enabled    ${FormsButtonRecipient}


Verify Sign from Sender    [Arguments]    ${FormName}

    wait until element is enabled    //span[contains(text(),'(nivi.mydocsafe@gmail.com) filled out the form ${FormName} in portal Nivi Mydocsafe')]
    capture page screenshot    Signed_notification.png


Sign Form    [Arguments]    ${Formname}

    click forms
    run keyword and ignore error  wait until element is enabled    //md-list-item[@role = 'listitem']    10s
    ${Count}    get element count    //md-list-item[@role = 'listitem']
    run keyword if    ${Count}>1    Search and Select Form    ${Formname}
    Click Submit and Sign Button
    Click Approve Button
    Submit Signature
    capture page screenshot    Signature_submission.png
    sleep    4s

