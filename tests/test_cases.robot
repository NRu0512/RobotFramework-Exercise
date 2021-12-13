*** Settings ***
Documentation     A test suite for Exercise: SeleniumIDE & RobotFramework Practice.
...               
...               These are test cases listed in the instructions.
Test Setup        Setup Browser
Resource          resource.robot

*** Test Cases ***
1 Valid Login
    Input User    ${STANDARD}
    Input Pass    ${VALID PASS}
    Click Button    login-button
    Product Page Open
    [Teardown]    Close Browser

2 Locked Out
    Input User    ${LOCKED}
    Input Pass    ${VALID PASS}
    Click Button    login-button
    Login Page Open
    Error Locked
    [Teardown]    Close Browser

3 Wrong Password
    Input User    ${STANDARD}
    Input Pass    wrongpass
    Click button    login-button
    Login Page Open
    Error Wrong
    [Teardown]    Close Browser

4 Problem User
    Input User    ${PROBLEM}
    Input Pass    ${VALID PASS}
    Click button    login-button
    Product Page Open
    Click Element    ${ITEM4}
    Page Should Not Contain    ${PROD4}
    Click Button    ${BACK BTN}
    Click Element    ${ITEM3}
    Page Should Not Contain    ${PROD3}
    Click Button    ${BACK BTN}
    [Teardown]    Close Browser

5 Sort A-Z
    Input User    ${STANDARD}
    Input Pass    ${VALID PASS}
    Click Button    login-button
    Product Page Open
    
    [Teardown]    Close Browser