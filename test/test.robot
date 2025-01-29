*** Settings ***
Documentation   Validate the Login form
Library         SeleniumLibrary
Test Setup      Open the URL with mortgage Paymnet URL
Test Teardown   Close Browser
Resource        resource.robot
#Selenium
*** Variables ***
${Error_message_Login}      css:div.alert-danger
${Username}         id:username
${Password}         id:password
*** Test Cases ***
VALIDATE SUCESSFUL LOGIN

    FILL THE LOGIN FORM
    wait untill it checks and display error message
    Verify erorr message is correct
*** Keywords ***


FILL THE LOGIN FORM
    Input Text    ${Username}    ${user_name}
    Input Password    ${Password}    ${Invalid_Password}
    Click Button    id:signInBtn
wait untill it checks and display error message
    Wait Until Element Is Visible    ${Error_message_Login}
Verify erorr message is correct
    ${result}=  Get Text             ${Error_message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${result}     Incorrect username/password.



