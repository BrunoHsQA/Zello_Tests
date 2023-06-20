*** Settings ***
Resource    ./zello.resource
Test Setup    Abrir navegador
Test Teardown    Close Browser

    
*** Test Cases ***
Testes no zello
    Criando um quadro no zello

    Criando 5 quadros no zello
    
    Adicionando um card no zello

    Cirando um card no quadro novo
    