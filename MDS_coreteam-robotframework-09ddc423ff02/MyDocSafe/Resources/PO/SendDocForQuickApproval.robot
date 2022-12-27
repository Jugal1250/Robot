*** Settings ***

Documentation  Switching between Browser Windows in Robot Framework
Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
#Library    Selenium2Library
Library    ImapLibrary
Resource   ../../Resources/PO/ChangeSigneeMail.robot
Resource   ../Common.robot
Resource    Deletion.robot
Resource    TabsPage.robot

*** Variables ***

${NotificationsHeading}    //span[text()="Notifications"]
${AddNew}    //div[@class="layout-align-start-center layout-row"]//md-menu
${Document_Upload}    //span[@class="mds__document__itemName"]//span[text()="Document upload"]
${Upload_From_Computer}    //span[contains(text(),'Upload from your computer')]
${Choose_Document}    //label[@class="md-button"]
${InputDocument}    //label[@class="md-button"]//input
${Close_Button}    //div[@class="md-toolbar-tools"]//button
${DocListCheckBox1}    //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/mds-sidebar[1]/div[1]/section[1]/md-content[1]/div[1]/div[2]/main[1]/div[4]/md-list[1]/div[3]/md-list-item[1]/div[1]/div[2]/md-checkbox[1]/div[1]
${DocListCheckbox2}    //body/div[@id='single-spa-application:angularJsApp']/div[@id='__single_spa_angular_1']/div[2]/div[2]/div[1]/mds-sidebar[1]/div[1]/section[1]/md-content[1]/div[1]/div[2]/main[1]/div[4]/md-list[1]/div[4]/md-list-item[1]/div[1]/div[2]/md-checkbox[1]/div[1]
${QuickApprovalCheckBox}    //md-checkbox
${AddMe}    //div[@class="layout-align-center-center layout-row"]//div//button[@ng-click="addMeAsSignee(signeeForm)"]
${Nextbutton}    //button//translate//span[text()="Next"]
${SendButton}    //span[text()="Send"]
${ReturnToYourDocuments}    //button
${PenIcon}    //div[@class="hide-xs"]//button//md-icon[@md-font-icon="icon-moon-pen"]
${threedotoptionforBigfile}      //button[contains(@aria-label,'Big Word')][1]//..//div//..//md-icon[@aria-label='Options']
${SendForSigningButton}    //span[contains(text(),'Send for signing')]
${SignatureField}    //span[@class="page__field--name"]//span[text()="Signature"]
${AddSignature}    //span[contains(text(),"Ok")]
${ReturnToYourDocuments_BigFile}    //span[contains(text(),'Home')]
${Close_Submitted_Document}    //button[@ng-click="closeModal()"]
${emailInput}    //input[@name="email"]
${Verified_mail}    //td[contains(@onclick,'showTheMessage')][1]
${Verified_mail_for2docs}    (//td[contains(@onclick,'showTheMessage')][1])[1]
${Next1}    //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/form[1]/div[6]/button[2]
${Review_button}    //td//a[starts-with(text(),'Proceed to review')]
${Select_irame}    //iframe[@id='html_msg_body']
${Approve_Document}    //span[contains(text(),'Approve the document')]
${Add_signature_textbox}    //body/div[4]/div[2]/ion-modal-view[1]/ion-content[1]/div[1]/div[1]/div[1]/dl[1]/dd[1]/input[1]
#${Submiit_Signature}    //span[contains(text(),'Submit signature')]
${Add_Signature_03}    //span[contains(text(),'Add signature')]
${Click_on_Signatures}    //span[contains(text(),'Signatures')]
${Click_On_send}     //body/div[@id='single-spa-application:angularJsApp']/div[@id='__single_spa_angular_1']/div[2]/div[2]/div[1]/mds-sidebar[1]/div[1]/section[1]/md-sidenav[1]/md-content[1]/md-list[1]/div[1]/md-list-item[4]/div[1]/a[1]
${Status_Dropdown}    //md-content[1]/div[2]/div[1]//md-input-container[1]/md-select[1]/md-select-value[1]/span[2]
${Signed_Status}    //div//translate//span[text()='Signed']
${Mail_Recieved}    Mail Recieved
${Mail_Not_Recieved}    Mail not recieved yet
${Documents_Tab}    //span[text()="Documents"]
${Delete_Icon}    //md-icon[@md-font-icon="fa fa-trash"]
${UploadMFButton}    //span[text() = 'Upload more documents']//parent::translate//parent::button
${Sign_In_for_Signee}    //a[@href="/signin"]
${Browse_Button}    //input[@type="file"]
${Next_Second_Doc}    //a[@ng-click="nextStep()"]
${Signee_Signature_Field}    //div[@class="page__field"]
${Submit_Document}    //button[@ng-click="sendSignedDocument()"]


*** Keywords ***

Run Keyword Until Success
    [Arguments]     ${Action}    ${Element}
    Wait Until Keyword Succeeds    10s    1s    ${Action}    ${Element}

Upload Multiple Documents

    Click Element    ${AddNew}
    Run Keyword Until Success    Click Element    ${Document_Upload}
    wait_until_element_is_enabled    ${Upload_From_Computer}
    Choose File  ${Input_Document}  ${CURDIR}/01_DOC.doc \n ${CURDIR}/01_DOC.pdf
    Sleep  5s
    Click Element    ${Close_Button}

Upload Single Document

    Click Element    ${AddNew}
    Run Keyword Until Success    Click Element    ${Document_Upload}
    wait_until_element_is_enabled    ${Upload_From_Computer}
    Choose File  ${Input_Document}  ${CURDIR}/01_DOC.doc
    Sleep  5s
    Click Element    ${Close_Button}

Select Two Check Box

    Sleep    10s
#    Click Element    ${DocListCheckBox1}
#    click element    ${DocListCheckbox2}
    Click Element    (//div[@class='md-container md-ink-ripple']//parent::md-checkbox)[1]
    sleep    10s

Click on Pen Icon checkbox

    Click Element    ${PenIcon}
    Sleep    5s

Adding signing mail    [Arguments]    ${mail}

    wait until element is enabled    ${AddSigningbyEmailTextBox}
    input text    ${AddSigningbyEmailTextBox}    ${mail}
    sleep    5s
    Press Keys    ${AddSigningbyEmailTextBox}    TAB
    click element    ${Next1}
    sleep    2s

Quick Approve and return to doc

    Click Element    ${QuickApprovalCheckBox}
    Sleep    5s
    Click Element    ${SendButton}
    Sleep    5s
    Click Element    ${SendButton}
    Sleep    5s
    Click Element    ${ReturnToYourDocuments}
    Sleep    5s
    Log To Console    Returned to the Documents

Delete Multiple Doc

     Select Two Check Box
     Click Element    ${Delete_Icon}
     Select 'Delete This File' in the popup

Send Document For Quick Approval    [Arguments]    ${mail}

    Select Two Check Box
    Click on Pen Icon checkbox
    Adding signing mail    ${mail}
    Quick Approve and return to doc
    Log To Console    ${mail}
    Navigate to tabs    Documents
    Delete Multiple Doc
    Close Browser


Uploding large Document

    wait until element is enabled    ${AddNew}
    Click Element    ${AddNew}
    wait until element is enabled    ${Document_Upload}
    Run Keyword Until Success    Click Element    ${Document_Upload}
    wait_until_element_is_enabled    ${Upload_From_Computer}
    Choose File  ${Input_Document}  ${CURDIR}/Big Word 15MB.pdf
    sleep    2s
    wait until element is enabled    ${UploadMFButton}    20s
    sleep    2s
    wait until element is enabled    ${Close_Button}
    Click Element    ${Close_Button}
    sleep    2s

Send Doc For Signing

    wait until element is enabled    ${threedotoptionforBigfile}  30s
    click element   ${threedotoptionforBigfile}
    sleep    2s
    wait until element is enabled    ${SendForSigningButton}    30s
    click element   ${SendForSigningButton}
    Sleep    5s

Add Signee mail and Drag Signature

    Click Element    ${AddME}
    Click Next Button
    Click Next Button
    wait for document to load
    Drag the Signature to the document
    click element    ${SignatureField}
    sleep    5s
    click element    ${AddSignature}
    Click Send document button
    sleep    8s
    Click Element    ${Close_Submitted_Document}
    Click Element  ${ReturnToYourDocuments_BigFile}


Upload Big file

    Uploding large Document
    Send Doc For Signing
    Add Signee mail and Drag Signature
    Navigate to tabs    Documents

Go to the sender mail    [Arguments]    ${random_string}

    sleep    60s
    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=${random_string}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=${random_string}
    log to console    mailinator lunch with particular user:${random_string}
    sleep    7s
    element should be visible    ${verified_mail}
    log to console    Mail Recieved

Verify Please sign two documents mail    [Arguments]    ${random_string}


    sleep    30s
    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=${random_string}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=${random_string}
    log to console    mailinator lunch with particular user:${random_string}
    sleep    25s
    element should be visible    ${verified_mail_for2docs}
    log to console    verifying sended mail which is having two doc on mailinator

open mailinator    [Arguments]    ${random_string}

    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=${random_string}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=${random_string}
    sleep   2s
    maximize browser window

Verifying doc On the mailinatore

    sleep  10s
    click element    ${verified_mail_for2docs}
    sleep  10s
    select frame    ${Select_irame}
    log to console    changing frame
    sleep    5s
    click element    ${Review_button}|//a[normalize-space()='Access your document']
    log to console    click on button which is having document need to sign
    sleep    20s
    unselect frame


Switch the tab

    sleep    5s
    switch window    title:MyDocSafe
    log to console    Switching tab
    sleep    5s

Signin again with the signee mail to approve document    [Arguments]    ${Email_address}    ${Password}

    Click Element    ${Sign_In_for_Signee}
    Login with valid credentials    ${Email_address}    ${Password}


Sign first document

    click element    ${Approve_Document}|${Signee_Signature_Field}
    log to console    click on approve button
    Sleep    3s
    wait until element is enabled    //li[@ng-click="vm.selectType('upload')"]    
    Click Element    //li[@ng-click="vm.selectType('upload')"]
    Sleep    2s
    wait until element is enabled    ${Browse_Button}
    Log To Console    ${CURDIR}
    Choose File  ${Browse_Button}  ${CURDIR}/sign.png
    Submit the signature

Sign second document

    Wait Until Element Is Enabled    ${Next_Second_Doc}    10s
    Click Element    ${Next_Second_Doc}
    sleep    7s
    Sign first document


Sign documennt inside signee account

    Sign first document
    Sign second document

Approving and sign doc on mailinatore side    [Arguments]    ${random_string}

    click element    ${Approve_Document}
    log to console    click on approve button
    sleep  10s
    wait until element is enabled    ${Add_signature_textbox}
    input text    ${Add_signature_textbox}    ${random_string}
    log to console    Adding signature
    sleep    2s

Submit the signature

    sleep    2s
    click element    ${Add_Signature_03}
    log to console    submitting the signature

Sign on the documents in sender mail    [Arguments]    ${random_string}    ${email}

    open mailinator    ${random_string}
    Verifying doc On the mailinatore
    Switch the tab
    ${count} =  Get Element Count    ${Sign_In_for_Signee}
    IF   ${count}==1
        Signin again with the signee mail to approve document    ${email}    RobotFramework2!
    ELSE
        Sign documennt inside signee account
        Close Browser
    END

Go back to sender account

    sleep   2s
    click element    ${Click_on_Signatures}
    log to console    go to the signatures tab
    sleep    2s
    click element    ${Click_On_send}
    log to console    click on send button on left-hand side
    sleep    3s
    Click Element    //md-content[1]/div[2]/div[1]//md-input-container[1]/md-select[1]/md-select-value[1]/span[2]
    log to console    click on drop box
    click element    ${Signed_Status}
    log to console    change status to the signed
    sleep    5s