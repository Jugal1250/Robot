*** Settings ***

Library    ImapLibrary2
Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Keywords ***

Check Email is sent    [Arguments]    ${Email_address}    ${Password}

    open mailbox    host=imap.gmail.com    user=nivi.mydocsafe@gmail.com    password=rjkywphaxasaufix
    ${LATEST}    Wait For Email   sender=mydocsafe@mydocsafehq.com    timeout=5    folder=Inbox
    @{ALL_LINKS}    Get Links from Email    ${LATEST}
    SeleniumLibrary.Go To    ${ALL_LINKS}[0]
#    ${Multi}    walks multipart email    ${LATEST}
#    ${Body}    get email body    ${Multi}
#    log to console    ${Body}





