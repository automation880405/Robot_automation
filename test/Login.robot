*** Settings ***
Documentation   Validate the Login form
Library         SeleniumLibrary
#Resource
#Selenium
*** Test Cases ***
VALIDATE SUCESSFUL LOGIN
    Open the URL with mortgage Paymnet URL
    #FILL THE LOGIN FORM
     #wait untill it checks and display error message
     #Verify erorr message is correct
*** Keywords ***
Open the URL with mortgage Paymnet URL
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/