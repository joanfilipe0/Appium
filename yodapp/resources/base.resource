*** Settings ***

Library    AppiumLibrary

*** Variables ***

${APK_PATH}    ${EXECDIR}/yodapp-beta.apk
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

Get started
    Wait Until Page Contains    ${START}
    Click Text    ${START}

Navigate to 
    [Arguments]    ${menu_text}
    ${menu}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${menu}
    Click Element    ${menu}

    ${menuItem}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]//*[@text="${menu_text}"]
    
    Wait Until Element Is Visible    ${menuItem}
    Click Element    ${menuItem}

Go to item
    [Arguments]    ${item_text}    ${checkpoint}
    Wait Until Page Contains    ${item_text}    5
    Click Text    ${item_text}
    Wait Until Page Contains    ${checkpoint}    5

Close session
    Close Application