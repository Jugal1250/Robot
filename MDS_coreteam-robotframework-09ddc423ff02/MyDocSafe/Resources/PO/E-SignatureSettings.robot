*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource   ../../Resources/Common.robot
Resource   ../../Resources/PO/SendForSigning.robot
Resource   ../../Resources/PO/Deletion.robot

*** Variables ***

${CheckBox1}    //div[@aria-label = 'E-mail me each time someone signs and when everyone signs the document.']/div[1]
${ExpirationPeriod}    //input[@aria-label = 'Expiration period*']
${UpdateEsignatureSettingsbutton}    //span[text() = 'Update E-Signature Settings']//parent::span//parent::button
${AddmeButton}    //span[text() = 'Add Me']//parent::translate//parent::button

*** Keywords ***

Check checkbox    [Arguments]    ${CheckboxName}

    wait until element is enabled    //div[@aria-label = '${CheckboxName}']/div[1]
    scroll element into view    //div[@aria-label = '${CheckboxName}']/div[1]
    sleep  3s
    ${Count}    get element count     //div[@aria-label = '${CheckboxName}'][@aria-checked = 'false']/div[1]
    scroll element into view    //div[@aria-label = '${CheckboxName}'][@aria-checked = 'false']/div[1]
    run keyword if    ${Count}==1    click element    //div[@aria-label = '${CheckboxName}']/div[1]    ELSE    fail    Checkbox is already checked
    sleep    3s

Uncheck Checkbox    [Arguments]    ${CheckboxName}

    wait until element is enabled    //md-checkbox[@aria-label = '${CheckboxName}']/div[1]
    scroll element into view    //md-checkbox[@aria-label = '${CheckboxName}']/div[1]
    sleep  1s
    ${Count}    get element count     //md-checkbox[@aria-label = '${CheckboxName}'][@aria-checked = 'true']/div[1]
    run keyword if    ${Count}==1    click element    //md-checkbox[@aria-label = '${CheckboxName}']/div[1]   ELSE    fail    Checkbox is already unchecked
    sleep    1s


Update Expiration Period    [Arguments]    ${Days}

    wait until element is enabled     ${ExpirationPeriod}
    clear element text    ${ExpirationPeriod}
    sleep    1s
#    input text    ${ExpirationPeriod}    ${Days}

Click Update Esignature button

    wait until element is enabled    ${UpdateEsignatureSettingsbutton}
    sleep  1s
    execute javascript    window.scrollBy(900, 900)
    scroll element into view    ${UpdateEsignatureSettingsbutton}
    click element    ${UpdateEsignatureSettingsbutton}
    sleep    2s

Checkbox is checked    [Arguments]    ${CheckBoxName}

    wait until element is enabled    //md-checkbox[@aria-label = '${CheckboxName}'][@aria-checked = 'true']

Checkbox is unchecked    [Arguments]    ${CheckBoxName}

    wait until element is enabled    //div[@aria-label = '${CheckboxName}'][@aria-checked = 'false']/div[1]

Select 'Save as defaulting options'

    wait until element is enabled    //md-checkbox[contains(@aria-label, 'Save as default signing options.')]
    click element    //md-checkbox[contains(@aria-label, 'Save as default signing options.')]

E Signature Settings - Check

    Check checkbox    E-mail me each time someone signs and when everyone signs the document.
    Check checkbox    Send automatic reminder
    Scroll Down
    Check checkbox    Delete the original document after everyone signs
    Check checkbox    Place signed document in each contacts folder rather than the same area as the document
    scroll down
    Check checkbox    Require user(s) to login before they can sign
    Check checkbox    Disable typed signatures
#    Update Expiration Period    22

Verify the checkbox is checked

    Checkbox is checked    E-mail me each time someone signs and when everyone signs the document.
    Checkbox is checked    Send a automatic reminder
    Checkbox is checked    Delete the original document after everyone signs
    checkbox is checked    Place signed document in each contacts folder rather than the same area as the document
    Checkbox is checked    Require user(s) to login before they can sign
    Checkbox is checked    Disable typed signatures

E Signature Settings - Uncheck

    Uncheck Checkbox    E-mail me each time someone signs and when everyone signs the document.
    Uncheck Checkbox   Send a automatic reminder
    Uncheck Checkbox    Delete the original document after everyone signs
    Uncheck Checkbox    Place signed document in each contacts folder rather than the same area as the document
    Scroll Down
    Uncheck Checkbox    Require user(s) to login before they can sign
    Uncheck Checkbox    Disable typed signatures
#    Update Expiration Period    22

E Signature Settings - Send for signing

    Uncheck Checkbox    E-mail me each time someone signs and when everyone signs the document.
    Uncheck Checkbox    Send a automatic reminder
    Uncheck Checkbox    Delete the original document after everyone signs
    Uncheck Checkbox    Place signed document in each contacts folder rather than the same area as the document
    Uncheck Checkbox    Require user(s) to login before they can sign
    Uncheck Checkbox    Disable typed signatures
    Update Expiration Period    22

Click Add me button

    wait until element is enabled    ${AddmeButton}
    click element    ${AddmeButton}

Verify the checkbox is unchecked

    Checkbox is unchecked    E-mail me each time someone signs and when everyone signs the document.
    Checkbox is unchecked    Delete the original document after everyone signs
    checkbox is unchecked    Place signed document in each contacts folder rather than the same area as the document
    Checkbox is unchecked    Require user(s) to login before they can sign
    Checkbox is unchecked    Disable typed signatures

Send For signing - Esignature Settings

     Click Send For Signing button
     Add Signee by email or group name    Test01_mydocsafe@mailinator.com
     Click Add me button
     Click Next Button
     Verify the checkbox is checked
     E Signature Settings - Uncheck
     Select 'Save as defaulting options'
     Click Next Button
     wait for document to load
     sleep    5s
     Drag the Signature to the document
     Click Send document button
     Verify document is sent