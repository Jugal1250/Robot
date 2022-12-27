*** Settings ***

Documentation  Switching between Browser Windows in Robot Framework
Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource   ../../Resources/PO/SendForSigning.robot
Resource   ../Common.robot
Resource   ../../Resources/PO/SendForSigning.robot
Resource   ../../Resources/PO/AddNewContact.robot
Resource   ../../Resources/PO/SendDocForQuickApproval.robot
Resource    Deletion.robot


*** Variables ***

${Return_button}    //a[@class="btn btn-std btn-centered"]
${Signature_Tab}    //span[text()="Signatures"]
${Sent_Button}    //a[@href="/signatures/sent"]
${Search_Box}    //input[@ng-model="$mdAutocompleteCtrl.scope.searchText"]
${Clear_Search_Area}    //button[@aria-label="Clear Input"]
${Change_Icon}    //button[@ng-click="vm.showChangeEmailForm(sign)"]
${Change_Email_Field}    //input[@placeholder="Change email address"]
${Goto_Change_Field}    //span[text()="Signing request created."]
${Change_Button}    //button[@ng-click="vm.changeEmail(sign)"]
${Close_Button}    //button[@ng-click="vm.closeDialog()"]//span[contains(text(),"Cancel")]
${Verified_mail}    //td[contains(@onclick,'showTheMessage')][1]
${Verified_mail_3}    (//td[contains(@onclick,'showTheMessage')][1])[3]
${Review_button}    //td//a[starts-with(text(),'Proceed to review')]
${Select_irame}    //iframe[@id='html_msg_body']
${Add_signature_textbox}    //div[@ng-click="fieldClick(field)"]
${Enter_Signature}    //input[@placeholder="Enter your full name"]
${Save_Signature_Button}    //button[@ng-click="vm.saveSignature()"]
${Submit_Document}    //button[@ng-click="sendSignedDocument()"]
${Signee_Signature_Field}    //div[@class="page__field"]
${Signature_NameField}    //input[@name='name']
${Email_Field}    //input[@name='email']
${Nextbutton}    //button[@ng-click="addPerson(signeeForm)"]
${SigneePageNextbutton}    //button[@ng-click="nextState()"]
${Next1}    //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[1]/form[1]/div[6]/button[2]
${AddAnotherSignee}    //span[text()='Add another signee']
${Document}    //div[@id = 'html-0']
${FirstSigneeSignatureButton}    //li//div//div//span[text()='1st signer']//..//..//..//span[text() = 'Signature']
${SecondSigneeSignatureButton}    //li//div//div//span[text()='2nd signer']//..//..//..//span[text() = 'Signature']
${SecondSigneeTabButton}    //div[@class='member-wrapper-name']//span[text()='2']
${SendDocumentButton}    //button[@ng-click="checkIfAllSigneesHaveFieldsBeforeSending()"]
${SigneeSuggestion1}    //li[@id="md-option-11-0"]//md-autocomplete-parent-scope
${Access_Doc}    //a[normalize-space()='Access your document']
${Accept_invi}    //a[normalize-space()='Accept invitation']



*** Keywords ***


Return to your Documents

    Wait Until Element Is Visible    ${Return_button}
    Log To Console    Return to the Document page
    Click Element    ${Return_button}
    Sleep    2s


Go to the send Menu

    Wait Until Element Is Visible   ${Sent_Button}
    Log To Console    Go To Sent tab
    Click Element    ${Sent_Button}
    Sleep    2s


Search box

    Wait Until Element Is Visible    ${Search_Box}
    Log To Console    searching doc
    Clear Element Text    ${Search_Box}
    Sleep     2s
    input text     ${Search_Box}   01_DOC
    Sleep    2s
    Press Keys    ${Search_Box}    ENTER
    Sleep    5s
    Click Element    ${Clear_Search_Area}
    Log To Console    Click on Cross Icon

click on I button    [Arguments]    ${random_mail001}

    Sleep    2s
    Log To Console    ${random_mail001}
#    Click Element    //div//ul//li//div//span[contains(text(),"rahul.sharma@mailinator.com")]//..//..//..//..//..//..//div//md-icon[@md-font-icon="fas fa-info-circle"]
    Click Element    //md-list-item//div//ul//li//div//span[contains(text(),"${random_mail001}@mailinator.com")]//..//..//..//..//..//..//div//md-icon[@md-font-icon="fas fa-info-circle"]

Change signee in the document

        Wait Until Element Is Visible    ${Change_Icon}
        Log To Console    Change signee in the document
        Click Element    ${Change_Icon}
        Sleep    2s
        Click Element    ${Change_Email_Field}
        Input Text    ${Change_Email_Field}    rahul.sharma_05@mailinator.com
        Log To Console   Email Added in Email_Field
        Sleep    2s
        Click Element    ${Goto_Change_Field}
        Log To Console    Click On Change_Field_1
        Click Element    ${Change_Button}
        Log To Console    Click On Change Button_1
        Sleep    10s
        Press Keys    none    ESC
        Close Browser

Change mail    [Arguments]    ${random_mail001}

    Return to your Documents
    Delete the File
    Navigate to tabs    Signatures
    Go to the send Menu
    Search box
    Log To Console    ${random_mail001}
    click on I button    ${random_mail001}


Adding first Signee

    ${random_mail1}=    Generate Random String    6    [LOWER]
    sleep    3s
    Input Text    ${Email_Field}    ${random_mail1}@mailinator.com
    Log To Console    Adding Mail
    sleep    2s
    log to console    1st signee added
    click element    ${Next1}
    log to console    Next Button clicked
    [Return]    ${random_mail1}

Adding second mail

    click element    ${AddAnotherSignee}
    Input Text    ${Email_Field}    rahul.sharma_06@mailinator.com
    log to console    2nd signee added
    click element    ${Next1}
    Sleep    1s
    click element    ${Next1}
    click element    ${SigneePageNextbutton}
    Log To Console    Signee Page Next Button clicked
    click element    ${NextButton}
    sleep    4s

Drag and drop sign on first signee

    SeleniumLibrary.drag and drop    ${FirstSigneeSignatureButton}    ${Document}
    Log To Console    Signature Added For First Signee
    Click Element    ${SecondSigneeTabButton}
    Log To Console    Clicked On Send Button
    sleep    4s

Drag and drop sign on second signee

    SeleniumLibrary.drag and drop    ${SecondSigneeSignatureButton}    ${Document}
    Log To Console    Signature Added For Second Signee
    Click Element    ${SendDocumentButton}
    Log To Console    Clicked On Send Button
    sleep    2s

Add Multiple Signee

    ${random_mail1}    Adding first Signee
    Adding second mail
    Drag and drop sign on first signee
    Drag and drop sign on second signee
    [Return]    ${random_mail1}



Open Mail   [Arguments]    ${mail_number}

    sleep   2s
    maximize browser window
    sleep  10s
    click element    (//td[contains(@onclick,'showTheMessage')][1])[${mail_number}]
    sleep  10s
    select frame    ${Select_irame}
    log to console    changing frame
    sleep    5s


Open Document to Sign

    click element    ${Review_button}|${Access_Doc}|${Accept_invi}
    log to console    click on button which is having document need to sign
    sleep    5s
    unselect frame
    sleep    5s
    switch window    title:MyDocSafe
    log to console    Switching tab

Submit Document

    click element    ${Submit_Document}
    Log To Console    CLicked ON Submit Document

Sign And Send Document

    sleep    8s
    click element    ${Signee_Signature_Field}
    sleep    2s
    ${rand_string}   randomword
    input text    ${Signature_NameField}    ${rand_string}
    log to console    Adding signature
    sleep    2s
    click element    ${Save_Signature_Button}
    sleep    12s
    Submit Document

Sign mail    [Arguments]    ${random_mail1}    ${Browser}

    sleep  20s
    Change signee in the document
    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_05    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_05
    Open Mail    1
     Open Document to Sign
    ${count} =  Get Element Count    ${Sign_In_for_Signee}
    IF   ${count}==1
        Signin again with the signee mail to approve document    rahul.sharma_05@mailinator.com    RobotFramework2!
    ELSE
        Sign first document
        Submit Document
        Close Browser
    END

    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_06    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_06
    Open Mail    1
     Open Document to Sign
    ${count} =  Get Element Count    ${Sign_In_for_Signee}
    IF   ${count}==1
        Signin again with the signee mail to approve document    rahul.sharma_06@mailinator.com    RobotFramework2!
    ELSE
        Sign first document
        Submit Document
        Close Browser
    END