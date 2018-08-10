#language: pt

Funcionalidade:  Validar compra com GARANTIA ESTENDIDA inserida no carrinho, com 12, 24, e 36 meses,
                  variando todas formas de pagamento, cartao credito, cartao debito e boleto.


@garantia_estendida
Esquema do Cenario: Validar compra com garantia estendida e forma de pagamento boleto

  Dado que acesso o site da bandeira
  E crio um usuario novo valido
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pelo metodo "normal_cadastra_endereco" e servico <meses>
  E preencho os dados de endereco
  E clico em "botao_Concluir"
  Quando preencho a forma de pagamento "boleto"
  Entao valido a finalizacao da compra com "boleto"
  E valido o <tipo_servico> <meses> na tela de pedido

  Exemplos:
  | meses        | tipo_servico |
  | "12_meses"   | "garantia"   |
  | "24_meses"   | "garantia"   |
  | "36_meses"   | "garantia"   |

@garantia_estendida
Esquema do Cenario: Validar compra com garantia estendida e forma de pagamento debito online

  Dado que estou logado com "usuarioValido"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pelo metodo "normal_servico" e servico <meses>
  Quando preencho a forma de pagamento "debito_online_itau"
  Entao valido o popup de redirecionamento para o banco escolhido

  Exemplos:
  | meses        | tipo_servico |
  | "12_meses"   | "garantia"   |
  | "24_meses"   | "garantia"   |
  | "36_meses"   | "garantia"   |

@garantia_estendida
Esquema do Cenario: Validar compra com garantia estendida e forma de pagamento cartao de credito

  Dado que estou logado com "usuarioValido"
  E que acesso um produto com a tag "normal_com_garantia"
  E adiciono o item ao carrinho pelo metodo "normal_servico" e servico <meses>
  Quando preencho a forma de pagamento "um_cartao_credito_master"
  Entao valido a finalizacao da compra com "um_cartao_credito"
  E valido o <tipo_servico> <meses> na tela de pedido

  Exemplos:
  | meses        | tipo_servico |
  | "12_meses"   | "garantia"   |
  | "24_meses"   | "garantia"   |
  | "36_meses"   | "garantia"   |
