*** Settings ***
Resource    ../stepDefinition/sdLogin.resource

*** Test Cases ***
TC01 - Login dengan data valid
    [Documentation]    Positive Case
    Buka Website Sauce Demo
    Masukan Username
    Masukan Password
    Klik Tombol Login
    Berhasil login ke landing page

TC02 - Login dengan invalid username
    [Documentation]    Negative Case
    [Template]  invalid username example
    locked_out_user   message1
    wrong_user        message2

*** Keywords ***
invalid username example
    [Arguments]    ${userInvalid}    ${err_msg}
    Buka Website Sauce Demo
    Masukan invalid Username ${userInvalid}
    Masukan Password
    Klik Tombol Login
    User tidak dapat login dan muncul pesan error ${err_msg}
