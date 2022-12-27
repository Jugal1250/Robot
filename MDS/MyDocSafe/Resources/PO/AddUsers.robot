*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/CreateContactPage.robot

*** Variables ***

${Addnewbutton}    //span[text() = 'Add new']
${Contacttextbox}    //input[@name = 'autocompleteField']
${Createtheclientportalandinviteclientusersbutton}    //span//parent::button[@class = 'md-raised md-primary md-button md-default-theme md-ink-ripple']

*** Keywords ***

Add new

    wait until element is enabled    ${Addnewbutton}     10s    #Wait for add new button
    sleep    5s
    double click element    //span[text() = 'Add new']    #Double click Add new button

Input email

    wait until element is enabled    ${Contacttextbox}    #Wait for Email text field
    ${Emailaddress}    randomemail    #Generating random string
    input text    ${Contacttextbox}    ${Emailaddress}    #Enter Email
    sleep    2s
    Press Keys    ${Contacttextbox}    TAB    #Press tabl button
    sleep    2s

Click Create the client portal and invite client users button

    wait until element is enabled    ${Createtheclientportalandinviteclientusersbutton}    #Wait for create_client_portal_invite_client_users button
    click element    ${Createtheclientportalandinviteclientusersbutton}    #click create_client_portal_invite_client_users button
    wait until element is enabled    //span[text() = 'Looks like this folder is empty.']    15s    #Wait for the next page to load
    capture page screenshot    Portal_Creation.png

Add users to portal group

    Add new
    Input email
    Create contact
    Click Create the client portal and invite client users button

