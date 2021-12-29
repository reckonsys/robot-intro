*** Settings ***
Documentation    To check email task
Library          SeleniumLibrary
Library          Reckonsys.py

Suite Teardown    Cleanup Browsers

*** Test Cases ***
Preview Bots
    open the browser with the company url email
    fill the login page
    Accounts page and select the clients bots option

My Secon Test
   Log    foo

*** Keywords ***
open the browser with the company url email
    Open Browser    https://appqa.enquirybot.com/login
    maximize browser window

fill the login page
    input text        id:login-page-username    ${adminUsername}
    input password    id:login-page-password    ${adminPassword}
    click button      id:login-page-submit-btn
    wait until element is visible  xpath://button[text()='Dismiss']/..
    click element      xpath://button[text()='Dismiss']/..

Accounts page and select the clients bots option
    click link            xpath://a[contains(text(),'account_box')]
    click element         xpath://tbody/tr[4]/td[3]/a[1]
    click element         xpath://tbody/tr[6]/td[5]/a[2]


Cleanup Browsers
    Close All Browsers
