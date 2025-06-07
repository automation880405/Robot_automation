*** Settings ***

Library    SeleniumLibrary


*** Variables ***
${Sign_btn}  //span[contains (text(),'Sign in')]
${Search}   twotabsearchtextbox

*** Test Cases ***
Login Amazon
    verify user is onAmazon login page
    verify user is able to login

    search for Iphone 16
 #Buy iphone 16


*** Keywords ***
verify user is on Amazon login page
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To    https://www.amazon.in/

    Sleep    5
    Reload Page
    Wait Until Element Is Visible    nav-link-accountList
    Mouse Over      nav-link-accountList
    Wait Until Element Is Visible    xpath:${Sign_btn}
    Click Element    ${Sign_btn}
    Page Should Contain    Enter mobile number or email
 
verify user is able to login
    Input Text    ap_email_login    9538749657
    Sleep    1
    Click Element    id:continue
    Input Text    ap_password    Happy*24
    Sleep    3
    Click Element    auth-signin-button

search for Iphone 16
 
    Wait Until Element Is Visible    ${Search}
    Input Text    ${Search}    Iphone 16
    Click Element    id:nav-search-submit-button
    Scroll Element Into View    locator


