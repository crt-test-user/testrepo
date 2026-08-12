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

    Run Keyword IF      '${state}'=='API Demos Home'    GoToAPIDemosHomeAndroid
    ...    ELSE         Fail        Unknown App State::${state}
    

GoToAPIDemosHomeAndroid
    VerifyText      App

Install And Open
    [Documentation]         This keyword allows us to install the application from the Play Store.
    ...                     The name of the application is given when calling the keyword. 
    ...                     By default, the application is opened, but using the argument ${open}=False this can be changed
    [Arguments]             ${application}    ${open}=True
    PressKey                home              # Press phone's home button

    # Open Google Play Store
    ActivateApp             app_id=com.android.vending    orientation=PORTRAIT
    Sleep                   1
    Portrait

    # Sometimes there are notifications in the Play Store that you have to accept/reject.    
    ${stay_loop}=           IsText                      Want to stay in the loop?                      timeout=5
    Run Keyword If          ${stay_loop}                ClickText                   No

    VerifyText              Search apps & games         timeout=60

    # In Lambdatest we need to change google account to our own.
    ${google_logged}=       IsText                      ${storeEmail}
    
    IF                      "${provider}"=="lambdatest" and "${google_logged}"=="False"
        ClickItem               Account and settings
        ClickText               Expand account list.
        ClickText               ${storeEmail}      timeout=60
    END

    # Sometimes there are notifications in the Play Store that you have to accept/reject.
    ${appOptimization}=     IsText                      Google is optimizing app installs with your help               timeout=5
    Run Keyword If          ${appOptimization}          ClickText                   Got It

    # Sometimes there are notifications in the Play Store that you have to accept/reject.
    ${additional}=          IsText                      You can choose additional search               timeout=5
    Run Keyword If          ${additional}               ClickText                   No thanks 

    ${terms}=               IsText                      Terms of Service                               timeout=2
    Run Keyword If          ${terms}                    ClickText                   Accept

    ${stay_loop}=           IsText                      Want to stay in the loop?                      timeout=2
    Run Keyword If          ${stay_loop}                ClickText                   No

    # Click the search field in the Play Store
    ClickText               Search apps & games

    # Write wanted application name and press enter key
    WriteText               ${application}
    PressKey                enter

    # Will select first application from the list
    ClickText               ${application}              elem_type=android.view.View                       

    # Start installation by clicking Install -button 
    ClickText                   Install        partial_match=Off
    
    # Sometimes there are notifications in the Play Store that you have to accept/reject.
    ${stay_loop}=           IsText                      Try Google Play                      timeout=2
    Run Keyword If          ${stay_loop}                ClickText                   Not now

    # Verify that installation start
    VerifyText                  Installing     timeout=300

    # Verify that installation finished
    VerifyNoText                Installing     timeout=120

    # By default we are opening application after installation but enduser can set this off by adding variable ${open} to "False".
    # Some applications have "Open" and some "Play" button. Here we check is it open and we act accordingly to open application.
    IF                      ${open}
        ${PlayOrOpen}=      IsText             Open
        IF                  ${PlayOrOpen}
            ClickItem               Open                        timeout=60          partial_match=False
        ELSE
            ClickItem               Play                        timeout=60          partial_match=False
        END
    END

    
    