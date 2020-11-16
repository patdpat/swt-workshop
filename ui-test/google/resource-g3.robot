*** Variables ***
${BROWSER}    chrome
${URL}    https://www.google.com
${KEYWORD}    USElection2020
${EXPECTED_RESULT}    US Election 2020 - BBC News

*** Keywords ***
type google url
    Open Browser    ${URL}    ${BROWSER}
type *Keyword*
    Input Text    name:q   ${KEYWORD}
hit ENTER
    Press Keys    None    RETURN
find/verify expected result
    Page Should Contain    ${EXPECTED_RESULT}
    Wait Until Page Contains    ${EXPECTED_RESULT}
    Click Link    https://www.bbc.com/news/election/us2020
    Close Browser