Feature: Testes no Zello
    Eu, como um usuario
    Desejo criar um quadro

  Scenario: Criar um quadro no Zello
    Given que Estou na página inicial do Zello
    When Crio um novo quadro com o nome "Meu Quadro"
    Then Vejo o quadro "Meu Quadro" criado com sucesso
