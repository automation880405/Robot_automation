*** Settings ***
Documentation   Validate the Login form
Library         SeleniumLibrary
Library    Collections
Test Setup      Open the URL with mortgage Paymnet URL
Test Teardown   Close Browser
Resource        resource.robot
#Selenium
*** Variables ***
${Error_message_Login}      css:div.alert-danger
${Shop_page_load}           css:.nav-link


*** Test Cases ***
VALIDATE card display in the shopping page
    FILL THE LOGIN FORM     ${user_name}    ${Valid_Password}
    Wait Until Element Is loacted in the page    ${Shop_page_load}
    Verify cards titles in the Shop page
    Select the card     Samsung Note 8

*** Keywords ***

FILL THE LOGIN FORM
    [arguments]     ${user_name}     ${Valid_Password}
    Input Text    id:username      ${user_name}
    Input Password    id:password    ${Valid_Password}
    Click Button    id:signInBtn

Wait Until Element Is loacted in the page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}

Verify cards titles in the Shop page
    @{ExpectedList}=  Create List     iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=    Get WebElements    css:.card-title
    @{actualList}=  Create List
    FOR    ${element}    IN    @{elements}

        Log    ${element.text}
        Append To List  ${actualList}   ${element.text}

    END
    Lists Should Be Equal   ${ExpectedList}      ${actualList}

Select the card
    [arguments]    ${cardName}
    ${elements}=    Get WebElements    css:.card-title
    ${Index}=   Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If      '${cardName}' == '${element.text}'
         ${index}=  Evaluate   ${index} + 1

    END
    Click Button    xpath:(//*[@class='card-footer'])[${Index}]/buttonrob



