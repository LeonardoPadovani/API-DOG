@regression @smoke
Feature: Validar feature breeds

  Background: pré condição

    
  @breeds      
  Scenario: Deve retornar uma lista de raças com sucesso 

    # GET /breeds/list/all
    * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_list_all') 
    * def getStatusCode = get_CallHelper.getStatusCode
    * def getResponse = get_CallHelper.getResponse
    
    # validações
    Then match getStatusCode == 200
    And match getResponse.status == 'success'
    And match getResponse.message.australian[*] contains 'kelpie'
    And match getResponse.message.australian[*] contains 'shepherd'
   

  @breeds      
  Scenario: Deve retornar uma imagem da raça beagle com sucesso 

    # GET /breed/{breed}/images
    * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_images') {p_breed:'beagle'}
    * def getStatusCode = get_CallHelper.getStatusCode
    * def getResponse = get_CallHelper.getResponse
    
    # validações
    Then match getStatusCode == 200
    And match getResponse.message contains 'beagle'

   
  @breeds      
  Scenario: Deve retornar uma imagem randomica de uma raça com sucesso 

    # GET /breeds/image/random
    * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_image_random') 
    * def getStatusCode = get_CallHelper.getStatusCode
    * def getResponse = get_CallHelper.getResponse
    
    # validações
    Then match getStatusCode == 200
    And match getResponse == { message: '#string', status: 'success' }
    And match getResponse.message contains 'https://images.dog.ceo/'
    And match getResponse.status == 'success'
   
   
  @breeds      
  Scenario: Verificar se a URL contem .jpg ao gerar uma imagem randomica 

    # GET /breeds/image/random
    * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_image_random') 
    * def getStatusCode = get_CallHelper.getStatusCode
    * def getResponse = get_CallHelper.getResponse
    
    # validações
    Then match getStatusCode == 200
    And match getResponse.message contains '.jpg' 

  
  @breeds
  Scenario: Verificar aleatoriedade de imagens da raça boxer com sucesso

    # Primeira chamada
    * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_images') { p_breed: 'boxer' }
    * def getResponse = get_CallHelper.getResponse
    * def imagem_01 = getResponse.message

     # Segunda chamada
     * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_images') { p_breed: 'boxer' }
     * def getResponse = get_CallHelper.getResponse
     * def imagem_02 = getResponse.message

     # Verificação
     * assert imagem_01 != imagem_02
    
    


