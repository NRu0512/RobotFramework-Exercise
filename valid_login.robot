*** Settings ***
Documentation     A test suite for valid login
...               
...               These are test cases listed in the instructions
...               
Library           SeleniumLibrary

*** Test Cases ***
Valid Login
    # open browser
    Open Browser    https://www.saucedemo.com/  Chrome
    # set window size

    # input username
    # input password
    # click login button
    # should be in products page
    # close browser

*** Keywords ***