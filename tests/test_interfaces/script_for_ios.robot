*** Settings ***
Library             QMobile    configs=${CURDIR}/../resources/config/config_for_ios.yaml
Resource            ${CURDIR}/../resources/keywords_for_ios.robot
Test Setup          AppState  API Demos Home IOS
Test Teardown       TerminateApp
Suite Teardown      CloseAllApplications


*** Test Cases ***
Verify Text in TextView
    [Documentation]         Open App and verify the text
    [Tags]                  VerifyText
    AppState                API Demos Home IOS
    VerifyText              Hello! Welcome to lambdatest Sample App called Proverbial

Verify Text on Buttton Click
    [Documentation]        Verify Text on Click
    AppState               API Demos Home IOS
    VerifyText             Hello! Welcome to lambdatest Sample App called Proverbial
    ClickText              Text
    VerifyText             Proverbial
