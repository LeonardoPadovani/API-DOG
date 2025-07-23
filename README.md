Para rodar os testes localmente, abra o terminal na raiz do projeto e dite os seguintes comandos:

para rodar todos os testes:
  mvn test 

para rodar os testes escolhendo o ambiente(dev ou hml) e uma tag específica de teste (regression,smoke,breeds):
mvn test -Dkarate.env='hml' -Dkarate.options="--tags @regression"

no arquivo karate-config.js estão as variaveis de ambiente configuradas. por default o teste roda em DEV. Configurei apenas com o intuito de mostrar como o karate funciona, pois nao temos um ambiente de dev e hml para essa api de teste.

Para exibir o relatorio o final dos testes, vá até a pasta \target\cucumber-html-reports e abra o arquivo overview-features.html no browser.

Estrutura do projeto:
É estruturado em java e é configurado no arquivo pom.xml

há um arquivo pipeline.CI.yml que contém as tasks para rodar a pipe no github actions.Após o teste é gerado um arquivo zipado com o relatorio.

FEATURES:
 helpers (helpers\breeds): onde configuro as chamadas para a api de acordo com o recurso, o qual é o breed.Utilizo as tags para montar as chamados de acordo com os métodos e parametros. 

 Features de teste (features\breeds):
 Onde sao chamadas as tags localizadas no arquivo helper e os testes de fato são executados junto com as validações. Assim é possivel reaproveitar as chamadas da helper que ficam em um unico lugar do projeto.# API-DOG
API para caes
