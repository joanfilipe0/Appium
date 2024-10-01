*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve Escolher o Nível Jedi

    Start session
    Get started
    Navigate to    Formulários
    Go to item     Cadastro    Crie sua conta.

    Click Element    com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible    class=android.widget.ListView
    Click Text    Jedi
    
    Close session

