#language: pt
#encode: UTF-8
@multicanal
Funcionalidade: Finalizar compra de itens retira loja
  Como usuario cadastrado eu quero finalizar minhas compras com todas as posibilidades:
  cartao de credito, boleto bancario, visa checkout, paypal e rede pay.
  Com usuarios cadastrados. com e sem garantia
Contexto:
  Dado que estou logado com "usuarioBlackList"
  E que acesso um produto com a tag "retira_sem_servico_estoque_site"
@GMUD @exec
Esquema do Cenário: Realizar a compra de um produto, com garantia e todas as formas de pagamento
  E adiciono o item ao carrinho pelo metodo "normal" e servico "nao"
  E preencho a forma de pagamento <tipo>
  Entao valido a finalizacao da compra com <tipoValidacao> e seguro "nao"
Exemplos:
  |        tipo             |    tipoValidacao    |
  | "um_cartao_credito_master"    | "um_cartao_credito" |
  # | "dois_cartoes_credito_master" | "dois_cartoes_credito" |
  # | "boleto"               |       "boleto"       |
  # | "debito_online_itau"   |    "debito_online"     |
