*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               These are common keywords from SauceDemo.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.saucedemo.com/
${BROWSER}        Chrome
${STANDARD}       standard_user
${LOCKED}         locked_out_user
${PROBLEM}        problem_user
${PERFROMANCE}    performance_glitch_user
${VALID PASS}     secret_sauce
${BACK BTN}       back-to-products
${SORT}           class=product_sort_container
${ITEM4}          item_4_title_link
${ITEM3}          item_3_title_link
${PROD4}          Sauce Labs Backpack
${PROD3}          Test.allTheThings() T-Shirt (Red)

*** Keywords ***
Setup Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Swag Labs
    Login Page Open

Login Page Open
    Page Should Contain Button    login-button

Product Page Open
    Page Should Contain    Products

Error Locked
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

Error Wrong
    Page Should Contain    Epic sadface: Username and password do not match any user in this service

Input User
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]    ${password}
    Input Password    password    ${password}

Get Child Webelements
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}    
    ${children}     Call Method       
    ...                ${element}    
    ...                find_elements   
    ...                  by=xpath    value=child::*    
    [Return]      ${children}

Check Items
    [Arguments]    ${first}    ${last}
    ${children}    Get Child Webelements   class=inventory_list
    ${child}    Get Child Webelements   ${children[0]}
    Element Should Contain   ${child}    ${first}
    ${children}    Get Child Webelements   class=inventory_list
    ${child}    Get Child Webelements   ${children[5]}
    Element Should Contain   ${child}    ${last}