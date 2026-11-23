# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Library                         QForce
Resource                        keywords.robot
Suite Setup                      Open Browser        about:blank    chrome
Suite Teardown                  CloseAllBrowsers
            

*** Test Cases ***
Test
