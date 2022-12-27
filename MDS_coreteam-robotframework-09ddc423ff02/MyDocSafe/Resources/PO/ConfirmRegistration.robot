*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${NewPasswordTextBox}    (//input[@type = 'password'])[1]
${ConfirmPasswordTextBox}    (//input[@type = 'password'])[2]
${NextButton_CR}    //input[@type = 'submit']
${NextButton_CR02}    //span[text() = 'NEXT']//parent::translate//parent::button
${TakeMeToMydocsafeButton}    //span[text() = 'Take me to My DocSafe']//parent::translate//parent::button
${HomePage}    //span[text() = 'Welcome to Free trial']//parent::translate

*** Keywords ***

Setup Password
    switch window    NEW
    wait until element is enabled    ${NewPasswordTextBox}    30s
    input text    ${NewPasswordTextBox}    Testing1!
    wait until element is enabled    ${ConfirmPasswordTextBox}    30s
    input text    ${ConfirmPasswordTextBox}    Testing1!

Click Next Button_CR

    sleep    2s
    wait until element is enabled    ${NextButton_CR}
    click element    ${NextButton_CR}
    sleep    3s
    wait until element is enabled    ${NextButton_CR02}
    click element    ${NextButton_CR02}
    sleep    3s
    wait until element is enabled    ${NextButton_CR02}    10s
    scroll element into view    ${NextButton_CR02}
    click element    ${NextButton_CR02}

Click Take me to mydocsafe button

    wait until element is enabled    ${TakeMeToMydocsafeButton}
    click element    ${TakeMeToMydocsafeButton}

Home Page_free trial

    Sleep    2s
    wait until element is enabled    ${HomePage}
    capture page screenshot    Homepage_freetrial.png

Confirm Registration

    Setup Password
    Click Next Button_CR
    Click Take me to mydocsafe button
    Home Page_free trial