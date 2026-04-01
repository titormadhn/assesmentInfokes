*** Settings ***
Library    SeleniumLibrary
Resource    ../utility/variable.resource

*** Keywords ***
# --- Keywords for Positive Test Case ---
Buka Website Sauce Demo
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Sleep    1s
Masukan Username
    Wait Until Element Is Visible    id=user-name
    Click Element    id=user-name    
    Input Text    //input[@id='user-name']    ${username}
    Element Should Contain    (//div[@id='login_credentials'])[1]    ${username}    
    Sleep    1s
Masukan Password
    Wait Until Element Is Visible    id=password
    Click Element    id=password
    Input Text    id=password    ${password}
    Element Should Contain    (//div[@class='login_password'])[1]    ${password}    
    Sleep    1s
Klik Tombol Login
    Click Element    id=login-button
    Sleep    1s    
Berhasil login ke landing page
    Element Should Be Visible    class=title
    Capture Page Screenshot    Embed
    Sleep    1s    

# --- Keywords for Negative Test Case ---

Masukan invalid Username ${userInvalid}
    Click Element    id=user-name    
    Input Text    //input[@id='user-name']    ${userInvalid}
User tidak dapat login dan muncul pesan error ${err_msg}
    Run Keyword If    '${err_msg}' == 'message1'    Element Should Be Visible    //h3[contains(text(),'Epic sadface: Sorry, this user has been locked out')]
    ...    ELSE IF    '${err_msg}' == 'message2'    Element Should Be Visible    //h3[contains(text(),'Epic sadface: Username and password do not match any user in this service')]
    ...    ELSE    Log To Console    Field ${err_msg} tidak ditemukan
    Sleep    1s
    Capture Page Screenshot    Embed
    Close Browser
