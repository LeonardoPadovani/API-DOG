@regression
Feature: Validar feature breeds

  Background: pré condição

    # configurações java
    #* def common = Java.type('utils.Commons')

    # configurar response json 
    #* def get_response_images= read('classpath:response/breeds/get-response-images.json')
     

  @breeds      
  Scenario: Deve retornar um breed com sucesso 

    # GET /breed/{breed}/images
    * def get_CallHelper = call read('classpath:helpers/breeds/breeds-helper.feature@get_images') {p_breed:'beagle'}
    * def getStatusCode = get_CallHelper.getStatusCode
    * def getResponse = get_CallHelper.getResponse
    
    # validações
    Then match getStatusCode == 200
    And match getResponse.status == 'success'
   

