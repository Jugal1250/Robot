*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***


${EmailTextBox}    //input[@name = 'email']
${PasswordTextBox}    //input[@name = 'password']
${SigninButton}    //span[text() = 'Sign in']

*** Keywords ***

Enter Email    [Arguments]    ${Email}

    wait until element is enabled    ${EmailTextBox}    15s
    input text    //input[@name = 'email']    ${Email}    #Email address text box

Enter Password    [Arguments]    ${Password}

    wait until element is enabled    ${PasswordTextBox}
    input text    ${PasswordTextBox}    ${Password}    #Password text box

Click Signin Button

    wait until element is enabled    ${SigninButton}    #Wait for Signin Button to enable
    sleep    1s
    click element    ${SigninButton}    #Signin Button

Home screen

   wait until element is visible    //button[@aria-label = 'Identity verification']    30s    #Wait for Home page to load
   capture page screenshot  Login_Successful.png

Login with valid credentials    [Arguments]    ${EMAIL_ADDRESS_Prod}    ${PASSWORD_Prod}

   Enter Email    ${EMAIL_ADDRESS_Prod}
   Enter Password  ${PASSWORD_Prod}
   Click Signin Button
   sleep    10s





