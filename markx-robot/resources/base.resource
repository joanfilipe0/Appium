*** Settings ***
Documentation    Tudo Deve Começar nesse Arquivo

Library    AppiumLibrary
Library    BuiltIn
Library    Collections

Resource    screens/login.resource
Resource    screens/tasks.resource

*** Variables ***

${APK_PATH}    ${EXECDIR}/apps/markx.apk

${START}    QAX

*** Keywords ***
Start session
    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    deviceName=Android Emulator
    ...    automationName=UIAutomator2
    ...    app=${APK_PATH}
    ...    udid=emulator-5554
    ...    autoGrantPermission=true

Finish session
    Capture Page Screenshot
    Close Application

