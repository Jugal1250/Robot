*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${OptionsButton}    //button[@custom-popover-text = 'Options']
${DeleteButton}    //span[text() ='Delete']//parent::span//parent::button
${DeleteThisFileButton}    //span[text() ='Yes, delete this file']//parent::translate//parent::span
${DeleteTheFolderButton}    //span[text() ='Yes, delete the folder']//parent::translate//parent::span
${AllfoldersCheckbox}    (//div[@class='md-container md-ink-ripple']//parent::md-checkbox)[1]
${TrashIcon}    //md-icon[@aria-label = 'fa fa-trash']//parent::button
${YesDeleteThisFilebutton}    //span[text()= 'Yes, delete this file']//parent::translate//parent::span//parent::button

*** Keywords ***

Click Options button

    wait until element is enabled    ${OptionsButton}    15s
    sleep    2s
    double click element    ${OptionsButton}

Click Delete Button

    wait until element is enabled    ${DeleteButton}
    sleep    1s
    click element    ${DeleteButton}

Select 'Delete This File' in the popup

    wait until element is enabled    ${DeleteThisFileButton}
    click element    ${DeleteThisFileButton}

Select 'Delete This folder' in the popup

    wait until element is enabled    ${DeleteTheFolderButton}
    click element    ${DeleteTheFolderButton}

Select all the folders

    wait until element is enabled    ${AllfoldersCheckbox}
    click element    ${AllfoldersCheckbox}

Select all the file

    wait until element is enabled    ${AllfoldersCheckbox}
    click element    ${AllfoldersCheckbox}

Click Trash Icon

    Sleep    3s
    wait until element is enabled    ${Trashicon}
    click element    ${Trashicon}

Delete the File

    Click Options button
    Click Delete Button
    Select 'Delete This File' in the popup

Delete the folder

    Click Options button
    Click Delete Button
    Select 'Delete This folder' in the popup

Confirm deletion

    wait until element is enabled    ${YesDeleteThisFilebutton}
    click element    ${YesDeleteThisFilebutton}

Delete all the folders

    select all the folders
    Click Trash Icon
    Confirm deletion

Delete all the file

    Select All The File
    Click Trash Icon
    Confirm deletion

Delete the data(Folders)

    sleep    3s
    ${count}    get element count    (//div[@class='md-container md-ink-ripple']//parent::md-checkbox)
    run keyword if    ${count}>3    Delete all the folders    ELSE    fail    No folder is available
    ${count}    get element count    (//div[@class='md-container md-ink-ripple']//parent::md-checkbox)
    run keyword if    ${count}==3    capture page screenshot    Data_Deleted.png
    sleep    2s


