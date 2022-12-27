*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../library/CustomKeywords.py
Library    String

*** Variables ***

${ProposalsPlusButton}    //span[contains(text(), '+')]//parent::a//parent::a
${ProposalNameTextBox}    //input[@ng-model = 'vm.name']
${ProposalEmailTextBox}    //input[@name = 'autocompleteField']
${ClientFirstNameTextField}    //input[@ng-model = 'vm.contacts[0].first_name']
${ClientLastNameTextField}    //input[@ng-model = 'vm.contacts[0].last_name']
${NextButtonClient}    (//md-content[@class = '_md md-default-theme'])[2]/button/span[text() = 'NEXT']
${NextButtonServices}    (//md-content[@class = '_md md-default-theme'])[4]/button//span[text() = 'NEXT']
${AddServicesTextBox}    //label[text() = 'Add services']//parent::md-input-container/input
${RadioButton}    (//md-radio-button[@aria-label = 'New Client Information Form - Personal']/div/div)[1]
${NextButtonForms}    (//span[text() = 'NEXT']//parent::button)[3]
${SkipVerification}    //span[text() = 'Skip Verification']//parent::button
${TermsOfBusinessCheckBox}    //span[text() = 'TERMS OF BUSINESS']//parent::div//parent::md-checkbox/div[@class = 'md-container md-ink-ripple']
${NextButtonDocs}    (//span[text() = 'NEXT']//parent::button)[5]
${SkipPaymentButton}    //span[text() = 'Skip Payment']//parent::button
${SkipFactForm}    //span[text() = 'Skip Fact Form']//parent::button
${CreateProposalButton}    //span[text() = 'Create proposal']//parent::translate//parent::button
${SentStatus}    //p[contains(text(), 'sent')]
${DownArrowIcon}    //p[contains(text(), 'testbiycjq@mailinator.com')]//parent::div//parent::md-list-item/div[5]
${YesDeleteTheFolderPopup}  //span[text() = 'Yes, delete the folder']//parent::translate//parent::div
${DeleteProposalButton}    //span[text() = 'Delete']//parent::translate//parent::button

*** Keywords ***

Click Proposals plus button

    wait until element is enabled    ${ProposalsPlusButton}
    click element    ${ProposalsPlusButton}

Enter Proposal Name

    ${Name}    randomword
    wait until element is enabled    ${ProposalNameTextBox}
    input text    ${ProposalNameTextBox}    ${Name}

Enter Client Email

    wait until element is enabled    ${ProposalEmailTextBox}
    ${domain}    set variable    @mailinator.com
    ${EmailValue}    randomword
    ${EmailValue}    set variable    ${EmailValue}${domain}
    input text    ${ProposalEmailTextBox}    ${EmailValue}
    sleep    2s
    Press Keys    ${ProposalEmailTextBox}    TAB
    sleep    2s
    [Return]    ${EmailValue}

Enter Client First Name

    ${Name}    randomword
    wait until element is enabled    ${ClientFirstNameTextField}
    set focus to element   ${ClientFirstNameTextField}
    input text    ${ClientFirstNameTextField}    ${Name}

Enter Client Last Name

    ${Name}    randomword
    wait until element is enabled    ${ClientLastNameTextField}
    set focus to element    ${ClientLastNameTextField}
    input text    ${ClientLastNameTextField}    ${Name}

Click Next Button From Client

    wait until element is enabled   ${NextButtonClient}
    click element    ${NextButtonClient}

Select Service    [Arguments]    ${ServiceName}

    wait until element is enabled    ${AddServicesTextBox}
    sleep    1s
    scroll element into view    ${AddServicesTextBox}
    sleep    1s
    double click element    ${AddServicesTextBox}
    sleep    1s
    wait until element is enabled    //span[text() = '${ServiceName} ']//parent::div
    click element    //span[text() = '${ServiceName} ']//parent::div

Click Next Button from Services

    wait until element is enabled   ${NextButtonServices}
    click element    ${NextButtonServices}

Select "New Client Information Form - Corporate" from Forms

    wait until element is enabled    ${RadioButton}    10s
    sleep    1s
    click element    ${RadioButton}

Click Next Button from Forms

    wait until element is enabled    ${NextButtonForms}
    click element    ${NextButtonForms}

Click Skip Verification button

    wait until element is enabled    ${SkipVerification}
    sleep    1s
    Click element    ${SkipVerification}

Enter Client Information

    Click Proposals plus button
    Enter Proposal Name
    ${Email}    Enter Client Email
    Enter Client First Name
    Enter Client Last Name
    Click Next Button From Client
    [Return]    ${Email}

Select a Service    [Arguments]    ${ServiceName}

    Select Service    Payroll
    Click Next Button from Services

Select a Form

    Select "New Client Information Form - Corporate" from Forms
    Click Next Button from Forms

Click Next Button from Docs

    wait until element is enabled    ${NextButtonDocs}
    sleep    1s
    click element    ${NextButtonDocs}

Choose Documents to Sign

    wait until element is enabled    ${TermsOfBusinessCheckBox}    15s
    sleep    1s
    click element    ${TermsOfBusinessCheckBox}

Select Documents

    Choose Documents to Sign
    Click Next Button from Docs

Click Skip Payment button

    wait until element is enabled    ${SkipPaymentButton}
    sleep    1s
    click element    ${SkipPaymentButton}

Click Skip Fact form button

    wait until element is enabled    ${SkipFactForm}
    sleep    1s
    click element    ${SkipFactForm}

Verify Proposal is created

    wait until element is enabled    {SentStatus}    15s
    capture page screenshot    Proposal_Created.png

Click Create Proposal Button

    wait until element is enabled    ${CreateProposalButton}
    sleep    1s
    click element    ${CreateProposalButton}
    sleep    2s

Delete Proposal    [Arguments]    ${Email}

    ${Email}    convert to lower case    ${Email}
    wait until element is enabled    //p[contains(text(), '${Email}')]//parent::div//parent::md-list-item/div[5]
    sleep    1s
    click element    //p[contains(text(), '${Email}')]//parent::div//parent::md-list-item/div[5]
    wait until element is enabled    ${DeleteProposalButton}
    sleep    1s
    click element    ${DeleteProposalButton}
    sleep  1s
    wait until element is enabled    ${YesDeleteTheFolderPopup}
    click element    ${YesDeleteTheFolderPopup}