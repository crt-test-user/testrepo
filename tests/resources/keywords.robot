*** Settings ***
Library                         QForce

*** Variables ***
${BROWSER}                      chrome
${SF_Url}                       https://login.salesforce.com/
*** Keywords ***
Login to SF
    [Documentation]             Login to Salesforce instance.
    #[Arguments]                 ${BROWSER}
    Set Library Search Order    QForce                      QWeb
   # Open Browser                about:blank                 ${BROWSER}
    GoTo                        https://login.salesforce.com/
    VerifyText                  Log In with Email
    ClickText                   Log In with Username
    TypeText                    Username                    ${SF_USERNAME_RECORDER}     delay=1
    ClickText                   Log In
    Sleep                       2s
    TypeSecret                  Password                    ${SF_PASSWORD_RECORDER}
    ClickText                   Log In
    ${OTP}                      GetOTP                      ${SF_USERNAME_RECORDER}     ${SF_MFA_SECRET_RECORDER}
    TypeText                    Verification Code           ${OTP}
    ClickText                   Verify
    VerifyText                  Quarterly Performanc        timeout=30s
