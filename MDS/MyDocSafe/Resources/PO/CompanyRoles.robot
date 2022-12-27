*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/CreateForm.robot


*** Variables ***

${PlusButtonCompanyRoles}    //i[text() = 'add']//parent::span
${RolenameTextBox}    //input[@aria-label = 'Role name*']
${DuplicateRoleError}    //p[contains(text(), 'This role already exists')]
${DeleteRole}    //div[text() = 'Delete']//parent::div
${YesDeleteRole}    //span[text() = 'Delete']//parent::span//parent::button
${CloseRoleDialog}    //i[text() = 'close']//parent::span
${NoRecord}    //p[text() = 'No records']
${Permissionsbutton}    (//div[text() = 'Permission']//parent::a)
${PermissionsDropdown}    //md-select-value[@class = 'md-select-value']/span/div[contains(text(),'Full Access')]
${SaveRoleButton}    //span[text() = 'Save']//parent::translate//parent::button
${SubmitRoleButton}    //span[text() = 'Submit']//parent::span//parent::button


*** Keywords ***

Click Plus button from company roles

    wait until element is enabled    ${PlusButtonCompanyRoles}
    sleep    2s
    click element    ${PlusButtonCompanyRoles}

Enter Role Name    [Arguments]    ${Rolename}
    
    Sleep    3s
    wait until element is enabled    ${rolenametextbox}
    input text    ${rolenametextbox}    ${Rolename}
    [Return]    ${Rolename}

Validate the Duplicate Role error message

    wait until element is enabled    ${DuplicateRoleError}
    capture page screenshot    Duplicate_role.png

Click Submit Role

    wait until element is enabled    ${SubmitRoleButton}
    click element    ${SubmitRoleButton}

Create Role    [Arguments]    ${RoleName}

    Click plus button from company roles
    Enter Role Name    ${RoleName}
    Click Submit Role
    sleep    5s

Close Dialog

    wait until element is enabled    ${CloseRoleDialog}
    click element    ${CloseRoleDialog}

Delete Role    [Arguments]    ${RoleName}

     sleep    5s
     wait until element is enabled    //td[text() = '${RoleName}']//parent::tr/td[3]/div/button    10s
     click element    //td[text() = '${RoleName}']//parent::tr/td[3]/div/button
     wait until element is enabled    ${DeleteRole}
     sleep    2s
     ${Count}    get element count    ${DeleteRole}
     click element    (//div[text() = 'Delete']//parent::div)[${Count}]
     wait until element is enabled    ${YesDeleteRole}
     sleep    2s
     click element    ${YesDeleteRole}
     sleep    3s

Verify the role is deleted    [Arguments]    ${RoleName}

    sleep    3s
    element should not be visible    //td[text() = '${RoleName}']//parent::tr/td[3]/div/button
    capture page screenshot    Role_Deletion.png

Click Permission button

     wait until element is enabled    ${Permissionsbutton}
     sleep    2s
     ${Count}    get element count    ${Permissionsbutton}
     click element    (//div[text() = 'Permission']//parent::a)[${Count}]

Click Role options    [Arguments]    ${RoleName}

     wait until element is enabled    //td[contains(text(), '${RoleName}')]//parent::tr/td[3]/div/button    10s
     click element    //td[contains(text(), '${RoleName}')]//parent::tr/td[3]/div/button

Click Permission dropdown

     wait until element is enabled    ${PermissionsDropdown}
     sleep  1s
     click element    ${PermissionsDropdown}

Select permissions    [Arguments]    ${Permission}    ${Index}

    wait until element is enabled    (//md-option/div[contains(text(), '${Permission}')])[${Index}]
    sleep    1s
    click element    (//md-option/div[contains(text(), '${Permission}')])[${Index}]

Verify the permission is selected    [Arguments]    ${Permission}

     wait until element is enabled    //md-select-value[@class = 'md-select-value']/span/div[contains(text(),'${Permission}')]
     sleep    1s
     capture page screenshot    Permissions.png

Click Save to Save the permission

    wait until element is enabled    ${SaveRoleButton}
    click element    ${SaveRoleButton}

Select permissions for role    [Arguments]    ${RoleName}    ${Permission}    ${Index}

     Click Role options    ${RoleName}
     Click Permission button
     Click Permission dropdown
     Select permissions    ${Permission}    ${Index}
     Click Save to Save the permission
     Verify the permission is selected    ${Permission}