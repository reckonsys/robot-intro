*** Settings ***
Documentation    To check email task
Library          SeleniumLibrary
Library          Reckonsys.py

Suite Teardown    Cleanup Browsers

*** Test Cases ***
Add pipeline emquiry
    open the browser with the company url email
    fill the login page
    go to clients pipeline and go to Automation page and click add automation option


*** Keywords ***
open the browser with the company url email
    Open Browser    https://appqa.enquirybot.com/login
    maximize browser window

fill the login page
    ${commonPage}=    Get Page Object    common.json
    Log    ${commonPage}
    input text        ${commonPage.LoginPage.userInput}    ${adminUsername}
    input password    id:login-page-password    ${adminPassword}
    click button      id:login-page-submit-btn
    wait until element is visible  ${commonPage.LoginPage.dismissUpdatePopupBtn}
    click element      ${commonPage.LoginPage.dismissUpdatePopupBtn}

go to clients pipeline and go to Automation page and click add automation option
    click link                 xpath://a[contains(text(),'account_box')]
    click element              xpath://tbody/tr[4]/td[3]/a[2]
    click element              xpath://div[@class='pipeline-list']/div/div[2]
    click element              xpath://span[contains(text(),'Automate')]
    click element              xpath://div[@class='add-automation']
    click element              xpath://span[contains(text(),'input')]


Cleanup Browsers
    Close All Browsers
