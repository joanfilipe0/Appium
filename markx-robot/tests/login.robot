*** Settings ***
Documentation    Testes de Login

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Deve logar com Sucesso
    Do Login
 

    

    