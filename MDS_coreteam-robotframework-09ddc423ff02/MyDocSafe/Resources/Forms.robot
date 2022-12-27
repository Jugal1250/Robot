*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource   ../Resources/PO/CreateForm.robot
Resource   ../Resources/Common.robot
Resource   ../Resources/PO/DocumentsPage.robot

*** Variables ***

${ShortTextAnswer}    Short Text Answer
${EmailAnswer}    abc@gmail.com
${NumberAnswer}    123
${DateAnswer}    01/01/2022
${LongTextAnswer}    Long Text Long Text
${Yes/NoAnswer}    //md-dialog-content/div/mds-form-result/div/div/div/div[2]/div/translate/span[text() = 'Yes']
${MultipleChoiceAnswer}    Another answer
${CheckBoxOption1Answer}    //md-dialog-content/div/mds-form-result/div/div/div/md-input-container/div/md-checkbox/div[2]/span[contains(text(), 'Checkbox option 1')]
${CheckBoxOption3Answer}    //md-dialog-content/div/mds-form-result/div/div/div/md-input-container/div/md-checkbox/div[2]/span[contains(text(), 'Checkbox option 3')]
${AddressAnswer}    10 Downing St, London, SW1A 2AB, United Kingdom
${CountryAnswer}    United Kingdom
${AddFileAnswer}    //md-dialog-content/div/mds-form-result/div/div/div/div[2]/mds-show-item/a/span[text() = '01_DOC.doc']


*** Keywords ***

Add Forms to Portal    [Arguments]    ${Portal}

    Navigate to Form Templates
    Click Add Form Button
    ${FormName}    Enter Form Name
    Enable Ask for Signature
    Enable Notification
    Click Form Attributes    Short text
    Add text to Short text    Short Text?
    Click Create Form Button
    Click Back To Documents Button
    [Return]    ${FormName}
    sleep    5s

Validate Form    [Arguments]    ${AttributeAnswer}

  sleep  2s
  wait until element is visible    //md-dialog-content/div/mds-form-result/div/div/div/div[2][contains(text(), '${AttributeAnswer}')]
  element should be visible    //md-dialog-content/div/mds-form-result/div/div/div/div[2][contains(text(), '${AttributeAnswer}')]

Create Form(6 Elements)

    Click plus button from documents window
    Click Form button
    Enter Form Name
    Click Form Attributes    Static text
    Add text to Static text    Static text
    Click Ok Button
    Click Form Attributes    Short text
    Add text to Short text    Short text?
    Click Ok Button
    Click Form Attributes    Email
    Email Question
    Click Ok Button
    Click Form Attributes    Number
    Add text to Number    Number?
    Click Ok Button
    Click Form Attributes    Date
    Add text to Date    Date?
    Click Ok Button
    Click Form Attributes    Long text
    Add text to Long text    Long Text?
    Click Ok Button
    Click Create Form Button

Enter Answers(6 Elements)

    Enter Answer   ${shorttextanswerTextBox}    ${ShortTextAnswer}    #Shorttext
    Enter Answer   ${EmailAnswerTextBox}    ${EmailAnswer}    #Email
    Enter Answer   ${NumberAnswerTextBox}    ${NumberAnswer}    #Number
    Enter Answer   ${DateAnswerTextBox}    ${DateAnswer}    #Date
    Enter Answer   ${LongTextAnswerTextbox}    ${LongTextAnswer}   #LongText
    Click Submit
    Verify submission message

Enter Answers(elements: 'Checkboxes', 'Multiple choice' and 'Yes/No')

    Choose CheckBox    Checkbox option 1
    Choose CheckBox    Checkbox option 3
    Enter Answer in Other    Another answer
    Choose Yes/No    Yes
    Click Submit
    Verify submission message

Enter Answer(Next 5 Elements)

    Add File to Please add file    01_DOC.doc
    Enter Address in the form
    Click Submit
    Verify submission message

View and Validate Form(6 Elements)

    Switch to Main Window
    Navigate to Records Tab
    View form
    Validate Form    ${ShortTextAnswer}
    Validate Form    ${EmailAnswer}
    Validate Form    ${NumberAnswer}
    Validate Form    ${DateAnswer}
    Validate Form    ${LongTextAnswer}
    capture page screenshot    Validation_successfull_Comb01.png
    press keys    None    ESC

View and Validate Form(elements: 'Checkboxes', 'Multiple choice' and 'Yes/No')

    Switch to Main Window
    Navigate to Records Tab
    View form
    Validate Form    ${MultipleChoiceAnswer}
    element should be visible    ${Yes/NoAnswer}
    element should be visible    ${CheckBoxOption1Answer}
    element should be visible    ${CheckBoxOption3Answer}
    capture page screenshot    Validation_successfull_Comb02.png
    press keys    None    ESC

Create Form(elements: 'Checkboxes', 'Multiple choice' and 'Yes/No')

    Click plus button from documents window
    Click Form button
    Enter Form Name
    Click Form Attributes    Checkboxes
    Add text to Check Box    checkboxes?
    Add Options to TextBox    1    Checkbox option 1
    Click Add Option Button
    Add Options to TextBox    2    Checkbox option 2
    Click Add Option Button
    Add Options to TextBox    3    Checkbox option 3
    Click Ok button
    Click Form Attributes    Multiple choice
    Add text to Multiple Choice    Multiple choice?
    Add Options to Multiplechoices    1    Multiple choice option 1
    Click Add Option Button
    Add Options to Multiplechoices    2    Multiple choice option 2
    Click Add Other option
    Click Ok Button
    Click Form Attributes    Yes/No
    Add text to Yes/No    Yes/No?
    Click Ok Button
    Click Create Form Button

Create Form(Next 5 Elements)

    Click plus button from documents window
    Click Form button
    Enter Form Name
    Click Form Attributes    File upload
    Click Ok Button
    Click Form Attributes    Video
    Add text to Video    Video question?
    Add Value to Video
    Click Ok Button
    Click Form Attributes    Address
    Click Ok Button
    Click Form Attributes    Phone
    Click Ok Button
    Click Form Attributes    Country
    Click Ok Button
    Click Create Form Button

Enter Address in the form

    Choose Country_address    United Kingdom
    Enter Building Number    10
    Enter Street    Downing St
    Enter City    London
    Enter Postalcode    SW1A 2AB
    Enter Phone    +44-20-7925-0918
    Choose Country_Form    United Kingdom

View and Validate Form(Next 5 Elements)

    Switch to Main Window
    Navigate to Records Tab
    View form
    Validate Form    ${AddressAnswer}
    Validate Form    ${CountryAnswer}
    element should be visible    ${AddFileAnswer}
    capture page screenshot    Validation_successfull_Comb03.png
    press keys    None    ESC