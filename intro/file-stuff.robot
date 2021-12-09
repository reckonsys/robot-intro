*** Settings ***
Documentation     THis is related to file stuff
Library           OperatingSystem


*** Variables ***
${content}=    Create Dictionary    a=b


*** Test Cases ***
Simple File Manipulation
    [Tags]    simp-file-man
    ${content}=    Get File   README.md
    Log    ${content}
    # Set Suite Variable    ${content}

Demo Test case
    Log    ${content}
