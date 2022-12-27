*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource    ../../Resources/PO/CreateStaticTemplate.robot
Resource    ../../Resources/PO/AddNewContact.robot
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/LoginPage.robot


*** Variables ***

${ShareButton}    //span[text() = 'Share']//parent::span//parent::button
${AddNewMemberButton}    //span[text() = 'Add new member']//parent::translate//parent::span//parent::button
${SearchForaPersonTextField}    //input[@name = 'autocompleteField']
${LastNameInviteNewMember}    //input[@name = 'last_name']
${EmailInviteNewMember}    //input[@name = 'email']
${Savebutton}    //span[text() = 'Save']//parent::Translate//parent::button
${PermissionDropDown}    //mds-invite-options[@label = 'Permissions']
${InviteNewMemberButton}    //span[contains(text(), 'Invite new member')]//parent::button
${FolderInviteUserPassword}    Testing1!
${AcceptInvite01}    //span[contains(text(), 'Accept invite')]//parent::button
${PendingInvitationText}    //button[contains(@aria-label, 'Send reminder.')]


*** Keywords ***

Click Share button

    sleep    2s
    wait until element is enabled    ${ShareButton}
    click element    ${ShareButton}

Click Add New member Button

    sleep    5s
    wait until element is visible    //span[text() = 'Members']    60s
    wait until element is enabled    ${AddNewMemberButton}    10s
    sleep    2s
    click element    ${AddNewMemberButton}

Enter firstname in the Search for a person

    ${FirstName}    randomword
    wait until element is enabled    ${SearchForaPersonTextField}
    input text    ${SearchForaPersonTextField}    ${FirstName}
    sleep    1s
    press keys    ${SearchForaPersonTextField}    TAB

Click Save button (Invite New member)

    wait until element is enabled    ${Savebutton}    #Wait for save button to enable
    click element    ${Savebutton}    #Click Save button

Enter Last Name (Invite New Member)

    ${Lastname}    randomword
    wait until element is enabled    ${LastNameInviteNewMember}
    input text    ${LastNameInviteNewMember}    ${Lastname}

Enter Email (Invite New Member)

    ${Email}    Get Email
    wait until element is enabled    ${EmailInviteNewMember}
    input text    ${EmailInviteNewMember}    ${Email}

Choose Permission    [Arguments]    ${Access}    ${index}

    wait until element is enabled    ${PermissionDropDown}
    click element    ${PermissionDropDown}
    sleep    2s
    wait until element is enabled    (//div[contains(text(), '${Access}')]//parent::md-option)[${index}]    10s
    click element    (//div[contains(text(), '${Access}')]//parent::md-option)[${index}]

Click Invite new member button

    wait until element is enabled    ${InviteNewMemberButton}    20s
    click element    ${InviteNewMemberButton}


Invite New member    [Arguments]    ${NewMember}

    sleep    2s
    wait until element is enabled    ${SearchForaPersonTextField}    10s
    input text    ${SearchForaPersonTextField}    ${NewMember}
    sleep    2s
    wait until element is enabled    //span[text() = '${NewMember}']    20s
    click element    //span[text() = '${NewMember}']

Verify the folder is shared

    wait until element is enabled    ${PendingInvitationText}    15s
    sleep    2s
    capture page screenshot    Folder_shared.png

Open the folder    [Arguments]    ${FolderName}

    wait until element is enabled    //button[contains(@aria-label, '${FolderName}')]    30s
    click element    //button[contains(@aria-label, '${FolderName}')]

Login to 2nd account and accept invite    [Arguments]    ${FolderInviteUsername}

    Enter Email    ${FolderInviteUsername}
    Enter Password   ${FolderInviteUserPassword}
    sleep    1s
    Click Signin Button
    sleep    3s
    wait until element is enabled    ${AcceptInvite01}    25s
    sleep    1s
    click element    ${AcceptInvite01}

Share folder/File    [Arguments]    ${NewMember}    ${Access}    ${Index}

    sleep    2s
    Click Three Dot Button
    Click Share button
    Click Add New member Button
    Invite New member    ${NewMember}
    Choose Permission    ${Access}    ${Index}
    Click Invite new member button
#    Verify the folder is shared

Verify the options available    [Arguments]    ${Option}

    wait until element is enabled    //span[text() = '${Option}']//parent::span//parent::button
    sleep    2s
    capture page screenshot    Folder_options.png

Verify the options not available    [Arguments]    ${Option}

    element should not be visible    //span[text() = '${Option}']//parent::span//parent::button
    sleep    2s
    capture page screenshot    Folder_options.png

Verify the folder creation option not available

    wait until element is not visible    //h1/button/md-icon
    sleep    2s
    capture page screenshot    Folder_Option.png