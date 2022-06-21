*** Settings ***
Library                             SeleniumLibrary
Suite Setup                         Open Browser                    ${base_url}             ${browser_type}
Suite Teardown                      Close Browser

*** Variables ***
${base_url}                         https://pub-eish-dev.keponet.com/frontend/login
${browser_type}                     chrome
${email_user}                       jenareishsatu@yopmail.com
${password_user}                    12345678
${invalid_email}                    cobaaja@gmail.com
${invalid_password}                 87654321

*** Test Cases ***
Maximize Browser
    Maximize Browser Window

Login with valid user
    Input Text                      //input[@id="email"]            ${email_user}
    Textfield Value Should Be       //input[@id="email"]            ${email_user}
    Sleep                           1s
    Input Password                  //input[@id="password"]         ${password_user}
    Textfield Value Should Be       //input[@id="password"]         ${password_user}
    Sleep                           1s
    Click Element                   //button[@type="submit"]
    Sleep                           1s
    Element Should Be Visible       //a[@id="account-button"]
    Sleep                           2s

Logout account
    Click Element                   //a[@id="account-button"]
    Element Should Be Visible       //li[@class="has-icon icon-logout"]
    Sleep                           2s
    Click Element                   //li[@class="has-icon icon-logout"]
    Sleep                           2s
    Element Should Be Visible       //div[@id="login-box"]
    Sleep                           2s

Login with invalid email
    Input Text                      //input[@id="email"]            ${invalid_email}
    Textfield Value Should Be       //input[@id="email"]            ${invalid_email}
    Sleep                           1s
    Input Password                  //input[@id="password"]         ${password_user}
    Textfield Value Should Be       //input[@id="password"]         ${password_user}
    Sleep                           1s
    Click Element                   //button[@type="submit"]
    Sleep                           1s
    Element Should Be Visible       //input[@class="form-control is-invalid"]
    Sleep                           2s

Login with invalid password
    Reload Page
    Sleep                           2s
    Input Text                      //input[@id="email"]            ${email_user}
    Textfield Value Should Be       //input[@id="email"]            ${email_user}
    Sleep                           1s
    Input Password                  //input[@id="password"]         ${invalid_password}
    Textfield Value Should Be       //input[@id="password"]         ${invalid_password}
    Sleep                           1s
    Click Element                   //button[@type="submit"]
    Sleep                           1s
    Element Should Be Visible       //div[@class="alert alert-danger text-danger"]
    Sleep                           2s

Login with all empty 
    Reload Page
    Sleep                           2s
    Click Element                   //button[@type="submit"]
    Sleep                           1s
    Element Should Be Focused       //input[@id="email"]
    Sleep                           2s

Login with password empty 
    Reload Page
    Sleep                           2s
    Input Text                      //input[@id="email"]                ${email_user}
    Textfield Value Should Be       //input[@id="email"]                ${email_user}
    Sleep                           1s
    Click Element                   //button[@type="submit"]
    Sleep                           1s
    Element Should Be Focused       //input[@id="password"]
    Sleep                           2s

Form forget password
    Reload Page
    Sleep                           2s
    Click Element                   //a[@href="https://pub-eish-dev.keponet.com/frontend/recover-password"]
    Element Should Be Visible       //div[@id="register-content"]
    Sleep                           1s
    #input with invalid user, because valid user still used by another test
    Input Text                      //input[@id="email"]                ${invalid_email}
    Textfield Value Should Be       //input[@id="email"]                ${invalid_email}
    Sleep                           1s
    Click Element                   //button[@type="submit"]
    Sleep                           1s
    Element Should Be Visible       //span[@class="invalid-feedback"]
    Sleep                           2s
    Go To                           ${base_url}
    Element Should Be Visible       //div[@id="login-box"]
    Sleep                           2s

Register new user
    Click Element                   //a[@href="https://pub-eish-dev.keponet.com/frontend/register"]
    Element Should Be Visible       //div[@id="register-content"]
    Sleep                           2s
    Select From List By Label       //select[@id="tu_id"]                   Badan Hukum
    List Selection Should Be        //select[@id="tu_id"]                   Badan Hukum
    Sleep                           1s
    Input Text                      //input[@id="nik"]                      10101010101010
    Textfield Value Should Be       //input[@id="nik"]                      10101010101010
    Sleep                           1s
    Input Text                      //input[@id="nama"]                     Andi
    Textfield Value Should Be       //input[@id="nama"]                     Andi
    Sleep                           1s
    Click Element                   //input[@id="tanggal_lahir"]
    Element Should Be Visible       //div[@class="datepicker-days"]
    Sleep                           1s
    Input Text                      //input[@id="tanggal_lahir"]            16/06/2001
    Textfield Value Should Be       //input[@id="tanggal_lahir"]            16/06/2001
    Sleep                           1s
    Click Element                   //select[@id="jenis_kelamin"]
    Element Should Not Be Visible   //div[@class="datepicker-days"]
    Sleep                           1s
    Select From List By Label       //select[@id="jenis_kelamin"]           Laki-laki
    List Selection Should Be        //select[@id="jenis_kelamin"]           Laki-laki
    Sleep                           1s
    Input Text                      //input[@id="telephone"]                0987654
    Textfield Value Should Be       //input[@id="telephone"]                0987654
    Sleep                           1s
    Select From List By Label       //select[@id="pol_id"]                  Polda Jawa Tengah
    List Selection Should Be        //select[@id="pol_id"]                  Polda Jawa Tengah
    Sleep                           1s
    Input Text                      //input[@id="email"]                    cobalagi@gmail.com
    Textfield Value Should Be       //input[@id="email"]                    cobalagi@gmail.com
    Sleep                           1s
    Input Password                  //input[@id="password"]                 11111111
    Textfield Value Should Be       //input[@id="password"]                 11111111
    Sleep                           1s
    Input Password                  //input[@id="password-confirm"]         11111111
    Textfield Value Should Be       //input[@id="password-confirm"]         11111111
    Sleep                           1s
    #no need to click Daftar, because will fill real account
    # Click Element                   //button[@class="btn btn-primary"]    
    Sleep                           2s
    
    
    



                  