*** Settings ***

Library    SeleniumLibrary


# Test Setup    Post Test Cleanup
# Test Teardown     Post Test Cleanup
# Suite Setup    Setup Selenium Configs
Suite Teardown       Close All Browsers

*** Test Cases ***

b64 encode reckonsys
    Open Browser    url=https://www.base64encode.org/
    Input Text    id:input    reckonsys
    Click Button    id:submit_text
    Sleep    1
    ${encoded}=    Get Value    id:output
    Should Be Equal    ${encoded}    cmVja29uc3lz
    Capture Page Screenshot
    My Keyword



*** Keywords ***

My Keyword
  Log     foo
