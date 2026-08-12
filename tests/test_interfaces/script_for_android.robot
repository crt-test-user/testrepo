*** Settings ***
Library             QMobile    configs=${CURDIR}/../resources/config/config_for_android.yaml
Resource            ${CURDIR}/../resources/keywords_for_android.robot
Test Setup          AppState   API Demos Home
Test Teardown       TerminateApp
Suite Teardown      Close All Applications

*** Test Cases ***
Verify Text
    [Documentation]        Verify Text
    AppState               API Demos Home
    VerifyText             Hello! Welcome to lambdatest Sample App called Proverbial

Verify Text on Buttton Click
    [Documentation]        Verify Text on Click
    AppState               API Demos Home
    VerifyText             Hello! Welcome to lambdatest Sample App called Proverbial
    ClickText              Text
    VerifyText             Proverbial
