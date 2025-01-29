*** Settings ***
Documentation       A resource file with reusable keywords and variables
Library         SeleniumLibrary
*** Variables ***
${user_name}            rahulshettyacademy
${Invalid_Password}     rahulshettyacademy
${valid_Password}       Learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the URL with mortgage Paymnet URL
    Create Webdriver    Chrome
    Go To               ${url}

Close Broswer Session
    Close Browser