*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME}    xxx
${PASSWORD}    xxx
${POST}    สวัสดีRobotframework

*** Test Cases ***
Test login and post on Twitter
    type twitter url
    input login info to Twitter
    hit ENTER
    find a post div and click post

*** Keywords ***
type twitter url
    Open Browser    https://twitter.com/login    chrome
input login info to Twitter
    Wait Until Page Contains    Phone, email, or username
    Input Text    xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div[1]/form/div/div[1]/label/div/div[2]/div/input    ${USERNAME}
    Input Text    name:session[password]    ${PASSWORD}
hit ENTER
    Press Keys    None    RETURN
find a post div and click post
    Wait Until Page Contains    มีอะไรเกิดขึ้นบ้าง
    Click Element    xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div
    Input Text    xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[1]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div[2]/div    ${POST}
    Click Element    xpath://*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[2]/div/div[2]/div[1]/div/div/div/div[2]/div[4]/div/div/div[2]/div[3]