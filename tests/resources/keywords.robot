*** Settings ***
Library                         QForce

*** Variables ***
${BROWSER}                      chrome

*** Keywords ***
Login to SF
    [Documentation]             Login to Salesforce instance.
    [Arguments]                 ${BROWSER}
    Set Library Search Order    QForce                      QWeb
    Open Browser                about:blank                 ${BROWSER}
    GoTo                        ${login_url}
    TypeText                    Username                    ${SF_USERNAME_RECORDER}     delay=1
    TypeSecret                  Password                    ${SF_PASSWORD_RECORDER}
    ClickText                   Log In
    ${OTP}                      GetOTP                      ${SF_USERNAME_RECORDER}     ${SF_MFA_SECRET_RECORDER}
    TypeText                    Verification Code           ${OTP}
    ClickText                   Verify