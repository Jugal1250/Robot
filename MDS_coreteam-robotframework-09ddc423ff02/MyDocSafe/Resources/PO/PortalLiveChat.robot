*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/Common.robot
Resource    ../../Resources/PO/LoginPage.robot
Resource    ../../Resources/PO/AddUsers.robot

*** Variables ***

${ChatButton}    (//span[text() = 'Chat']//parent::translate//parent::a)[1]
${ChatInputBox}    //input[@name = 'message']
${SentMessage}    //span[@class = 'mdsChatMessage ng-binding']
${LiveChatRecipientUserName}    nivi.mydocsafe@gmail.com
${LiveChatRecipientPassword}    Testing1!
${AcceptInviteButton}    //span[contains(text(), 'Accept invite')]//parent::button
${SelectContactTextField}    //input[@name = 'autocompleteField']
${AcceptInvitationButton}    //span[text() = 'Accept Invitation']//parent::translate//parent::button
${First_Name_1}    //md-input-container//input[@name="first_name"]
${Last_Name_1}    //input[@name="last_name"]
${Save_Button}    //button//span[contains(.,'Save')]

*** Keywords ***

Select Portal    [Arguments]    ${Portal_Name}

    wait until element is enabled    //button[contains(@aria-label, '${Portal_Name}')]
    click element    //button[contains(@aria-label, '${Portal_Name}')]

Select Portal User   [Arguments]    ${Portal_User}

    wait until element is enabled    //a[contains(@aria-label, '${Portal_User}')]
    click element    //a[contains(@aria-label, '${Portal_User}')]

Click Chat Button

    wait until element is enabled    (//span[text() = 'Chat']//parent::translate//parent::a)[2]    10s
    sleep    2s
    click element    (//span[text() = 'Chat']//parent::translate//parent::a)[2]

Click Start Chat button

    run keyword and ignore error    wait until element is enabled    //span[text() = 'Start chat']//parent::translate//parent::button
    sleep    2s
    run keyword and ignore error    click element    //span[text() = 'Start chat']//parent::translate//parent::button

Send Message

    Scroll Down
    wait until element is enabled    ${ChatInputBox}
    ${Message}    randomword
    input text    ${ChatInputBox}    ${Message}
    press keys    ${ChatInputBox}    ENTER
    wait until element is enabled    //span[@class = 'mdsChatMessage ng-binding'][contains(text(), '${Message}')]
    [Return]    ${Message}

Verify message    [Arguments]    ${Message}

    wait until element is enabled   //span[@class = 'mdsChatMessage ng-binding'][contains(text(), '${Message}')]
    capture page screenshot    MessageReceivedSuccessfully.png

Click Accept Invite button

    wait until element is enabled    ${AcceptInviteButton}    10s
    sleep    1s
    click element    ${AcceptInviteButton}


Select a contact    [Arguments]    ${Recipient}

    wait until element is enabled    ${SelectContactTextField}    10s
    input text    ${SelectContactTextField}    ${Recipient}
    sleep    2s
    press keys    ${SelectContactTextField}    ARROW_DOWN
    sleep    2s
    press keys     ${SelectContactTextField}    ENTER


Add Recipient    [Arguments]    ${Recipient}

    Add new
    Select a contact    ${Recipient}
    Click Create the client portal and invite client users button

Click Accept Invitation Button

    wait until element is enabled    ${AcceptInvitationButton}
    click element    ${AcceptInvitationButton}

Recipient Login

    Enter Email    ${LiveChatRecipientUserName}
    Enter Password    ${LiveChatRecipientPassword}
    sleep    1s
    Click Signin Button


Live Chat    [Arguments]    ${Portal}

    Select Portal    ${Portal}
    Select Portal User    Nivi Mydocsafe
    Click Chat Button
    Click Start Chat button
    ${Message}    Send Message
    Logout
    Recipient Login
    Click Accept Invite button
    Click Chat Button
    Verify message    ${Message}

Add Randaom Recipient details

    Sleep    5s
    Click Element    ${First_Name_1}
    Input Text    ${First_Name_1}    Rahul
    Log To Console    Adding First_Name
    Wait Until Element Is Enabled    ${Last_Name_1}
    Click Element    ${Last_Name_1}
    Input Text    ${Last_Name_1}    Sharma
    Log To Console    Adding Last_Name
    Click Element    ${Save_Button}
    Log To Console    Clicked On Save Button
    Sleep    2s

Add Random Recipient    [Arguments]    ${Recipient}

    Add new
    Select a contact    ${Recipient}
    Add Randaom Recipient details
    Click Create the client portal and invite client users button