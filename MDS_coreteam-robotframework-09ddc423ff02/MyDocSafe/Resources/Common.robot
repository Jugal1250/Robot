*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../Library/CustomKeywords.py
Resource    ../Resources/PO/TabsPage.robot
Resource    ../Resources/PO/Deletion.robot
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/PO/CompanyUsers.robot


*** Variables ***

${FILENAME}    01_DOC.doc
${FolderName}
${UserIcon}    (//div[@class = 'picture-block'])[2]
${SignoutButton}    //span[text() = 'Sign out']
${HomeButton}    //span[contains(text(), 'Home')]//parent::translate//parent::button
${NewHomeButton}    //span[contains(text(), 'Home')]//parent::a
${NewDocumentsButton}    //span[contains(text(), 'Documents')]//parent::a
${chrome_options}
${Settings}    //a[@aria-label = 'Settings']

*** Keywords ***


Launch browser  [Arguments]    ${Environment}    ${Browser}

    open browser  ${Environment}    ${Browser}
    set window size    ${1400}    ${600}
    maximize browser window

Launch browser Headless    [Arguments]    ${Environment}

   ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome options}    add_argument    window-size\=1400,600
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    go to   ${Environment}
    sleep    3s

Logout

    sleep    2s
    wait until element is enabled    ${UserIcon}
    click element    ${UserIcon}
    wait until element is enabled    ${SignoutButton}
    sleep    1s
    click element    ${SignoutButton}

Scroll Down

    execute javascript    window.scrollTo(0,200)

Go To Home Page

    wait until element is enabled    ${HomeButton}    5s
    sleep    1s
    click element    ${HomeButton}

Switch To New Window

    switch window    NEW    15s

Switch to Main Window

    switch window    MAIN    15s

Navigate to Settings

    wait until element is enabled    ${Settings}    10s
    sleep    2s
    click element    ${Settings}

Select an option under settings    [Arguments]    ${Options}

    wait until element is enabled    //div[text() = '${Options}']//parent::a
    sleep    2s
    scroll element into view    //div[text() = '${Options}']//parent::a
    scroll down
    wait until keyword succeeds    2x    2s    click element    //div[text() = '${Options}']//parent::a

Navigate to Documents

    wait until element is enabled    ${NewDocumentsButton}    5s
    sleep    1s
    click element    ${NewDocumentsButton}

Test Cleanup

     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
     Login with valid credentials    ${Email_address}    ${Password}
     Go To Home Page
     Navigate to tabs    Documents
     Delete the data(Folders)
     Go To Home Page
     Navigate to Settings
     Select an option under settings    Company Users
     ${Count}    get element count     (//button[@class = 'md-icon-button md-button md-default-theme md-ink-ripple'])
     run keyword if    ${Count}>1    click element    (//button[@class = 'md-icon-button md-button md-default-theme md-ink-ripple'])[${Count}]
     Click Remove User button
     Confirm Delete
     sleep    4s
     capture page screenshot    User_deleted.png

