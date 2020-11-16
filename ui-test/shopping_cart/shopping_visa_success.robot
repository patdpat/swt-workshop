*** Settings ***
Library    SeleniumLibrary
# Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}    chrome
${URL}    https://dminer.in.th/Product-list.html
${CARD_NUMBER}    4719700591590995
${EX_MONTH}    7
${EX_YEAR}    20
${CVV}    752
${CARD_NAME}    Karnwat Wongudom

*** Test Cases ***
Test user order a toy for his/her daughter succeed by visa shipping via kerry
    Display list of product page
    Shows product detail
    Choose quantity of that product you want to buy
    Add product to cart
    Confirm order and go to payment page
    Payment by credit card visa
    Thank you message

*** Keywords ***
Display list of product page
    Open Browser    ${URL}    ${BROWSER}
Shows product detail
    Element Should Contain    id:productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id:productPrice-1    expected=12.95 USD
    Click Element    id:viewMore-1
Choose quantity of that product you want to buy
    Wait Until Element Contains    id:productName    43 Piece dinner Set
    Element Should Contain    id:productBrand    expected=CoolKidz
    Element Should Contain    id:productPrice    expected=12.95 USD
    Input Text    id:productQuantity    1
Add product to cart
    Click Element    id:addToCart
Confirm order and go to payment page
    Wait Until Page Contains    ยืนยันคำสั่งซื้อ
    Element Should Contain    id:totalAmount    expected=14.95 USD
    Element Should Contain    id:productName-1    expected=43 Piece dinner Set
    Click Element    id:confirmPayment
Payment by credit card visa
    Wait Until Page Contains    เลขบัตร:
    Input Text    id:cardNumber    ${CARD_NUMBER}
    Input Text    id:expiredMonth    ${EX_MONTH}
    Input Text    id:expiredYear    ${EX_YEAR}
    Input Text    id:cvv    ${CVV}
    Input Text    id:cardName    ${CARD_NAME}
    Click Element    id:Payment
Thank you message
    Wait Until Element Contains    id:notify    วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900
