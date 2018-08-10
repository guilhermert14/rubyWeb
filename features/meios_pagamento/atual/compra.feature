#language: pt
#encode: UTF-8
@meio_pagamento
Funcionalidade: Realizar um fluxo de compra na opcao de entrega agendada.
  Eu como user cadastrado, pretendo relizar uma compra com um unico produto no carrinho, utilizando aS opcoes de
  entrega agendada, expressa e normal, havendo garantia ou nao e realizar login durante a compra.

  Contexto:
  Dado que estou logado com "usuarioBlackListBoleto"
@ref2 @regressivo
  Esquema do Cenario: Realizar a compra de um kit sku com opcao de entrega agendada, todas as formas de pagamento e sem seguro.
    E que acesso um produto com a tag "kit"
    E adiciono o item ao carrinho pelo metodo <tipo_entrega> e servico "nao"
    Quando preencho a forma de pagamento <tipo_pagamento>
    Entao valido a url de finalizacao da compra
Exemplos:
  |    tipo_pagamento                | tipo_entrega |
  |   "um_cartao_credito_master"     |  "agendada"  |
  | "dois_cartoes_credito_master"    |  "agendada"  |
  |       "boleto"                   |  "agendada"  |
  |   "debito_online_itau"           |  "agendada"  |
  |   "debito_online_visa"           |  "agendada"  |
  |   "debito_online_maestro"        |  "agendada"  |
  |       "boleto"                   |   "normal"   |

@regressivo
  Esquema do Cenario: Realizar a compra de um kit sku com opcao de entrega expressa, todas as formas de pagamento e variação de servico.
    E que acesso um produto com a tag "normal_com_garantia"
    E adiciono o item ao carrinho pelo metodo <tipo_entrega> e servico <tipo_servico>
    Quando preencho a forma de pagamento <tipo_pagamento>
    Entao valido a url de finalizacao da compra
Exemplos:
    |     tipo_pagamento            |     tipo_entrega      |   tipo_servico |    msgs    |
    |   "um_cartao_credito_master"  |  "expressa_garantia"  |   "garantia"   | "12_meses" |
    | "dois_cartoes_credito_master" |  "expressa_garantia"  |   "garantia"   | "24_meses" |
    |       "boleto"                |  "expressa_garantia"  |   "garantia"   | "36_meses" |
    |  "debito_online_itau"         |  "expressa_garantia"  |   "garantia"   | "12_meses" |

@regressivo
  Esquema do Cenario: Realizar a compra de um kit sku com opcao de entrega normal, todas as formas de pagamento e variação de servico.
    E que acesso um produto com a tag "normal_com_garantia"
    E adiciono o item ao carrinho pelo metodo <tipo_entrega> e servico <tipo_servico>
    Quando preencho a forma de pagamento <tipo_pagamento>
    Entao valido a url de finalizacao da compra
Exemplos:
    |     tipo_pagamento            |      tipo_entrega     |   tipo_servico |    msgs    |
    |   "um_cartao_credito_master"  |    "normal_servico"   |   "garantia"   | "12_meses" |
    | "dois_cartoes_credito_master" |    "normal_servico"   |   "garantia"   | "24_meses" |
    |       "boleto"                |    "normal_servico"   |   "garantia"   | "36_meses" |
    |  "debito_online_itau"         |    "normal_servico"   |   "garantia"   | "12_meses" |
    |  "debito_online_itau"         |  "agendada_garantia"  |   "garantia"   | "12_meses" |
    |  "debito_online_visa"         |  "agendada_garantia"  |   "garantia"   | "12_meses" |
    |       "boleto"                |  "agendada_garantia"  |   "garantia"   | "36_meses" |


#  Eu como user, pretendo logar o meu usuario cadastrado ao decorrer do fluxo de compra, optando por diversas
# formas de entrega e havendo ou nao garantia.
@regressivo
Esquema do Cenario: Realizar a compra de um sku, efetuando o login ao decorrer do fluxo de compra, sem opcao de garantia e optando pela forma de pagamento no cartao de credito.
  E que acesso um produto com a tag <item>
  E adiciono o item ao carrinho pelo metodo <tipo_entrega> e servico <meses>
  Quando preencho a forma de pagamento <tipo_pagamento>
  Entao valido a url de finalizacao da compra

Exemplos:
  |         item          |       tipo_entrega          | tipo_servico |   meses    |    tipo_pagamento           |
  | "normal_sem_garantia" |      "normal_login"         |  "garantia"  |   "nao"    |       "boleto"              |
  | "normal_com_garantia" |   "normal_login_garantia"   |  "garantia"  | "12_meses" |  "um_cartao_credito_master" |
  | "normal_com_garantia" |   "normal_login_garantia"   |  "garantia"  | "12_meses" |  "debito_online_itau"       |
