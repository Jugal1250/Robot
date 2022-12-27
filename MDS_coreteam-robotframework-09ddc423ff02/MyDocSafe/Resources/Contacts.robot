*** Settings ***

Resource    ../Resources/PO/AddNewContact.robot
Resource    ../Resources/PO/ContactGroup.robot

*** Keywords ***

Add New Contact

    Click Plus button from contacts
    Click Add New Contact Button
    Select Contact Type    individual
    ${Contact_FirstName}    Enter FirstName(Contacts)
    ${Contact_LastName}    Enter LastName(Contacts)
    ${EmailValue}    get email
    ${Contact_EmailAddress}    Enter Email(Contacts)    ${EmailValue}
    Click Save to Save Contact
    Search Contact    ${Contact_EmailAddress}
    Contact should be displayed    ${Contact_EmailAddress}    ${Contact_FirstName}    ${Contact_LastName}
    [Return]    ${Contact_EmailAddress}

Edit Contact

    Click Edit Details Button
    ${Rename_FirstName}    randomword
    Rename Fields    ${Contact_firstnameTextField}    ${Rename_FirstName}
    ${CompanyName}    Enter the company name(Contacts)
    ${Id}    Enter the id
    Change status    active
    Click Save to Save Contact
    Navigate to Side Pane    Contacts
    Search Contact    ${Rename_FirstName}
    Select Contact    ${Rename_FirstName}
    capture page screenshot    Edited_Info.png

Create contact with Duplicate Email    [Arguments]    ${EmailAddress}

    Click Plus button from contacts
    Click Add New Contact Button
    Select Contact Type    individual
    Enter FirstName(Contacts)
    Enter LastName(Contacts)
    Enter Email(Contacts)    ${EmailAddress}
    Click Save to Save Contact

Create Contact Group

    ${GroupName}    randomword
    Click Plus button from contacts
    Click Create a New Group Button
    Enter Group Name    ${GroupName}
    Click Save to Save Group
    Verify group is created    ${GroupName}
    [Return]    ${GroupName}

Create Group with Duplicate Name  [Arguments]    ${GroupName}

    Click Plus button from contacts
    Click Create a New Group Button
    Enter Group Name    ${GroupName}
    Click Save to Save Group

Add group to contacts    [Arguments]    ${GroupName}

    Click manage groups
    Search and Add Group    ${GroupName}
    Click Save to Add Group

Add contacts to Group    [Arguments]    ${Contact}

    Click Manage group contacts
    Search and Add contacts    ${Contact}
    Click Save to Add contacts

Delete Contact

    Click Edit Details Button
    Click Delete Button to delete contact
    Click Yes,Delete button to confirm
