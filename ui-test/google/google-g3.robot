*** Settings ***
Library    SeleniumLibrary
Resource    resource-g3.robot

*** Test Cases ***
Test search keyword and verify search result on Google
    type google url
    type *Keyword*
    hit ENTER
    find/verify expected result

