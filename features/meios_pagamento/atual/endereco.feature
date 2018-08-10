#language: pt
@meio_pagamento
Funcionalidade: Validacees referentes a tela do Endereço

Contexto:
  Dado que estou logado com "usuarioGuilhermeTeste"

#28/03 - FMDPADT-129
@link_endereco @hr
Cenario: Validar funcionalidade do hiperlink Editar
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "12_meses" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  Quando eu clico no link "link_editar_endereco"
  Entao valido a existencia do elemento "label_tipo_endereco"


#28/03 - FMDPADT-130
@resumo_compra @hr
Cenario: Validar exibicao Resumo da compra
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  Quando eu clico no link "link_editar_endereco"
  Entao valido a mensagem "mensagem_resumo_compra" no campo "campo_resumo_compra"

#29/03 - FMDPADT-131
@validaOpcoesEntrega @hr
Cenario: Validar exibicao Opcoes de entrega
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  Quando eu clico no botao "botao_concluir_compra"
  Entao valido a mensagem "mensagem_opcoes_entrega" no campo "label_opcoes_entrega"

# 02/04 - FMDPADT-133
@cadastrarEndereco @hr
Cenario: Validar funcionalidade do botão Cadastrar um novo endereco
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  Quando eu clico no botao "botao_cadastrar_endereco"
  Entao valido a existencia do elemento "identificao_end"

#02/04 - FMDPADT-134
@validarTipoEndereco @hr
Cenario: Validar funcionalidade do campo Tipo de endereco - Combobox
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  Quando seleciono o "2" valor dentro do combobox "combobox_tipo_endereco"
  Entao valido a mensagem "mensagem_tipo_endereco" no campo "combobox_tipo_endereco"

#03/04
#Endereco - FMDPADT-135 |||| #CEP - FMDPADT-136
#Numero - FMDPADT-137 |||| #Ponto de referencia -FMDPADT-138
@validarIdentEndereco @hr
Esquema do Cenario: Validar funcionalidade do campos do Endereco/CEP/Numero/Ponto de referencia - Limite de dados
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  Quando eu insiro no campo <campo> o valor <valor>
  Entao valido a existencia de somente <qtd> caracteres no campo <campo>

  Exemplos:
  |               campo               |                                valor                                |  qtd |
  |       "campo_ident_endereco"      |     "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbb"     | "50" |
  |        "campo_cep_endereco"       |                             "123456789123"                          |  "8" |
  | "campo_ponto_referencia_endereco" | "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbb" | "59" |
  |           "numero_casa"           |                              "123456789"                            | "6"  |

#03/04
#Endereco - FMDPADT-142 |||| #Destinatario - FMDPADT-139
#CEP - FMDPADT-140 |||| #Numero - FMDPADT-141 |||| #Ponto de referencia - FMDPADT-146
@validarDadosValidosEndereco @hr
Esquema do Cenario: Validar funcionalidade do campo Identificacao/Destinatario/CEP/Numero/Ponto de referencia - dados Validos
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  Quando eu insiro no campo <campo> o valor <texto>
  E eu clico no botao "texto_complemento"
  Entao valido a existencia do elemento "imagem_campo_valido"

  Exemplos:
  |              campo                |       texto      |
  |     "campo_ident_endereco"        |     "Barueri"    |
  |      "campo_destinatario"         | "Guilherme Reis" |
  |      "campo_cep_endereco"         |    "06446480"    |
  |          "numero_casa"            |       "435"      |
  | "campo_ponto_referencia_endereco" |   "Via Varejo"   |

#04/03
#CEP Endereco - FMDPADT-143 |||| #Numero - FMDPADT-144
#Endereco - BUG ||||  #Destinatario - BUG |||| #Ponto de referencia - BUG
@validarCepCaracterEsp @hr
Esquema do Cenario: Validar funcionalidade do campo CEP/Numero - Caracter especial
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  Quando eu insiro no campo <campo> o valor <valor>
  Entao valido o texto sem caracter especial <campo>

  Exemplos:
  |               campo               |         valor         |
  |       "campo_cep_endereco"        |    "@!#@11124&¨%%"    |
  |           "numero_casa"           |    "@!#@11124&¨%%"    |
  # |      "campo_ident_endereco"       |   "##@@Ba##rueri&&"   | #bug
  # |        "campo_destinatario"       | "##Gui@lherme $R&eis" | #bug
  # | "campo_ponto_referencia_endereco" |  "##Via !Va&re%jo@@"  | #bug

#04/03 - FMDPADT-145
@excluirEndereco @hr
Cenario: Validar funcionalidade do hiperlink Excluir
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  E realizo o cadastro de endereco
  Quando eu clico no link "link_excluir_endereco"
  Entao valido a existencia do elemento "campo_selecione_endereco"

# 05/04 - FMDPADT-147
@validarBotaoCancelar
Cenario: Validar funcionalidade do botao Cancelar
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  Quando eu clico no botao "botao_cancelar_cadastro_endereco"
  Entao valido a existencia do elemento "campo_selecione_endereco"

#05/04 - FMDPADT-148
@validarBotaoContinuar
Cenario: Validar funcionalidade do botao Continuar
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  Quando realizo o cadastro de endereco
  Entao valido a existencia do elemento "label_tipo_endereco2"

#05/04 - FMDPADT-149
@validoImgCampoObrigatorio
Cenario: Validar funcionalidade do botao Continuar - Campos Obrigatorios
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  Quando eu clico no botao "botao_Continuar"
  Entao valido a existencia do elemento "imagem_campo_invalido"

#05/04 - FMDPADT-150
@ComportamentoAlteracaoDados
Cenario: Validar comportamento ao alterar o endereço de entrega o resumo da compra deve ser alterado até finalização da compra
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  E eu clico no botao "botao_cadastrar_endereco"
  E realizo o cadastro de endereco
  E eu clico no botao "botao_cadastrar_endereco"
  E realizo o cadastro de endereco
  Quando capturo valor no campo "label_tipo_endereco2"
  E seleciono o "2" valor dentro do combobox "combobox_tipo_endereco"
  Entao valido o valor total no campo "label_tipo_endereco2"

#FMDPADT-151 ||| #FMDPADT-152
#FMDPADT-153 ||| #FMDPADT-154
@validarRadioButton
Esquema do Cenario: Validar funcionalidade do Radio button Agendada/Retira rapida
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  E eu clico no botao "botao_concluir_compra"
  Quando eu clico no botao <radioButton>
  Entao valido a existencia do elemento <elemento>

  Exemplos:
  |           radioButton           |               elemento               |
  | "radio_button_entrega_agendada" |         "campo_data_agendada"        |
  |       "rb_entrega_retira"       |        "campo_endereco_retira"       |
  |  "radio_button_entrega_normal"  |  "campo_entrega_normal_selecionado"  |
  | "radio_button_entrega_expressa" | "campo_entrega_expressa_selecionado" |
