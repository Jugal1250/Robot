*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource   SendDocForQuickApproval.robot
Resource   ../Common.robot
Resource    SendForSigning.robot
Resource   ../../Resources/PO/ChangeSigneeMail.robot

*** Variables ***

${DocListCheckBox1}    //div[3]/md-list-item[1]/div[1]/div[2]/md-checkbox[1]/div[1]
${PenIcon}    //div[@class="hide-xs"]//button//md-icon[@md-font-icon="icon-moon-pen"]
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
${DocumentSent}    //span[text()="Document has been sent."]
${Verify_mail}    //td[contains(@onclick,'showTheMessage')][1]
${Submit_Document}    //button[@ng-click="sendSignedDocument()"]
${Signee_Signature_Field}    //div[@class="page__field"]
${Signature_NameField}    //input[@name='name']
${Save_Signature_Button}    //button[@ng-click="vm.saveSignature()"]
${Doc1CheckBox}    //md-list[1]/div[3]/md-list-item[1]/div[1]/div[2]/md-checkbox[1]/div[1]
${Doc2Checkbox}    //md-list[1]/div[4]/md-list-item[1]/div[1]/div[2]/md-checkbox[1]/div[1]
${ContactGroupListItem}    //li[@id="md-option-11-0"]//md-autocomplete-parent-scope
${ContactGroupListItem_Staging}    //li[@id="md-option-47-0"]//md-autocomplete-parent-scope
${ContactMail1}    //md-list//md-list-item[1]//div[1]
${ContactMail2}    //md-list//md-list-item[2]//div[1]
${SignatureTab}    //md-menu-bar//a[@ng-click="vm.openSignatures()"]
${SignedByYouTab}    //div[@ng-include="vm.menuPartial"]//md-list-item[@href="/signatures/mine"]
${LatestSignedDocument}    //md-list//div[1]//md-list-item//div//div//mds-show-item//a[@ng-click="vm.openFile()"]
${SignatureTechnicalDetailPage}    //span[contains(text(),"Signatures' technical details")]
${PasswordFirstNameField}    //input[@placeholder="First name"]
${PasswordLastNameField}    //input[@placeholder="Last name"]
${PasswordEnterPasswordField}    //input[@placeholder="Enter password"]
${PasswordRepeatPasswordField}    //input[@placeholder="Repeat password"]
${PasswordNextButton}    //input[@value="NEXT"]
${Terms&Condition_Checkbox}    //div[@class="md-container md-ink-ripple"]
${Next_Button_01}    //button[@ng-click="$ctrl.save()"]
${Enter_Pass}    //input[@placeholder="Enter password"]
${Repeate_pass}    //input[@placeholder='Repeat password']
${Next_Button_02}    //input[@value="NEXT"]


*** Keywords ***

Select Uploaded Document

    Click Element    ${DocListCheckBox1}
    Log To Console    Click On Checkbox

Click On Pen Icon

    click element    ${PenIcon}
    Log To Console    Click on Pen Icon

Adding 1st Signe email

    sleep    3s
    Input Text    ${Email_Field}    rahul.sharma_05@mailinator.com
    sleep    2s
    Press Keys    ${Email_Field}    TAB
    log to console    1st signee added
    click element    ${Next1}
    log to console    Next Button clicked
    Sleep    5s

Adding 2nd Signe email

    click element    ${AddAnotherSignee}
    Input Text    ${Email_Field}    rahul.sharma_06@mailinator.com
    log to console    2nd signee added
    sleep    2s
    Press Keys    ${Email_Field}    TAB
    click element    ${Next1}
    click element    ${SigneePageNextbutton}
    Log To Console    Signee Page Next Button clicked
    click element    ${NextButton}
    sleep    4s

Add Signature on doc

    SeleniumLibrary.drag and drop    ${FirstSigneeSignatureButton}    ${Document}
    Click Element    ${SecondSigneeTabButton}
    sleep    4s
    SeleniumLibrary.drag and drop    ${SecondSigneeSignatureButton}    ${Document}
    Click Element    ${SendDocumentButton}
    sleep    2s
    Element Should Be Visible    ${DocumentSent}
    Click Return to your documents button

Add Multiple Signee Send And Sign Document    [Arguments]    ${Browser}

    Adding 1st Signe email
    Adding 2nd Signe email
    Add Signature on doc
    Delete the File
    Close Browser


    sleep    5s
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


    # Add Signature for Second Signee
    sleep    5s
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

Go Back to Account    [Arguments]    ${Environment}    ${Browser}    ${Email_address}    ${Password}
    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
    Login with valid credentials    ${Email_address}    ${Password}


