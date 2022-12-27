*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py

*** Variables ***

${PlusbuttonPortals}    //h1/button/md-icon
${PortalNametextbox}    //input[@ng-model = 'vm.newPortalName']
${Createbutton}    //span[text() = 'Create']
${Name}



*** Keywords ***

Click Plus button from Portals window

    wait until element is enabled    ${PlusbuttonPortals}   #Wait for Plus button to load
    click element    ${PlusbuttonPortals}    #Click Plus button

Enter Name

    [Return]    ${Name}
    ${Name}    randomword
    wait until element is enabled    ${PortalNametextbox}     #Wait for Portal Name field to load
    scroll element into view    ${PortalNametextbox}     #Scroll in to the field view
    input text    //input[@ng-model = 'vm.newPortalName']    ${Name}    #Enter Portal name

Click Create button
    wait until element is enabled    ${Createbutton}    #Wait for Create button to enable
    click element    ${Createbutton}    #Click Create button

Create a Client group

    [Return]    ${Name}
    Click Plus button from Portals window
    ${Name}    Enter Name
    click create button
    sleep    4s




