*** Variables ***
${First_Run}              ${True}


*** Keywords ***
Open Mobile App
    OpenApp
    Set Suite Variable  ${First_Run}   ${False}

AppState
    [Arguments]         ${state}
    Run Keyword IF      ${First_Run}==${True}         Open Mobile App
    ...    ELSE         ActivateApp

    Run Keyword IF      '${state}'=='API Demos Home IOS'    GoToAPIDemosHomeIOS
    ...    ELSE         Fail        Unknown App State::${state}
    

GoToAPIDemosHomeIOS
    VerifyText      Proverbial