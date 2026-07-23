# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Library                         QForce
Resource                        keywords.robot
Suite Setup                     Login to SF    chrome
Suite Teardown                  CloseAllBrowsers
            

*** Test Cases ***
Test