Select Both Documents
    Click Element    ${Doc1CheckBox}
    Click Element    ${Doc2CheckBox}
    Log To Console    Click On both CheckBox

Adding Sign to multiple Doc

    SeleniumLibrary.drag and drop    ${FirstSigneeSignatureButton}    ${Document}
    Click Element    ${SendDocumentButton}
    sleep    2s
    Wait Until Element Is Visible    ${FirstSigneeSignatureButton}
    SeleniumLibrary.drag and drop    ${FirstSigneeSignatureButton}    ${Document}
    Click Element    ${SendDocumentButton}
    sleep    2s
    Element Should Be Visible    ${DocumentSent}

Sign document condition

    Open Document to Sign
    ${count} =  Get Element Count    ${Sign_In_for_Signee}
    IF   ${count}==1
        Signin again with the signee mail to approve document    rahul.sharma_06@mailinator.com    RobotFramework2!
    ELSE
        Sign first document
        Submit Document
        Close Browser
    END

Send Multiple Documents to Single Signee    [Arguments]    ${RandomMail}    ${Browser}

    sleep    3s
    Input Text    ${Email_Field}    rahul.sharma_06@mailinator.com
    sleep    2s
    Press Keys    ${Email_Field}    TAB
    log to console    1st signee added
    click element    ${Next1}
    log to console    Next Button clicked
    click element    ${SigneePageNextbutton}
    Log To Console    Signee Page Next Button clicked
    click element    ${NextButton}
    sleep    4s
    Adding Sign to multiple Doc
    Click Return to your documents button
    Delete Multiple Doc
    Close Browser

    sleep    5s
    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_06    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_06
    Open Mail    1
    Sign document condition

    # Verify Mail for 2nd Document and Sign
    sleep    5s
    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_06    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_06
    Open Mail    2
    Sign document condition

Add Contact Group As Signee
    Wait Until Element Is Visible    ${Email_Field}
    Input Text    ${Email_Field}    TestBlaContactGroup
    sleep    5s
    press keys    none    TAB
    sleep    2s
    click element    ${Next1}
    ${ContactGroupMail1}=    Get Text    ${ContactMail1}
    ${ContactGroupMail2}=    Get Text    ${ContactMail2}
    click element    ${SigneePageNextbutton}
    click element    ${NextButton}
    [Return]    ${ContactGroupMail1}    ${ContactGroupMail2}

Add Signature Filed In Contacts Signee

    sleep    4s
    Add Signature on doc

Sign The Document with Both Contacts    [Arguments]    ${Browser}    ${ContactGroupMail1}    ${ContactGroupMail2}
    # Add Signature for First Contact
    sleep    5s
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


    # Add Signature for Second Signee
    sleep    5s
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
#    Sign And Send Document
#    ${CPassword}    =    Rahul.Sharma@1818
    [Return]    Rahul.Sharma@1818

Go To Signature Technical Details Page
    Sleep    5s
    click element    ${SignatureTab}
    sleep    5s
    click element    ${SignedByYouTab}
    sleep    4s
    click element    ${LatestSignedDocument}
    sleep    4s
    FOR    ${i}    IN RANGE    30
        sleep    2s
        press keys    None    TAB
    END

Set Up Password for 2nd signee mail

    Sleep    5s
    Input Text    ${PasswordFirstNameField}    TestFirst
    Log    Entered First Name
    Input Text    ${PasswordLastNameField}    TestLast
    Log    Entered Last Name
    Input Text    ${PasswordEnterPasswordField}    Testing2!
    Log    Entered Password
    Input Text    ${PasswordRepeatPasswordField}    Testing2!
    Log    Entered Repeat Name
    Click Element    ${PasswordNextButton}
    Log    Clicked on Next Button

Agree Terms and Condition

    sleep    5s
    Click Element    ${Terms&Condition_Checkbox}
    Log To Console    Clicked on Checkbox Of T&C
    Click Element    ${Next_Button_01}
    Log To Console    Click On Next Button
    Sleep    5s

Upgrade Password of new Recipient    [Arguments]    ${random_mail}

    Click Element    ${Enter_Pass}
    Log To Console    pass:${random_mail}
    Input Text    ${Enter_Pass}    A1@#${random_mail}
    Click Element    ${Repeate_pass}
    Input Text    ${Repeate_pass}    A1@#${random_mail}
    Click Element    ${Next_Button_02}
    Log To Console    Clicked On Next Button


Accept portal request    [Arguments]    ${random_mail}

    sleep    30s
    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=${random_mail}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=${RandomMail}
    Open Mail    1
    Open Document to Sign
    Agree Terms and Condition
    Upgrade Password of new Recipient    ${random_mail}