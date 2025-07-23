Feature:breeds

Background: pre-condicao
  
  * url base_url 
 
@get_list_all 
Scenario: GET 
 
  Given path '/breeds/list/all' 
  When method GET

  * def getStatusCode = responseStatus
  * def getResponse = response
  
@get_images
Scenario: POST 

  Given path '/breed/' + p_breed + '/images/random' 
  When method GET

  * def getStatusCode = responseStatus
  * def getResponse = response


@get_image_random
Scenario: Enviar um GET 

    Given path '/breeds/image/random
    When method GET
    
    * def getStatusCode = responseStatus
    * def getResponse = response
