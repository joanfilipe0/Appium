*** Settings ***

Library    AppiumLibrary

*** Variables ***

${APK_PATH}    ${EXECDIR}/yodapp-beta.apk
${START}    QAX

*** Test Cases ***

Deve realizar um clique simples

    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    deviceName=Android Emulator
    ...    automationName=UIAutomator2
    ...    app=${APK_PATH}
    ...    udid=emulator-5554
    ...    autoGrantPermission=true

    Wait Until Page Contains    ${START}
    Click Text    ${START}

    ${menu}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${menu}
    Click Element    ${menu}

    ${menuItem}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]//*[@text="Clique em Botões"]
    
    Wait Until Element Is Visible    ${menuItem}
    Click Element    ${menuItem}

    Sleep    5

    Close Application