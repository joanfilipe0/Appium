*** Settings ***

Library    AppiumLibrary

*** Variables ***

${APK_PATH}    ${EXECDIR}/yodapp-beta.apk

*** Test Cases ***

Deve abir a tela principal

    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    deviceName=Android Emulator
    ...    automationName=UIAutomator2
    ...    app=${APK_PATH}
    ...    udid=emulator-5554
    ...    autoGrantPermission=true

    Wait Until Page Contains    Yodapp
    Wait Until Page Contains    Mobile Training
    Wait Until Page Contains    by Papito

    Close Application