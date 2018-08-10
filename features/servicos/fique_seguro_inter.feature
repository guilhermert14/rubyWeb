#language: pt

Funcionalidade: Validar Fique Seguro na Tela Intermediaria

Contexto:
  Dado que estou logado com "usuarioValido"

@FSINTER_CREDITO_RFQ @ref
Esquema do Cenario: Inclusão de Fique Seguro na Tela Intermediaria, apenas com Quebra

  E que acesso um produto com a tag "sku_mario"
  Quando eu clico no botao "botao_Comprar"
  Entao realizo a finalizacao da compra com <pagamento> e seguro <valor_seguro>
  Entao valido a finalizacao da compra com <validar> e seguro <valor_seguro>


  Exemplos:
    |     valor_seguro     |     pagamento               |     validar          |
    |     "roubo_furto"    |     "boleto"                |     "boleto"         |
    |        "quebra"      |  "um_cartao_credito_master" |  "um_cartao_credito" |
    | "roubo_furto_quebra" |     "debito_itau"           |     "debito_itau"    |
