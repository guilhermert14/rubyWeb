#language: pt
@multicanal
Funcionalidade: Realizar testes no sistema de cuponagem do site

Esquema do Cenario: Finalizar compra com Cupor Nominal e Percentual no carrinho
  Dado que acesso um produto com a tag <item>
  E adiciono o item ao carrinho pelo metodo <entrega> e servico "nao"
  E eu insiro no campo "texto_insira_cupom" o valor <cupom>
  Quando eu clico no botao "botao_inserir_cupom"
  Entao visualizo o valor do desconto <valor> nominal aplicado sobre o valor do produto

Exemplos:
  |          item           |     cupom       |   entrega    |   valor    |
  |        "locker"         |  "BTEGOOENBU"   |   "locker"   |   "3,87"   |
  | "retira_sem_garantia"   |  "BTEGOOENBU"   |   "retira"   |   "3,87"   |
  |       "correios"        |  "BTEGOOENBU"   |   "correios" |   "3,87"   |
