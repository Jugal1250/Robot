*** Settings ***

Documentation  Switching between Browser Windows in Robot Framework
Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource   ../../Resources/PO/SendForSigning.robot
Resource   SendDocForQuickApproval.robot
Resource   ../Common.robot


*** Variables ***

${Template_Button}     //span[@class='mds--sidebar__itemName']//span[text()='Templates']
${New_dynamic_tamplate}    //span[@class='mds__document__itemName']//span[text()='New dynamic template']
${Add_NewTemplate_Name}    //input[@placeholder="Template name"]
${Click_On_Savetemplate}    //span[contains(text(),'Save template')]
${Searchtexbox}    //md-autocomplete[@placeholder = 'Search for']
${Sendeforsigningbymailmerge}    //md-icon[@aria-label="fas fa-mail-bulk"]//parent::button
${Browse_csvfile}    //input[@type="file"]
${Send_forsigningby_mailmerge}    //button[@ng-click="vm.sendCSVForSigning()"]
${merge_template_sign}     //button[@class="md-icon-button mds__document--darker-gray md-button md-default-theme md-ink-ripple hide-xs"]
${Verified_mail}    //td[contains(@onclick,'showTheMessage')][1]
${Review_button}    //td//a[starts-with(text(),'Proceed to review')]
${Select_irame}    //iframe[@id='html_msg_body']
${Approve_Doc}    //button[@ng-click="sendSignedDocument()"]

*** Keywords ***


Add New template    [Arguments]    ${randomstring}

    sleep    5s
    click element    //md-menu[@class="md-menu _md"]//button[@ng-click="$mdMenu.open()"]
    Log To Console  Click on + Icon
    sleep    2s
    click element    ${New_dynamic_tamplate}
    Log To Console    Clicked on Add New Template
    wait until element is enabled    ${Add_NewTemplate_Name}
    Sleep    2s
    clear element text    ${Add_NewTemplate_Name}
    input text    ${Add_NewTemplate_Name}    ${randomstring}
    log to console    Adding the name of template
    sleep    5s

Save Template

    click element    ${Click_On_Savetemplate}
    log to console    Clicked On Save Template Button

Search Template    [Arguments]    ${randomstring}

    sleep    10s
    clear element text    ${Searchtexbox}
    wait until element is enabled  ${Searchtexbox}    #Wait for Search field
    input text    ${Searchtexbox}    ${randomstring}  #Enter Folder name to searcg
    log to console    entring text into search box ${randomstring}
    press keys    ${Searchtexbox}    ENTER    #Press Enter to search
    Log To Console    Pressing Enter on Search Box
    sleep    5s
    press keys    ${Searchtexbox}    ESC
    Log To Console    Escaping Search Box
    sleep    2s

SendForSigningBy MailMerge

    click element    ${Sendeforsigningbymailmerge}
    Log To Console    Click on SendForSigningBy MailMerge Button
    sleep    5s

Upload Rahul Csv file

    choose file    ${Browse_csvfile}    ${CURDIR}/2_contacts_R.csv
    log to console    uploding csv file
    sleep    5s
    click element    ${Send_forsigningby_mailmerge}
    log to console    click on send
    sleep    5s

Approve Document on Mailinator

    wait until element is visible    ${Approve_Doc}
    Click Element    ${Approve_Doc}
    Log To Console    Approving Doc

Creating dynamic template and Send By Mail Merge    [Arguments]    ${randomstring}

    log to console    ${randomstring}
    Navigate to Side Pane    Templates
    Add New template    ${randomstring}
    Save Template
    Search Template    ${randomstring}
    SendForSigningBy MailMerge
    Upload Rahul Csv file
    Search Template    ${randomstring}
    Delete the folder
    Delete Multiple Doc
    Close Browser
    run keyword if    ${Browser=='chrome'}    Launch browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_05    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    https://www.mailinator.com/v4/public/inboxes.jsp?to=rahul.sharma_05
    Open Mail    1
    Open Document to Sign
    ${count} =  Get Element Count    ${Sign_In_for_Signee}
    IF   ${count}==1
        Signin again with the signee mail to approve document    rahul.sharma_05@mailinator.com    RobotFramework2!
    ELSE
        Sign first document
        Close Browser
    END

