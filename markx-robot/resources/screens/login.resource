*** Settings ***
Documentation    Elementos e Ações da Tela de Login

Library    AppiumLibrary

*** Variables ***

${APK_IP}    192.168.1.12

*** Keywords ***
Do Login
    Wait Until Page Contains    Endereço IP da Api    10
    Input Text    xPath=//*[@resource-id="apiIp"]    ${APK_IP}
    Click Element    xPath=//*[@resource-id="signInButton"]
    Wait Until Page Contains    Minhas tarefas    5