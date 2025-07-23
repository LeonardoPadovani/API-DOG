@regression @smoke
Feature: Validar feature breeds

  Background: pré condição

   

  @breeds      
  Scenario: Deve retornar erro ao pesquisar uma imagem inexistente

    # GET /breed/{breed}/images
    * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_images') {p_breed:'ZZZZZZZ'}
    * def getStatusCode = get_CallHelper.getStatusCode
    * def getResponse = get_CallHelper.getResponse
    
    # validações
    Then match getStatusCode == 404
    And match getResponse == {"status":"error","message":"Breed not found (master breed does not exist)","code":404}
      
  @breeds
  Scenario: Enviar POST ao invés de GET ao pesquisar uma imagem

    # POST /breed/{breed}/images
    * def post_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@post_image_random') {p_breed:'beagle'}
    * def getStatusCode = post_CallHelper.getStatusCode
    * def getResponse = post_CallHelper.getResponse
    
    # validações
    Then match getStatusCode == 405
    And match getResponse == {"status":"error","message":"No route found for \"POST http:\/\/dog.ceo\/api\/breeds\/image\/random\": Method Not Allowed (Allow: GET, HEAD) with code: 0","code":405}
      
   


