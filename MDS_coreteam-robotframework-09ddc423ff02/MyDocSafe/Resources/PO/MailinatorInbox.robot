*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${ConfirmButton}    //a[text() = 'Click to confirm']//parent::td
${FolderinviteEmail}   (//td[contains(text(), 'Folder Invite')])[1]
${DocumentInviteEmail}   (//td[contains(text(), 'Document Invite')])[1]


*** Keywords ***

Launch Mailinator    [Arguments]    ${Email_Mailinator}    ${Browser}

    open browser    https://www.mailinator.com/v4/public/inboxes.jsp?to=${Email_Mailinator}    ${Browser}
    maximize browser window

Launch Mailinator Headless    [Arguments]    ${Email}

   ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome options}    add_argument    window-size\=1400,600
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    go to   https://www.mailinator.com/v4/public/inboxes.jsp?to=${Email}

Open Registration Email

    wait until element is enabled    //td[contains(text(), 'Account Invitation')]    30s
    click element    //td[contains(text(), 'Account Invitation')]
    sleep    2s

Open Proposal Email

    wait until element is enabled    //td[contains(text(), 'New proposal')]    30s
    click element    //td[contains(text(), 'New proposal')]
    sleep    2s

Click confirm Link

    FOR    ${i}    IN RANGE    1    32
     press keys    None    TAB
    END
    Execute JavaScript    window.scrollTo(0,200)
    sleep    2s
    select frame    //iframe[@id = 'html_msg_body']
    click element    //a[text() = 'Click to confirm']//parent::td

Click Open Proposal Link

    select frame    //iframe[@id = 'html_msg_body']
    click element    //a[text() = 'Proceed to view the proposal']//parent::td

Open Folder invite email

    wait until element is enabled    ${folderinviteemail}    60s
    click element    ${FolderinviteEmail}

Open Document invite email

    wait until element is enabled    ${DocumentInviteEmail}    60s
    click element    ${DocumentInviteEmail}

Accept folder invite

    wait until element is enabled    //iframe[@id = 'html_msg_body']
    select frame    //iframe[@id = 'html_msg_body']
    wait until element is enabled    //a[text() = 'Accept invitation']//parent::td
    click element    //a[text() = 'Accept invitation']//parent::td