#language: pt

Funcionalidade: Validaçoes referentes a tela do garantia

Contexto:
  Dado que acesso um produto com a tag "normal_com_garantia"

#FMDPADT-210 #FMDPADT-211 FMDPADT-212 FMDPADT-213
@TipoGarantia
Esquema do Cenario: Validar funcionalidade do botão Não obrigado/12 meses/24 meses/36 meses
  Quando seleciono o produto desejado com garantia de <garantia> e seguro para "nao"
  Entao visualizo a exibicao da mensagem <mensagem> no elemento <elemento>

  Exemplos:
  |  garantia  |            mensagem            |         elemento          |
  |   "nao"    | "mensagem_adicionar_garantiar" | "link_adicionar_garantia" |
  | "12_meses" |      "garantia_12_meses"       |   "campo_nome_garantia"   |
  | "24_meses" |      "garantia_24_meses"       |   "campo_nome_garantia"   |
  | "36_meses" |      "garantia_36_meses"       |   "campo_nome_garantia"   |
