*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/Forms.robot
Resource    ../Resources/CreateAPortal.robot
Resource    ../Resources/PO/TabsPage.robot
Resource    ../Resources/FileUpload.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/PO/DeleteAPortal.robot
Resource   ../Resources/PO/UploadANewfilePage.robot
Resource   ../Resources/PO/OpenDocument.robot
Resource   ../Resources/PO/UserRegistration.robot
Resource   ../Resources/PO/MailinatorInbox.robot
Resource   ../Resources/PO/ConfirmRegistration.robot
Resource   ../Resources/PO/SearchAFolder.robot
Resource   ../Resources/PO/RestoreFromBin.robot
Resource   ../Resources/PO/Deletion.robot
Resource   ../Resources/PO/CreateStaticTemplate.robot
Library    OperatingSystem
Resource    ../Resources/PO/DownloadAndVerify.robot
Resource    ../Resources/PO/PortalLiveChat.robot
Resource    ../Resources/PO/CreateForm.robot
Resource    ../Resources/PO/SignForm.robot
Resource    ../Resources/Proposal.robot
Resource    ../Resources/PO/ProposalRecipient.robot
Resource    ../Resources/PO/SubPortals.robot
Resource    ../Resources/PO/SendForSigning.robot
Resource    ../Resources/Contacts.robot
Resource    ../Resources/PO/CSVContactUpload.robot
Resource    ../Resources/PO/MoveFolder.robot
Resource    ../Resources/PO/MoveAFile.robot
Resource   ../Resources/PO/SendDocForQuickApproval.robot
Resource   ../Resources/PO/ShareFolder.robot
Resource   ../Resources/PO/CompanyRoles.robot
Resource   ../Resources/PO/CompanyUsers.robot
Library    ../Library/CustomKeywords.py
Resource   ../Resources/PO/SigningDocuments.robot
Resource    ../Resources/PO/ChangeSigneeMail.robot
Resource    ../Resources/PO/DynamicTemplate.robot
Resource    ../Resources/PO/SendForSigningwithAdvanceOption.robot
Resource    ../Resources/PO/Rename_File&Folder.robot
Resource    ../Resources/PO/E-SignatureSettings.robot

*** Variables ***
${Environment}
${Email_address}
${Password}
${UserRegistrationLink}
${Production}

${Staging}    https://app-staging.mydocsafe.com/signin
${EMAIL_ADDRESS_Prod}    mydocsafetest50+QA_prod@gmail.com
${PASSWORD_Prod}    RobotFramework2!
${EMAIL_ADDRESS_Stag}    mydocsafetest50+QA_staging@gmail.com
${PASSWORD_Stag}    RobotFramework2!
${FILENAME}    01_DOC.doc
${FILENAME_PDF}    01_DOC.pdf
${Browser}
${Registration_Production}    https://app.mydocsafe.com/signup-free-trial/professional
${Registration_Staging}    https://app-staging.mydocsafe.com/signup-free-trial/professional
${TagName}


*** Test Cases ***

TC_001_Verify the user is able to Login with valid credentials

   [Tags]    ${TagName}
   [Teardown]  run keyword if test passed    close browser
   run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
   Login with valid credentials    ${Email_address}    ${Password}

TC_002_Verify the user is able to create a new portal

    [Tags]    ${TagName}
    [Teardown]  run keyword if test passed    close browser
    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
    Login with valid credentials    ${Email_address}    ${Password}
    Navigate to tabs    Portals
    ${PortalName}    Creation of Portal
    Navigate to tabs    Portals
    Delete Portal Group    ${PortalName}


