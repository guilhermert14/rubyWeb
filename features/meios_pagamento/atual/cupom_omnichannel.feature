#language: pt
@omnichannel
Funcionalidade: Aplicar cupom omnichannel

Funcionalidade: Aplicar desconto no carrinho deslogado
  EU como cliente não logado de Ponto Frio e Casas Bahia
  QUERO digitar um código de cupom omnichannel e visualizar a mensagem solicitando que eu me autentique
  PARA ganhar desconto na compra de certos produtos.

  #TUDO COMENTANDO PELO FATO QUE SÓ FUNCIONA NO AMBIENTE 182 CB

#################################NÃO LOGADO############################
# @CupomOmniValido
# Cenario: Aplicar cupom de desconto valido/ vigente (nao autenticado)
#   Dado que acesso um produto com a tag "normal_sem_garantia"
#   E eu clico no botao "botao_Comprar"
#   Quando eu insiro o cupom "PromoCasasBahia01" no campo "texto_insira_cupom"
#   Entao visualizo a exibicao da mensagem "mensagem_efetuar_login" no elemento "texto_alerta"
#
# @CupomOmniInvalidoVencido
# Esquema do Cenario: Aplicar cupom de desconto invalido/Vencido
#   Dado que acesso um produto com a tag "normal_sem_garantia"
#   E eu clico no botao "botao_Comprar"
#   Quando eu insiro o cupom <cupom> no campo "texto_insira_cupom"
#   Entao visualizo a exibicao da mensagem "mensagem_alerta" no elemento "texto_alerta"
#
#   Exemplos:
#   |      cupom      |
#   | "cupomInvalido" |
#   |  "cupomVencido" |
#
# @CupomVigente
# Cenario: Aplicar cupom de desconto valido/ vigente navegaçao
#   Dado que acesso um produto com a tag "normal_sem_garantia"
#   E eu clico no botao "botao_Comprar"
#   E eu insiro o cupom "PromoCasasBahia01" no campo "texto_insira_cupom"
#   Mas desisto da compra
#   E que acesso um produto com a tag "normal_sem_garantia"
#   E eu clico no botao "botao_Comprar"
#   Quando eu insiro o cupom "PromoCasasBahia01" no campo "texto_insira_cupom"
#   Entao visualizo a exibicao da mensagem "mensagem_efetuar_login" no elemento "texto_alerta"
##########################LOGADO#########################################
# @CupomValido
# Cenario: Validar se o cupom é valido por CPF
#   Dado que estou logado com "usuarioNerso"
#   E que acesso um produto com a tag "cupom_omni"
#   E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
#   E capturo valor no campo "label_cupom"
#   Quando eu insiro o cupom "PromoCasasBahia02" no campo "texto_insira_cupom"
#   Entao valido o valor total no campo "label_cupom"
#
# @CupomInvalido
# Cenario: Validar se o cupom é invalido por CPF
#   Dado que estou logado com "usuarioCupomOmni"
#   E que acesso um produto com a tag "cupom_omni"
#   E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
#   Quando eu insiro o cupom "PromoCasasBahia027" no campo "texto_insira_cupom"
#   Entao visualizo a exibicao da mensagem "mensagem_alerta" no elemento "texto_alerta"


# @CupomValido
# Cenario: Validar cupom omnichannel valido para SKU legivel
#   Dado que estou logado com "usuarioNerso"
#   E que acesso um produto com a tag "cupom_omni"
#   E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
#   E capturo valor no campo "label_cupom"
#   Quando eu insiro o cupom "PromoCasasBahia02" no campo "texto_insira_cupom"
#   Entao valido o valor total no campo "label_cupom"
#
# @CupomNormal
# Esquema do Cenario: Validar cupom normal
#   Dado que estou logado com "usuarioNerso"
#   E que acesso um produto com a tag "normal_com_garantia"
#   E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
#   E capturo valor no campo "label_cupom"
#   Quando eu insiro o cupom <cupom> no campo "texto_insira_cupom"
#   Entao valido o valor total no campo "label_cupom"
#
#   Exemplos:
#   |    cupom     |
#   | "TESTEQA10"  |
#   | "TESTEQAP10" |
#
# @FormasAlternativas
# Esquema do Cenario: Validar cupom omnichannel valido/invalido para SKU legivel/elegivel
#   Dado que estou logado com "usuarioNerso"
#   E que acesso um produto com a tag <produto>
#   E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
#   Quando eu insiro o cupom <cupom> no campo "texto_insira_cupom"
#   Entao visualizo a exibicao da mensagem "mensagem_alerta" no elemento "texto_alerta"
#
#   Exemplos:
#    |         produto       |        cupom         |
#    |      "cupom_omni"     | "PromoCasasBahia027" |
#    | "normal_com_garantia" |  "PromoCasasBahia02" |
#
# @CupomDuplicado
# Cenario: Validar se o cupom pode ser aplicado duas vezes
#   Dado que estou logado com "usuarioNerso"
#   E que acesso um produto com a tag "cupom_omni"
#   E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
#   E eu insiro o cupom "PromoCasasBahia02" no campo "texto_insira_cupom"
#   E capturo valor no campo "label_cupom"
#   Quando eu insiro o cupom "PromoCasasBahia02" no campo "texto_insira_cupom"
#   Entao valido o valor total no campo "label_cupom"

# #FMDPCR-130
# Cenario: Validar boleto não pago, reativar cupom
#
# # FMDPCR-116
# Cenário: validar cupom via botao no front
#
# Cenario: Validar REV offline - mocado
# site, mobile, televendas, navegadores
# CB, PF
#
# # FMDPCR-117
# Cenario: validar via banco e postman status do cupom
# gerar nf Fake
# site, mobile, televendas, navegadores
# CB, PF
#
# # FMDPCR-118
# Cenário: Validar via serviço, postman
