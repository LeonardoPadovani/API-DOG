function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {

   

  }

  if (env == 'dev') {

        config.base_url = 'https://dog.ceo/api'

  } else if (env == 'hml') {
    
        config.base_url = 'https://dog.ceo/api'
    
  }
  return config;
}