*** Settings ***
Documentation    Suítes de Testes de Cadastros de tarefas

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Deve cadastrar uma nova tarefa
    
    # Dado que o usuário está logado
    Do Login
    
    # E uma tarefa com um nome aleatório é criada
    ${randomNumber}    Evaluate    random.randint(10000, 99999)    modules=random
    ${taskName}    Set Variable    Teste Create ${randomNumber}

    # Quando o usuário cria uma nova tarefa com o nome gerado
    Create a new Task    ${taskName}
    
    # Então a tarefa deve ter o nome correspondente
    Should Have Task Name    ${taskName}

Deve remover uma tarefa indesejada
    [Tags]    remove
    
    # Dado que o usuário está logado
    Do Login
    
    # E uma tarefa com um nome aleatório é criada
    ${randomNumber}    Evaluate    random.randint(10000, 99999)    modules=random
    ${taskName}    Set Variable    Teste Delete ${randomNumber}
    
    # Quando o usuário cria uma nova tarefa com o nome gerado
    Create a new Task    ${taskName}
    
    # E o usuário solicita a exclusão da tarefa com o nome correspondente
    Should Have Task Name    ${taskName}
    Delete Task Have Name    ${taskName}     

    # Então a tarefa não deve mais estar presente na tela
    Wait Until Page Does Not Contain    ${taskName}

Deve concluir uma tarefa
    [Tags]    finish
    
    # Dado que o usuário está logado
    Do Login
    
    # E uma tarefa com um nome aleatório é criada
    ${randomNumber}    Evaluate    random.randint(10000, 99999)    modules=random
    ${taskName}    Set Variable    Teste Finish ${randomNumber}
    
    # Quando o usuário cria uma nova tarefa com o nome gerado
    Create a new Task    ${taskName}
    
    # E o usuário solicita a exclusão da tarefa com o nome correspondente
    Should Have Task Name    ${taskName}
    Finish Task Have Name    ${taskName}     

    # Então a tarefa deve mais estar marcada na tela
    Task Should be Done    ${taskName}
    