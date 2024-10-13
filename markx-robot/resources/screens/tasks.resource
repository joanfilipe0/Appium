*** Settings ***
Documentation    Elementos e Ações da Tela de Login

Library    AppiumLibrary

*** Variables ***

${inputTarefa}    xpath=//*[@text="Informe a sua nova tarefa"]
${buttonCreateTask}    xpath=//*[@resource-id="createTask"]

*** Keywords ***
Create a new Task
    [Arguments]    ${taskName}
    Wait Until Element Is Visible   ${inputTarefa} 
    Input Text    ${inputTarefa}     ${taskName}
    Click Element    ${buttonCreateTask}    

Should Have Task Name
    [Arguments]    ${taskName}
    Wait Until Element Is Visible
    ...    //*[@resource-id="taskText"][@text="${taskName}"]
    ...    5

Delete Task Have Name
    [Arguments]    ${taskName}
    ${deleteConfirm}    Set Variable    //*[@resource-id="android:id/button2"]

    Click Element    //*[@resource-id="taskText"][@text="${taskName}"]/../..//*[@resource-id="removeTask"]    #Buscando o item pai antes de procurar a lixeira
    Wait Until Element Is Visible    ${deleteConfirm}    5    
    Click Element    ${deleteConfirm}    #Botão de Confirmar Exclusão

Finish Task Have Name
    [Arguments]    ${taskName}
    
    Click Element    xpath=//*[@resource-id="taskText"][@text="${taskName}"]/../..//*[@resource-id="updateTask"]    #Buscando o item pai antes de procurar a marcação
    
  
Task Should be Done
    [Arguments]    ${taskName}
    
    Wait Until Element Is Visible    xpath=//*[@resource-id="taskText"][@text="${taskName}"]/..//android.widget.ImageView    5    #Validando a imagem de Ok dentro do botão de marcação

