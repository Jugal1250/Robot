*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py

*** Variables ***

${Firstnametextbox}    //input[@name = 'first_name']
${Lastnametextbox}    //input[@name = 'last_name']
${Savebutton}    //span[text() = 'Save']

*** Keywords ***

Enter firstname

    wait until element is enabled    ${Firstnametextbox}    #Wait for first name field
    ${Firstname}    randomword    #Generating random string
    input text    ${Firstnametextbox}    ${Firstname}    #Enter first name

Enter Lastname

    wait until element is enabled    ${Lastnametextbox}
    ${Lastname}    randomword    #Generate random string
    input text    ${Lastnametextbox}   ${Lastname}    #Enter last name

Click Save button

    wait until element is enabled    ${Savebutton}    #Wait for save button to enable
    click element    ${Savebutton}    #Click Save button

Create contact

    Enter firstname
    Enter Lastname
    Click Save button