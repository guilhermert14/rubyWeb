# require 'rest-client'
# require 'json-schema'
# require 'pry'
#
# url = "https://carrinho.casasbahia.com.br/Api/checkout/Cliente.svc/Cliente/Login"
# api = RestClient.post(url, {"clienteLogin":{"Token":"2c85d8e0bba44ac7b5b1edd5cf679032",
#                               "Operador":"","IdUnidadeNegocio":8,"PalavraCaptcha":"",
#                               "Senha":"teste2018","cadastro":"on","Email":"a@groove.tech"},
#                               "mesclarCarrinho":true,"Token":"2c85d8e0bba44ac7b5b1edd5cf679032","IdUnidadeNegocio":8,
#                               "Operador":""}.to_json, {content_type: :json})
# json = JSON.parse(api)
# if json['EfetuarLoginResult']['Erro'] != true
#   p "Login efetuado com sucesso para o usuario:" + json['EfetuarLoginResult']['Apelido']
# else
#   raise "Login não efetuado, motivo:" + json['EfetuarLoginResult']['Mensagens'][0]
# end
