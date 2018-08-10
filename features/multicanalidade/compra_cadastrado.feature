#language: pt
#encode: UTF-8
@multicanal
Funcionalidade: Finalizar compra de itens nas 3 bandeiras
  Como usuario cadastrado eu quero finalizar minhas compras com todas as posibilidades:
  cartao de credito, boleto bancario, visa checkout, paypal e rede pay.
  Com usuarios cadastrados.
@done
Cenário: Realizar a compra de um produto, com o meio de pagamento cartao de credito

  Dado que estou logado com "usuarioLucasTeste"
  E que acesso um produto com a tag "retira_sem_servico_estoque_site"
  E adiciono o item ao carrinho pelo metodo "normal" e servico "nao"
  E preencho a forma de pagamento "boleto"
  Entao valido a finalizacao da compra com "boleto" e seguro "nao"
