*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test search keyword and verify search result on Google
    type google url
    type *Keyword*
    hit ENTER
    find/verify Link US Election 2020 - BBC News

*** Keywords ***
type google url
    Open Browser    https://www.google.com    chrome
type *Keyword*
    Input Text    name:q   USElection2020
hit ENTER
    Press Keys    None    RETURN
find/verify Link US Election 2020 - BBC News
    Page Should Contain    US Election 2020 - BBC News
    Wait Until Page Contains    US Election 2020 - BBC News
    Click Link    https://www.bbc.com/news/election/us2020