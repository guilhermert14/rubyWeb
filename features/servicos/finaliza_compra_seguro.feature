#language: pt

Funcionalidade:  Validar compra com seguro inserida no carrinho, com 12, 24, e 36 meses,
                  variando todas formas de pagamento, cartao credito, cartao debito e boleto.


@seguro
Esquema do Cenario: Validar compra com seguro e forma de pagamento boleto

  Dado que acesso o site da bandeira
  E crio um usuario novo valido
  E que acesso um produto com a tag "sku_mario"
  E clico em "botao_Comprar"
  E seleciono o seguro <seguro>
  E preencho os dados de endereco
  E seleciono o tipo de entrega "Normal"
  Quando preencho a forma de pagamento "boleto"
  Entao valido a finalizacao da compra com "boleto"
  E valido o <seguro> <tipo> na tela de pedido

  Exemplos:
  | seguro        |
  | "roubo_furto" |
  | "roubo"       |
  | "quebra"      |

@seguro
Esquema do Cenario: Validar compra com seguro e forma de pagamento debito online

  Dado que estou logado com "usuarioValido"
  E que acesso um produto com a tag "sku_mario"
  E clico em "botao_Comprar"
  E seleciono o seguro <seguro>
  E seleciono o tipo de entrega "Normal"
  Quando preencho a forma de pagamento "debito_online_itau"
  Entao valido o popup de redirecionamento para o banco escolhido

  Exemplos:
  | seguro        |
  | "roubo_furto" |
  | "roubo"       |
  | "quebra"      |


Esquema do Cenario: Validar compra com seguro e forma de pagamento cartao de credito

  Dado que estou logado com "usuarioValido"
  E que acesso um produto com a tag "sku_mario"
  E clico em "botao_Comprar"
  E seleciono o seguro <seguro>
  E seleciono o tipo de entrega "Normal"
  Quando preencho a forma de pagamento "um_cartao_credito_master""
  Entao valido a finalizacao da compra com "um_cartao_credito"
  E valido o <tipo_servico> <meses> na tela de pedido

  Exemplos:
  | seguro        |
  | "roubo_furto" |
  | "roubo"       |
  | "quebra"      |
