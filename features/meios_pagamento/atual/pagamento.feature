#language: pt
@meio_pagamento
Funcionalidade: Realizando teste nas referentes telas de pagamento dos campos:
  limite do cartao, campo parcelamento, data validade, limite de caractere no campo nome,
  validar cactere especial e validar campo desabilitado caso não preencha cartao corretamente.

#FMDPADT-68 FMDPADT-69 FMDPADT-70 FMDPADT-75
@pagamento_
Esquema do Cenario: Validar funcionalidade do campo: Validade Mês/nome/codigo
  Dado que estou logado com "usuarioGuilhermeTeste"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho os campos do cartao de credito com dados <valor>
  E eu clico no botao "botao_ContinuarPgto"
  Entao valido a mensagem <mensagem> no campo <campo>

  Exemplos:
  |        valor       |              mensagem                |             campo                 |
  |    "mesInvalido"   | "mensagem_mes_pagamento_invalido"    | "label_alerta_mes_invalido"       |
  |   "nomeInvalido"   | "mensagem_limite_nome_invalido"      | "label_limite_nome_invalido"      |
  |  "codigoInvalido"  | "mensagem_codigo_seguranca_invalido" | "label_codigo_seguranca_invalido" |

@ValidarAno
Cenario: Validar funcionalidade do campo: Validade Ano
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  E eu insiro no campo "texto_cartao_credito" o valor "4111111111111111"
  E eu insiro no campo "texto_NomeTitular" o valor "Guilherme Teste"
  E seleciono o "2" valor dentro do combobox "texto_ValMes"
  E eu insiro no campo "texto_Cvv" o valor "534"
  E eu insiro no campo "texto_qtd_parcela" o valor "3"
  Quando eu clico no botao "botao_ConcluirPgto"
  Entao valido a mensagem "mensagem_ano_pagamento_invalido" no campo "label_alerta_ano_invalido"

#FMDPADT-76
@cartao @cb @MultiplosSkuCartao
Cenario: Compra com múltiplos SKUs, entrega normal e cartão Master Card
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho a forma de pagamento "um_cartao_credito_master"
  Entao valido a url de finalizacao da compra

Cenario: Compra com sku, entrega normal e cartão Master Card
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho a forma de pagamento "um_cartao_credito_master"
  Entao valido a url de finalizacao da compra

#FMDPADT-228
@servico
Cenario: Compra com sku serviço, entrega normal e cartão Master Card
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_servico"
  E adiciono o item ao carrinho pelo metodo "normal" e servico "sim"
  Quando preencho a forma de pagamento "um_cartao_credito_master"
  Entao valido a url de finalizacao da compra

#FMDPADT-78 FMDPADT-226
@retira
Esquema do Cenario: Compra sku simples, atraves da tela de detalhe do produto, cartao de credito Master Card/Debito Itau
  Dado que estou logado com "usuarioBlackListBoleto"
  E que acesso um produto com a tag "sku_simples"
  E adiciono o item ao carrinho pelo metodo "retira" e servico "nao"
  Quando preencho a forma de pagamento <forma_pagamento>
  Entao valido a url de finalizacao da compra

  Exemplos:
  |     forma_pagamento        |
  | "um_cartao_credito_master" |
  |   "debito_online_itau"     |


#FMDPADT-224 FMDPADT-225 FMDPADT-227
@CompraSkuSimplesRetira
Esquema do Cenario: Compra com sku simples, endereço retira em loja e cartão de credito/debito itau/boleto
  Dado que estou logado com "usuarioBlackListBoleto"
  E que acesso um produto com a tag "sku_simples"
  E adiciono o item ao carrinho pela forma de entrega "Retira"
  Quando preencho a forma de pagamento <forma_pagamento>
  Entao valido a url de finalizacao da compra

  Exemplos:
  |     forma_pagamento        |
  | "um_cartao_credito_master" |
  |   "debito_online_itau"     |
  |        "boleto"            |

#FMDPADT-74
@validarNumeroDoCredito_CvvDesabi
Cenario: Validar funcionalidade do campo Numero do cartao de credito e campo cvv desabilitado
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho os campos do cartao de credito com dados "cartaoInvalido"
  #E eu clico no botao "botao_ConcluirPgto"
  Entao valido a existencia do elemento "imagem_cartao_invalido"
  E valido o campo "campo_des_cvv" desabilitado

#FMDPADT-73
@dadoValido
Cenario: Validar funcionalidade do campo Nome do titular do Cartao de Credito - dados validos
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho os campos do cartao de credito com dados "dadosValidos"
  E eu clico no botao "botao_ConcluirPgto"
  Entao visualizo a exibicao da mensagem "mensagem_troca_forma_pagamento" no elemento "label_troca_forma_pagamento"

