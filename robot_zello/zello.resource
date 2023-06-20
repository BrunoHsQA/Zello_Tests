*** Settings ***
Library    SeleniumLibrary


*** variables *** 
${SITE}               http://127.0.0.1:5500/zello.html#!/
${BROWSER}            Chrome

#keywords na pagina inicial
${Create-Board}       xpath=//div[7]
${DESCRIPTION}          tag=input
${TEXT}              Teste
${BUTTON-SAVE-BOARD}         css=.Button


#keywords nos quadros
${BACK-BOARDS}        xpath=//*[@id="trello-app"]/nav/div[1]
${ADD-LIST}            tag=h3
${LIST-DESCRIPTION}    xpath=//*[@id="trello-app"]/div//div[3]//input
${BUTTON-SAVE-CARD}        xpath=//*[@id="trello-app"]//div[2]/div[3]/div//button
${BOARD-LIFE}        xpath=//*/div[2]/div[2]/div[1]
${ADD-CARD}          XPATH=//*[@id="0"]/h5
${CARD-TEXT}        xpath=//*[@id="0"]/textarea
${BUTTON-ADD-CARD}        xpath=//*[@id="0"]//button


*** Keywords ***
Abrir navegador
    Open Browser    ${SITE}    ${BROWSER}
    Maximize Browser Window

Esperar os elementos carregarem
    Sleep    5



Criando um quadro no zello
    
    Esperar os elementos carregarem
    Click Element    ${Create-Board}
    Input Text       ${DESCRIPTION}   Test1
    Click Button     ${BUTTON-SAVE-BOARD}

Repetindo 5 vezes
   
    Input Text      ${DESCRIPTION}    ${TEXT}
    Click Button    ${BUTTON-SAVE-BOARD} 
    
Criando 5 quadros no zello
  Repeat Keyword     5   Repetindo 5 vezes 
  sleep             2

Adicionando um card no zello
    Click Element                    ${BOARD-LIFE}
    Wait Until Element Is Visible    ${ADD-CARD}
    Click Element                    ${ADD-CARD}
    Input Text                       ${CARD-TEXT}    ${TEXT}
    Click Element                    ${BUTTON-ADD-CARD}
    Wait Until Element Is Visible    ${BACK-BOARDS}
    Click Element                    ${BACK-BOARDS}

Cirando um card no quadro novo
    Click Element     ${Create-Board}
    Sleep    1
    Click Element     ${ADD-LIST}
    Input Text        ${LIST-DESCRIPTION}    testando
    Click Element     ${BUTTON-SAVE-CARD}
    Wait Until Element Is Visible    ${ADD-CARD}
    Click Element     ${ADD-CARD}
    Input Text        ${CARD-TEXT}    testando1
    Click Element    ${BUTTON-ADD-CARD}
    Sleep    3
    Close Browser

   
    