#TC_003_Verify the File Upload
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Documents
#    Upload file    ${FILENAME}
#    Click Close Button
#    Navigate to tabs    Documents
#    Delete the data(Folders)
#
#TC_004_Verify the portal can be deleted
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Portals
#    ${PortalName}    Creation of Portal
#    Navigate to tabs    Portals
#    Delete Portal Group    ${PortalName}
#
#TC_005_Verify the user is able to view the document in viewer(Word)
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Documents
#    ${FolderName}    Upload file    ${FILENAME}
#    Upload More file    ${FILENAME_PDF}
#    Navigate to tabs    Documents
#    Search A Folder    ${FolderName}
#    Navigate to folder    ${FolderName}
#    Open the document    01_DOC.doc
#    close document
#    Navigate to tabs    Documents
#    Delete the data(Folders)
#
#TC_006_Verify the user is able to view the document in viewer(PDF)
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Documents
#    ${FolderName}    Upload file    ${FILENAME}
#    Upload More file    ${FILENAME_PDF}
#    Navigate to tabs    Documents
#    Search A Folder    ${FolderName}
#     Navigate to folder    ${FolderName}
#    Open the document    01_DOC.pdf
#    close document
#    Navigate to tabs    Documents
#    Delete the data(Folders)
#
##TC_007_Verify the Creation of Free trial account
##
##    [Tags]    ${TagName}
##    [Teardown]  run keyword if test passed    close browser
##    run keyword if    ${Browser=='chrome'}    Launch browser    ${UserRegistrationLink}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${UserRegistrationLink}
##    ${NewUserEmailAddress}    Register New User
##    Launch Mailinator    ${NewUserEmailAddress}    ${Browser}
##    Open Registration Email
##    Click confirm Link
##    Confirm Registration
#
#TC_008_Verify the user is able to delete and restore the file
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Documents
#    ${FolderName}    Upload file    ${FILENAME}
#    Click Close Button
#    Delete the File
#    Navigate to tabs    Documents
#    Search A Folder    ${FolderName}
#    Delete the folder
#    Navigate to Side Pane    Bin
#    Sort by Date
#    Restore File or folder    01_DOC
#    Restore File or folder    ${FolderName}
#    Navigate to tabs    Documents
#    Search A Folder    ${FolderName}
#    Select the folder
#    Open the document    01_DOC.doc
#    close document
#    Navigate to tabs    Documents
#    Delete the data(Folders)
#
#TC_009_Verify the user is able to create and save a static template
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Upload file    ${FILENAME}
#     Click Close Button
#     Create static Template
#     Navigate to tabs    Documents
#     Delete the data(Folders)
#
##TC_010_Verify the user is able to upload/download a file and the file downloaded in the system
##
##    [Tags]    ${TagName}
##    [Teardown]  run keyword if test passed    close browser
##    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
##    Login with valid credentials    ${Email_address}    ${Password}
##    Navigate to tabs    Documents
##    Upload file    ${FILENAME}
##    Click Close Button
##    Check if file is downloaded and exists    Susik
#
#TC_011_Verify the functionality of Portal chat
#
#    [Tags]    ${TagName}
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Portals
#    ${PortalName}    Create a Client group
#    Add Recipient    nivi.mydocsafe@gmail.com
#    Navigate to tabs    Portals
#    Live Chat    ${PortalName}
#    logout
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Portals
#    Delete Portal Group    ${PortalName}
#    [Teardown]    run keywords    run keyword if test passed    close browser    AND   run keyword if test failed  Launch browser    ${Environment}    ${Browser}    AND    run keyword if test failed    Login with valid credentials    ${Email_address}    ${Password}    AND    run keyword if test failed    Navigate to tabs    Portals    AND    run keyword if test failed    Delete Portal Group    ${PortalName}
#
#TC_012_Verify the functionality of Portal Form
#
#    [Tags]    ${TagName}
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Portals
#    ${PortalName}    Create a Client group
#    Add Recipient    nivi.mydocsafe@gmail.com
#    Navigate to tabs    Portals
#    Select Portal    ${PortalName}
#    ${FormName}    Add Forms to Portal    ${PortalName}
#    logout
#    Recipient Login
#    Click Accept Invite button
#    Sign Form    ${FormName}
#    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Go To Home Page
#    Verify Sign from Sender    ${FormName}
#    Navigate to tabs    Portals
#    Delete Portal Group    ${PortalName}
#    [Teardown]    run keywords    run keyword if test passed    close browser    AND   run keyword if test failed    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}    AND    run keyword if test failed    Login with valid credentials    ${Email_address}    ${Password}    AND    run keyword if test failed    Navigate to tabs    Portals    AND    run keyword if test failed    Delete Portal Group    ${PortalName}
#
#TC_013_Verify the functionality of Proposals
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Proposals
#    ${ClientEmail}    Create a Proposal
#    Verify the Proposals Status-Sent    ${ClientEmail}
#    close browser
#    run keyword if    ${Browser=='chrome'}    Launch Mailinator    ${ClientEmail}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    ${ClientEmail}
#    Open Proposal Email
#    Click Open Proposal Link
#    Accept Invite And Setup Password
#    Click Accept and Proceed
#    Fill the new client information form - Personal
#    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Proposals
#    Verify the Proposals Status-Won    ${ClientEmail}
#    Delete Proposal    ${ClientEmail}
#
#TC_014_Verify the option subportal groups exists and can be used to add a group
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Portals
#    ${PortalName}    Create a Portal
#    Navigate to SubPortals Menu
#    ${SubPortalName}    Create a Subportal
#    Check Subportal is created    ${SubPortalName}
#    Navigate to tabs    Portals
#    Delete Portal Group    ${PortalName}
#
#TC_015_Verify the functionality of Forms(Combination 01)
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Documents
#    Create Form(6 Elements)
#    Form Preview
#    Enter Answers(6 Elements)
#    View and Validate Form(6 Elements)
#    Navigate to tabs    Documents
#    Delete the data(Folders)
#
#TC_016_Verify the functionality of Forms(Combination -02)
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Documents
#    Create Form(elements: 'Checkboxes', 'Multiple choice' and 'Yes/No')
#    Form Preview
#    Enter Answers(elements: 'Checkboxes', 'Multiple choice' and 'Yes/No')
#    View and Validate Form(elements: 'Checkboxes', 'Multiple choice' and 'Yes/No')
#    Navigate to tabs    Documents
#    Delete the data(Folders)
#
#TC_017_Verify the functionality of Forms(Combination -03)
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Documents
#    Create Form(Next 5 Elements)
#    Form Preview
#    Enter Answer(Next 5 Elements)
#    View and Validate Form(Next 5 Elements)
#    Navigate to tabs    Documents
#    Delete the data(Folders)
#
#TC_018_Verify the user is able to add a new/existing contact
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Side Pane    Contacts
#     ${Contact_EmailAddress}    Add New Contact
#     Select Contact    ${Contact_EmailAddress}
#     Edit Contact
#     Go To Home Page
#     Navigate to Side Pane    Contacts
#     Create contact with Duplicate Email    ${Contact_EmailAddress}
#     Verify the Duplicate Email Message
#     Navigate to Side Pane    Contacts
#     Search Contact    ${Contact_EmailAddress}
#     Select Contact    ${Contact_EmailAddress}
#     Delete Contact
#     Verify contact is not available    ${Contact_EmailAddress}
#
#TC_019_Verify the user is able to create Groups/Group with duplicate name
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Contacts
#     ${GroupName}    Create Contact Group
#     Create Group with Duplicate Name    ${GroupName}
#     Verify the duplicate group name error message
#
#TC_20_Verify the user is able to add contacts to Groups
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Contacts
#     ${GroupName}    Create Contact Group
#     Go To Home Page
#     Navigate to Contacts
#     ${Contact_EmailAddress_1}    Add New Contact
#     Select Contact    ${Contact_EmailAddress_1}
#     Add group to contacts    ${GroupName}
#     Go To Home Page
#     Navigate to Contacts
#     ${Contact_EmailAddress_2}    Add New Contact
#     Navigate to Group    ${GroupName}
#     Contact should be displayed in the group    ${Contact_EmailAddress_1}
#     Add contacts to Group    ${Contact_EmailAddress_2}
#     Contact should be displayed in the group    ${Contact_EmailAddress_2}
#     Delete group
#
#TC_21_Verify the user is able to delete a contact
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Side Pane    Contacts
#     ${Contact_EmailAddress}    Add New Contact
#     Select Contact    ${Contact_EmailAddress}
#     Delete Contact
#     Verify contact is not available    ${Contact_EmailAddress}
#
#
#TC_22_Verify the new contact is auto added when sending a doc for signing to the new contact
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     ${ContactEmail}    get email
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Side Pane    Contacts
#     Search Contact    ${ContactEmail}
#     Verify contact is not available    ${ContactEmail}
#     Navigate to tabs    Documents
#     Upload file    ${FILENAME}
#     Click Close Button
#     Click Three Dot Button
#     Send For Signing    ${ContactEmail}
#     Go To Home Page
#     Navigate to Side Pane    Contacts
#     Search Contact    ${ContactEmail}
#     Contact should be displayed    ${ContactEmail}    ${EMPTY}    ${EMPTY}
#     Select Contact    ${ContactEmail}
#     Delete Contact
#     Navigate to tabs    Documents
#     Delete the data(Folders)
#
#TC_23_Verify the CSV Contact Upload
#
#     ${Contact_1}  set variable    viktor.abris+s2-com-03@gmail.com
#     ${Contact_2}  set variable    viktor.abris+s2-com-05@gmail.com
#     [Tags]    ${TagName}
#     [Teardown]  run keywords    run keyword if test passed    Delete the imported contacts    ${Contact_1}    ${Contact_2}    AND    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Side Pane    Contacts
#     Verify contact is not available    ${Contact_1}
#     Verify contact is not available    ${Contact_2}
#     CSV Contact Upload
#     Verify contact is imported   ${Contact_1}    ${Contact_2}
#     Go To Home Page
#     Navigate to Side Pane    Contacts
#
#TC_24_Verify the user is able to move a folder
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Navigate to tabs    Documents
#     ${Folder_02}    Create a new folder
#     Verify the folder is created
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Move folder    ${Folder_02}
#     Search A Folder    ${Folder_02}
#     Select the folder
#     Navigate to folder    ${Folder_01}
#     Open the document    ${FILENAME}
#     close document
#     Navigate to tabs    Documents
#     Delete the data(Folders)
#
#TC_25_Verify the user is able to move a file
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Click plus button from documents window
#     Document Upload    ${FILENAME}
#     Sort by Date
#     ${FolderName}    Move File
#     Verify the file is moved successfully    ${FolderName}    ${FILENAME}
#     Close Document
#     Navigate to tabs    Documents
#     Delete the data(Folders)
#
#TC_26_Bounce Email
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    ${ContactEmail}    get email
#    Login with valid credentials    ${Email_address}    ${Password}
#    Upload Single Document
#    Click Three Dot Button
#    ${random_string}=    Generate Random String    8    [LOWER]
#    Send For Signing    ${random_string}@mailinator.com
#    Delete the File
#    Go to the sender mail    ${random_string}
#
#TC_27_Uploading and signing large files
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    ${ContactEmail}    get email
#    Login with valid credentials    ${Email_address}    ${Password}
#    Upload Big file
#    Delete the data(Folders)
#
#TC_28_Send several docs for signing using Send for quick approval
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    ${ContactEmail}    get email
#    Login with valid credentials    ${Email_address}    ${Password}
#    Upload Multiple Documents
#    Send Document For Quick Approval    rahul.sharma_05@mailinator.com
#    Sign on the documents in sender mail     rahul.sharma_05    rahul.sharma_05@mailinator.com
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Go back to sender account
#
#TC_029_Verify the user is able to share a folder
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Share folder/File    testmydocsafe    Full Access    1
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testmydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testmydocsafe@mailinator.com
#     Open Folder invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testmydocsafe@mailinator.com
#     Open the folder    ${Folder_01}
#     Open the document    01_DOC.doc
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testmydocsafe@mailinator.com
#
#TC_030_Verify the user is able to share a file
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Share folder/File    testing01.mydocsafe    Full Access    1
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testing01.mydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testing01.mydocsafe@mailinator.com
#     Open Document invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testing01.mydocsafe@mailinator.com
#     Open the document    01_DOC.doc
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testing01.mydocsafe@mailinator.com
#
#
#TC_031_Verify the user is able to create a role and duplicate role validation
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     ${Rolename}    randomword
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Create Role    ${Rolename}
#     Create Role    ${Rolename}
#     Validate the Duplicate Role error message
#     Close Dialog
#     Delete Role    ${Rolename}
#
#TC_032_Verify the user is able to create a company user
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     ${Rolename}    randomword
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Create Role    ${Rolename}
#     Select an option under settings    Company Users
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Add User    testing.mydocsafe    ${Rolename}
#     Verify the user is added successfully
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    testing.mydocsafe@mailinator.com    Testing1!
#     Click Accept Invite button
#     Navigate to tabs    Documents
#     Verify the document page of Account A is displayed    QA Staging documents
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testing.mydocsafe@mailinator.com
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Delete Role    ${Rolename}
#
#TC_33_Send one doc for signing to two users
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Upload Single Document
#    Select Uploaded Document
#    Click On Pen Icon
#    Add Multiple Signee Send And Sign Document    ${Browser}
#    Go Back To Account    ${Environment}    ${Browser}    ${Email_address}    ${Password}
#
#TC_34_Send two docs for signing to one user
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    ${RandomMail}    get email
#    Login with valid credentials    ${Email_address}    ${Password}
#    Upload Multiple Documents
#    Select Both Documents
#    Click On Pen Icon
#    Send Multiple Documents to Single Signee    ${RandomMail}    ${Browser}
#    Go Back To Account    ${Environment}    ${Browser}    ${Email_address}    ${Password}
#
#TC_35_Send doc for signing to a contacts group
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     ${ContactEmail}    get email
#     Login with valid credentials    ${Email_address}    ${Password}
#     Upload Single Document
#     Click Three Dot Button
#     Click Send For Signing button
#     ${ContactMail1}    ${ContactMail2}    Add Contact Group As Signee
#     Add Signature Filed In Contacts Signee
#     Delete the File
#     Close Browser
#     ${CPassword}    Sign The Document with Both Contacts    ${Browser}    ${ContactMail1}    ${ContactMail2}
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${ContactMail1}    RobotFramework2!
#     Go To Signature Technical Details Page
#
#TC_36_Change signe mail
#
#     [Tags]    ${TagName}
#     [Teardown]  run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     ${ContactEmail}    get email
#     Login with valid credentials    ${Email_address}    ${Password}
#     Upload Single Document
#     Click Three Dot Button
#     Click Send For Signing button
#     ${random_mail1}    Add Multiple Signee
#     Change mail    ${random_mail1}
#     Sign mail    ${random_mail1}    ${Browser}
#
#TC_37_Sending for signing by mail merge
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    ${ContactEmail}    get email
#    Login with valid credentials    ${Email_address}    ${Password}
#    ${random_string}=    Generate Random String    6    [LOWER]
#    Creating dynamic template and Send By Mail Merge    ${random_string}
#
#TC_38_Adding Signing Reminder In Advance options
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    ${ContactEmail}    get email
#    Login with valid credentials    ${Email_address}    ${Password}
#    Upload Single Document
#    Select Uploaded Document
#    Click On Pen Icon
#    Add Reminder and Send Signee    ${ContactEmail}
#
#TC_039_Verify the folder Sharing permissions(Full Access)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Share folder/File    testmydocsafe    Full Access    1
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testmydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testmydocsafe@mailinator.com
#     Open Folder invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testmydocsafe@mailinator.com
#     Click Options button
#     Verify the options available    Delete
#     Verify the options available    Share
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testmydocsafe@mailinator.com
#
#TC_040_Verify the folder Sharing permissions(Read/Write/Esign)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Share folder/File    testmydocsafe    Read/Write/Esign    1
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testmydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testmydocsafe@mailinator.com
#     Open Folder invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testmydocsafe@mailinator.com
#     Click Options button
#     Verify the options not available    Delete
#     Verify the options not available    Share
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testmydocsafe@mailinator.com
#
#TC_041_Verify the folder Sharing permissions(Read)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Share folder/File    testmydocsafe    Read    2
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testmydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testmydocsafe@mailinator.com
#     Open Folder invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testmydocsafe@mailinator.com
#     Click Options button
#     Verify the options available    Open
#     Verify the options not available    Delete
#     Verify the options not available    Share
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testmydocsafe@mailinator.com
#
#TC_042_Verify the file Sharing permissions(Full Access)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Share folder/File    testmydocsafe    Full Access    1
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testmydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testmydocsafe@mailinator.com
#     Open Document invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testmydocsafe@mailinator.com
#     Click Options button
#     Verify the options available    Delete
#     Verify the options available    Share
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testmydocsafe@mailinator.com
#
#TC_043_Verify the file Sharing permissions(Read/Write/Esign)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Share folder/File    testmydocsafe    Read/Write/Esign    1
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testmydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testmydocsafe@mailinator.com
#     Open Document invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testmydocsafe@mailinator.com
#     Click Options button
#     Verify the options not available    Delete
#     Verify the options not available    Share
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testmydocsafe@mailinator.com
#
#TC_044_Verify the file Sharing permissions(Read)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     ${Folder_01}    Upload file    ${FILENAME}
#     Click Close Button
#     Share folder/File    testmydocsafe    Read    2
#     Click Close Button
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch Mailinator    testmydocsafe@mailinator.com    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch Mailinator Headless    testmydocsafe@mailinator.com
#     Open Document invite email
#     Accept folder invite
#     Switch To New Window
#     login to 2nd account and accept invite    testmydocsafe@mailinator.com
#     Click Options button
#     Verify the options available    Open
#     Verify the options not available    Delete
#     Verify the options not available    Share
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Navigate to tabs    Documents
#     Search A Folder    ${Folder_01}
#     Delete the folder
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    testmydocsafe@mailinator.com
#
#TC_45_Rename a file and a folder
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    ${ContactEmail}    get email
#    Login with valid credentials    ${Email_address}    ${Password}
#    Upload Single Document
#    Click Three Dot Button
#    Rename file
#    Rename folder
#
#TC_46_A portal creation with a new user
#
#    [Tags]    ${TagName}
#    [Teardown]  run keyword if test passed    close browser
#    run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Portals
#    ${PortalName}    Create a Client group
#    ${random_mail}=    Generate Random String    5    [LOWER]
#    Add Random Recipient   ${random_mail}@mailinator.com
#    Logout
#    Accept portal request    ${random_mail}
#    Logout
#    Login with valid credentials    ${Email_address}    ${Password}
#    Navigate to tabs    Portals
#    Delete Portal Group    ${PortalName}
#
#TC_047_A company Role permissions - permissions for the admin access(Read/Write/Esign)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     ${Rolename}    randomword
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Create Role    ${Rolename}
#     Select an option under settings    Company Users
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Add User   test_02.mydocsafe@mailinator.com    ${Rolename}
#     Verify the user is added successfully
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Select permissions for role    ${Rolename}    Read/Write/Esign    1
#     Verify the permission is selected    Read/Write/Esign
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    test_02.mydocsafe@mailinator.com    Testing1!
#     Click Accept Invite button
#     ${FolderName}    Create a new folder
#     Click Options button
#     Verify the options not available    Delete
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    test_02.mydocsafe@mailinator.com
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Delete Role    ${Rolename}
#     Select an option under settings    Company Users
#     Go To Home Page
#     Navigate to tabs    Documents
#     Delete the data(Folders)
#
#TC_048_A company Role permissions - permissions for the admin access(Read)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     ${Rolename}    randomword
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Create Role    ${Rolename}
#     Select an option under settings    Company Users
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Add User   test_02.mydocsafe@mailinator.com    ${Rolename}
#     Verify the user is added successfully
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Select permissions for role    ${Rolename}    Read    2
#     Verify the permission is selected    Read
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    test_02.mydocsafe@mailinator.com    Testing1!
#     Click Accept Invite button
#     Verify the folder creation option not available
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    test_02.mydocsafe@mailinator.com
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Delete Role    ${Rolename}
#
#TC_049_A company Role permissions - permissions for the admin access(Full access)
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     ${Rolename}    randomword
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Create Role    ${Rolename}
#     Select an option under settings    Company Users
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Add User   test_02.mydocsafe@mailinator.com    ${Rolename}
#     Verify the user is added successfully
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    test_02.mydocsafe@mailinator.com    Testing1!
#     Click Accept Invite button
#     ${FolderName}    Create a new folder
#     Click Options button
#     Verify the options available    Delete
#     Verify the options available    Share
#     Verify the options available    Open
#     close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Users
#     Remove User    test_02.mydocsafe@mailinator.com
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    Company Roles
#     Delete Role    ${Rolename}
#     Select an option under settings    Company Users
#     Go to home page
#     Navigate to tabs    Documents
#     Delete the data(Folders)
#
#TC_050_A company settings - E Signature settings
#
#     [Tags]    ${TagName}
#     [Teardown]    run keyword if test passed    close browser
#     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
#     Login with valid credentials    ${Email_address}    ${Password}
#     ${Rolename}    randomword
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    E-signature
#     E Signature Settings - Check
#     Click Update Esignature button
#     Select an option under settings    Company Users
#     Navigate to tabs    Documents
#     ${FolderName}    Upload file    ${FILENAME}
#     Click Close Button
#     Click Three Dot Button
#     Send For signing - Esignature Settings
#     Close Document
#     Go To Home Page
#     Navigate to Settings
#     Select an option under settings    E-signature
#     Verify the checkbox is unchecked
#     Select an option under settings    Company Users
#     Go To Home Page
#     Navigate to tabs    Documents
#     Delete the data(Folders)