#FMDPADT-71
@validarBotaoPagarDoisCartoes
Cenario: Validar funcionalidade do botao Pagar com dois cartoes
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando eu clico no botao "botao_pagar_dois_cartoes"
  Entao visualizo a exibicao da mensagem "mensagem_pagar_dois_cartoes" no elemento "label_pagar_dois_cartoes"

#FMDPADT-72
@validarCamposObrigatorios
Cenario: Validar funcionalidade campos Obrigatorios
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho os campos do cartao de credito com dados "dadosInvalidos"
  E eu clico no botao "botao_ConcluirPgto"
  Entao visualizo a exibicao da mensagem "mensagem_informe_cartao" no elemento "label_informe_cartao"
  E visualizo a exibicao da mensagem "mensagem_informe_nome" no elemento "label_informe_nome"
  E valido o campo "campo_des_cvv" desabilitado


@validarFechPedidoDebito
Esquema do Cenario: Validar funcionalidade do fechamento do pedido Debitos
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho a forma de pagamento <debito>
  Entao valido o popup <debito>

  Exemplos:
  |         debito          |
  |  "debito_online_itau"   |
  |  "debito_online_visa"   |
  | "debito_online_maestro" |

#FMDPADT-89
@validarCreditoCaracEspe
Cenario:  Validar funcionalidade do campo Nome do titular do Cartao de Credito - Caracter especial
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_sem_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  E seleciono a forma de pagamento "um_cartao_credito_master"
  Quando eu insiro no campo "texto_NomeTitular" o valor "Guilherme @!#@&¨%%Teste"
  Entao valido o texto sem caracter especial "texto_NomeTitular"

######################### SPRINT 7 ############################
#FMDPADT-220
@validarParc
Cenario: Validar funcionalidade do campo Parcelamento
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  E eu insiro no campo "texto_cartao_credito" o valor "4111111111111111"
  E eu clico no botao "texto_qtd_parcela"
  Quando eu insiro no campo "texto_qtd_parcela" o valor "3"
  E clico em "texto_cartao_credito"
  Entao valido a existencia do elemento "imagem_parcela_valida"

#FMDPADT-221
@finalizarDebitoItau
Cenario: Finalizar uma compra com Multiplus SKUs  Entrega Normal, Garantia doze meses  Debito ITAU
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "12_meses" e seguro para "nao"
  E eu clico no botao "botao_ConcluirCompra"
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "12_meses" e seguro para "nao"
  E eu clico no botao "botao_ConcluirCompra"
  E escolho a forma de entrega "normal"
  Quando preencho a forma de pagamento "debito_online_itau"
  Entao valido a url de finalizacao da compra

#FMDPADT-223
@CompraProdutoBoleto
Cenario: Compra com sku garantia, entrega normal e boleto
  Dado que estou logado com "usuarioGuilhermeTeste"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho a forma de pagamento "boleto"
  Entao valido a url de finalizacao da compra

#FMDPADT-222
Cenario: Compra com sku kit, entrega normal e boleto
  Dado que estou logado com "usuarioGuilhermeTeste"
  E que acesso um produto com a tag "kit"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho a forma de pagamento "boleto"
  Entao valido a url de finalizacao da compra

# FMDPADT-229
@AlteracaoSenha
Cenario: Alteracao de senha - Pessoa Fisica
  Dado que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_ConcluirCompra"
  E eu clico no link "link_esqueci_minha_senha_modal"
  E que eu insiro dentro do modal "frame_modal" no campo "texto_Email" o valor "guilermeteste@groove.tech"
  E que eu insiro dentro do modal "frame_modal" no campo "texto_confirmar_email" o valor "guilermeteste@groove.tech"
  Quando eu clico dentro do modal "frame_modal" no botao "botao_confirmar"
  Entao visualizo a exibicao da mensagem "mensagem_esqueci_minha_senha" dentro do modal "frame_modal" no elemento "label_esquci_senha_modal"

#FMDPADT-230
@BoletoCartao
Cenario: Testar finalizacao pedido com Boleto + Cartao
  Dado que estou logado com "usuarioGuilhermeTeste"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho a forma de pagamento "boleto_cartao"
  Entao valido a url de finalizacao da compra

#FMDPADT-231
@ValidarURL
Esquema do Cenario: Validar a geracao da URL com numero do pedido
  Dado que estou logado com "usuarioBlackListBoleto"
  E que acesso um produto com a tag "normal"
  E adiciono o item ao carrinho pela forma de entrega "Normal"
  Quando preencho a forma de pagamento <forma_pagamento>
  Entao valido a url de finalizacao da compra

  Exemplos:
  |     forma_pagamento        |
  | "um_cartao_credito_master" |
  |   "debito_online_itau"     |
  |        "boleto"            |
