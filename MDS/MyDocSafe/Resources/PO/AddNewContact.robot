*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/TabsPage.robot
Library    String

*** Variables ***

${AllContactsPlusButton}    //button[@aria-label = 'New Proposal']
${AddNewContactButton}    //span[text() = 'Add new contact']//parent::translate
${ContactTypeButton}    //md-select[@aria-label = 'Contact Type']
${Contact_firstnameTextField}    //input[@name = 'first_name']
${Contact_LastnameTextField}  //input[@name = 'last_name']
${Contact_EmailTextField}    //input[@name = 'email']
${SaveContact}    //span[text() = 'Save']//parent::translate//parent::button
${Contact_SearchTextField}    //input[@ng-model = '$ctrl.searchTerm']
${ContactEmailAddress}
${EditDetailsButton}    //span[text() = 'Edit details']//parent::translate//parent::button
${CompanyNameTextField}    //input[@name = 'company_name']
${idTextField}    //input[@name = 'external_id']
${StatusDropdown}    //md-select[@name = 'status']
${EmailValue}
${DuplicateEmailErrorMessage}    //md-content[contains(text(), 'Contact with this email already exists')]
${ContactsButton}    //div[@class = 'md-button md-no-style']/a[@aria-label = 'Contacts']
${Loading}    //span[contains(text(), 'Processing')]//parent::translate//parent::div
${DeleteContactButton}    //span[text() = 'Delete']//parent::translate//parent::button
${YesDeleteButton}    //span[text() = 'Yes, delete']//parent::button
${NoResultsText}    //span[text() = 'No results']//parent::translate//parent::div

*** Keywords ***

Get Email

     ${domain}    set variable    @mailinator.com
     ${Email}    randomword
     ${Value}    set variable    ${Email}${domain}
     ${Value}    convert to lower case    ${Value}
     [Return]    ${Value}

Navigate to Contacts

    wait until element is visible    ${ContactsButton}
    sleep    5s
    wait until page does not contain element    ${Loading}
    sleep    1s
    click element    ${ContactsButton}

Click Plus button from contacts

    wait until element is enabled    ${AllContactsPlusButton}    10s
    sleep    3s
    click element    ${AllContactsPlusButton}

Click Add New Contact Button

    wait until element is enabled  ${AddNewContactButton}    10s
    sleep    3s
    double click element    ${AddNewContactButton}

Select Contact Type    [Arguments]    ${ContactTypeValue}

    wait until element is enabled    ${ContactTypeButton}
    click element    ${ContactTypeButton}
    sleep    1s
    click element    //md-option[@value = '${ContactTypeValue}']

Enter FirstName(Contacts)

    ${FirstNameValue}    randomword
    wait until element is enabled    ${Contact_firstnameTextField}
    input text    ${Contact_firstnameTextField}    ${FirstNameValue}
    [Return]    ${FirstNameValue}

Enter LastName(Contacts)

    ${LastnameValue}    randomword
    wait until element is enabled    ${Contact_LastnameTextField}
    input text    ${Contact_LastnameTextField}    ${LastnameValue}
    [Return]    ${LastnameValue}

Enter Email(Contacts)    [Arguments]    ${Email}

    wait until element is enabled    ${Contact_EmailTextField}
    input text    ${Contact_EmailTextField}    ${Email}
    [Return]    ${Email}

Enter the company name(Contacts)

    ${CompanyName}    randomword
    wait until element is enabled    ${CompanyNameTextField}
    input text    ${CompanyNameTextField}    ${CompanyName}
    [Return]    ${CompanyName}

Enter the id

    ${IdName}    randomword
    wait until element is enabled    ${idtextfield}
    input text    ${idtextfield}    ${IdName}
    [Return]    ${IdName}

Click Save to Save Contact

    wait until element is enabled    ${SaveContact}
    click element    ${SaveContact}

Search Contact    [Arguments]    ${Contact_Email}

    wait until element is enabled    ${Contact_SearchTextField}    15s
    sleep    1s
    input text    ${Contact_SearchTextField}    ${Contact_Email}

Contact should be displayed    [Arguments]    ${Email}    ${FirstName}    ${LastName}

    element should be visible    //a[contains(@aria-label, '${FirstName} ${LastName}')]
    ${Email}    convert to lower case    ${Email}
    element should be visible    //a[contains(@aria-label, '${Email}')]

Select Contact    [Arguments]    ${Email}

    wait until element is visible    //a[contains(@aria-label, '${Email}')]
    click element    //a[contains(@aria-label, '${Email}')]

Click Edit Details Button

    wait until element is visible    ${EditDetailsButton}    10s
    click element  ${EditDetailsButton}

Rename Fields    [Arguments]    ${FieldLocator}    ${Value}

    wait until element is visible    ${FieldLocator}
    clear element text    ${FieldLocator}
    input text    ${FieldLocator}     ${Value}

Change status    [Arguments]    ${Value}

    wait until element is enabled    ${StatusDropdown}
    click element    ${StatusDropdown}
    sleep    1s
    click element    //md-option[@value = '${Value}']

Verify the Duplicate Email Message

    wait until element is enabled    ${DuplicateEmailErrorMessage}    10s
    element should be visible    ${DuplicateEmailErrorMessage}
    capture page screenshot    Duplicate_Email.png

Click Delete Button to delete contact

    wait until element is enabled    ${DeleteContactButton}
    click element  ${DeleteContactButton}

Click Yes,Delete button to confirm

    wait until element is enabled    ${YesDeleteButton}
    click element  ${YesDeleteButton}

Verify contact is not available    [Arguments]    ${Email}

    Search Contact    ${Email}
    sleep    2s
    ${Email}    convert to lower case    ${Email}
    wait until element is visible    ${NoResultsText}    5s    Contact is present already
    element should not be visible    //a[contains(@aria-label, '${Email}')]