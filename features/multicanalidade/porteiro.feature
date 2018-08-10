#language: pt
@multicanal
Funcionalidade: Verificar comportamento do porteiro dentro do site das bandeiras.
  O porteiro deve questionar sobre qual produto o cliente quer manter no carrrinho quando as formas
  de entrega não estão disponíveis para ambos.

Contexto: Logar com usuario valido
  Dado que estou logado com "usuarioValido2"
@regressivo 
Cenario: Exibicao do porteiro
  E que acesso um produto com a tag "normal_sem_garantia"
  E eu clico no botao "botao_Comprar"
  E que acesso um produto com a tag "retira_sem_garantia"
  E adiciono o item ao carrinho pelo metodo "retira" e servico "nao"
  Entao visualizo a exibicao do porteiro
# @bbbb
Esquema do Cenario: Comportamento do porteiro com Entrega normal variacoes s/ servico
  E que acesso um produto com a tag <item_1>
  E adiciono o item ao carrinho pelo metodo <entrega_1> e servico <servico_item_1>
  E que acesso um produto com a tag <item_2>
  E adiciono o item ao carrinho pelo metodo <entrega_2> e servico <servico_item_2>
  Quando seleciono no porteiro o item <item_porteiro>
  Entao visualizo no carrinho a exibicao do item <item_carrinho>

Exemplos:
  |            item_1              |     entrega_1     |            item_2             |    entrega_2      | item_porteiro |   item_carrinho   | servico_item_1  | servico_item_2 |
  |     "normal_sem_garantia"      |     "normal"      | "retira_sem_garantia"         |     "retira"      |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "normal_sem_garantia"      |     "normal"      | "retira_sem_garantia"         |     "retira"      |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "normal_sem_garantia"      |     "normal"      | "retira_sem_garantia_24horas" | "retira_24horas"  |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "normal_sem_garantia"      |     "normal"      | "retira_sem_garantia_24horas" | "retira_24horas"  |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "normal_sem_garantia"      |     "normal"      |             "locker"          |     "locker"      |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "normal_sem_garantia"      |     "normal"      |             "locker"          |     "locker"      |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "normal_sem_garantia"      |     "normal"      |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "normal_sem_garantia"      |     "normal"      |            "correios"         |     "correios"    |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      |     "normal_sem_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      |     "normal_sem_garantia"     |     "normal_porteiro"      |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      | "retira_sem_garantia_24horas" | "retira_24horas"  |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      | "retira_sem_garantia_24horas" | "retira_24horas"  |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      |             "locker"          |     "locker"      |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      |             "locker"          |     "locker"      |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |     "retira_sem_garantia"      |     "retira"      |            "correios"         |     "correios"    |     "novo"    |       "novo"      |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |     "normal_sem_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |     "normal_sem_garantia"     |     "normal_porteiro"      |     "novo"    |       "novo"      |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |     "retira_sem_garantia"     |      "retira"     |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |     "retira_sem_garantia"     |      "retira"     |     "novo"    |       "novo"      |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |             "locker"          |     "locker"      |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |             "locker"          |     "locker"      |     "novo"    |       "novo"      |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  | "retira_sem_garantia_24horas"  | "retira_24horas"  |            "correios"         |     "correios"    |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |             "locker"           |     "locker"      |     "normal_sem_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |             "locker"           |     "locker"      |     "normal_sem_garantia"     |      "normal_porteiro"     |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |             "locker"           |     "locker"      |     "retira_sem_garantia"     |      "retira"     |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |             "locker"           |     "locker"      |     "retira_sem_garantia"     |      "retira"     |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |             "locker"           |     "locker"      | "retira_sem_garantia_24horas" |  "retira_24horas" |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |             "locker"           |     "locker"      | "retira_sem_garantia_24horas" |  "retira_24horas" |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |             "locker"           |     "locker"      |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |             "locker"           |     "locker"      |            "correios"         |     "correios"    |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |            "correios"          |    "correios"     |     "normal_sem_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |            "correios"          |    "correios"     |     "normal_sem_garantia"     |      "normal_porteiro"     |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |            "correios"          |    "correios"     |     "retira_sem_garantia"     |      "retira"     |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |            "correios"          |    "correios"     |     "retira_sem_garantia"     |      "retira"     |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |            "correios"          |    "correios"     | "retira_sem_garantia_24horas" |  "retira_24horas" |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |            "correios"          |    "correios"     | "retira_sem_garantia_24horas" |  "retira_24horas" |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |            "correios"          |    "correios"     |            "locker"           |     "locker"      |   "carrinho"  |     "carrinho"    |     "nao"     | "nao" |
  |            "correios"          |    "correios"     |            "locker"           |      "locker"     |     "novo"    |       "novo"      |     "nao"     | "nao" |
  |     "normal_com_garantia"      |     "normal"      | "retira_com_garantia_24horas" |      "retira"     |   "carrinho"  |     "carrinho"    |   "12_meses"  | "nao" |
  |     "normal_com_garantia"      |     "normal"      | "retira_com_garantia_24horas" |     "retira"      |     "novo"    |       "novo"      |   "12_meses"  | "nao" |
  |     "normal_com_garantia"      |     "normal"      | "retira_com_garantia_24horas" | "retira_24horas"  |   "carrinho"  |     "carrinho"    |   "12_meses"  | "nao" |
  |     "normal_com_garantia"      |     "normal"      | "retira_com_garantia_24horas" | "retira_24horas"  |     "novo"    |       "novo"      |   "12_meses"  | "nao" |
  |     "normal_com_garantia"      |     "normal"      |             "locker"          |     "locker"      |   "carrinho"  |     "carrinho"    |   "12_meses"  | "nao" |
  |     "normal_com_garantia"      |     "normal"      |             "locker"          |     "locker"      |     "novo"    |       "novo"      |   "12_meses"  | "nao" |
  |     "normal_com_garantia"      |     "normal"      |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |   "12_meses"  | "nao" |
  |     "normal_com_garantia"      |     "normal"      |            "correios"         |     "correios"    |     "novo"    |       "novo"      |   "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      |     "normal_com_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      |     "normal_com_garantia"     |     "normal_porteiro"      |     "novo"    |       "novo"      |   "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      | "retira_com_garantia_24horas" | "retira_24horas"  |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      | "retira_com_garantia_24horas" | "retira_24horas"  |     "novo"    |       "novo"      |   "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      |             "locker"          |     "locker"      |   "carrinho"  |     "carrinho"    |   "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      |             "locker"          |     "locker"      |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |   "12_meses"  | "nao" |
  |     "retira_com_garantia"      |     "retira"      |            "correios"         |     "correios"    |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  | "retira_com_garantia_24horas"  | "retira_24horas"  |     "normal_com_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  | "retira_com_ga  rantia_24horas"  | "retira_24horas"  |     "normal_com_garantia"     |     "normal_porteiro"      |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  | "retira_com_garantia_24horas"  | "retira_24horas"  |     "retira_com_garantia"     |      "retira"     |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  | "retira_com_garantia_24horas"  | "retira_24horas"  |     "retira_com_garantia"     |      "retira"     |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  | "retira_com_garantia_24horas"  | "retira_24horas"  |             "locker"          |     "locker"      |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  | "retira_com_garantia_24horas"  | "retira_24horas"  |             "locker"          |     "locker"      |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  | "retira_com_garantia_24horas"  | "retira_24horas"  |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  | "retira_com_garantia_24horas"  | "retira_24horas"  |            "correios"         |     "correios"    |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |             "locker"           |     "locker"      |     "normal_com_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |             "locker"           |     "locker"      |     "normal_com_garantia"     |      "normal_porteiro"     |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |             "locker"           |     "locker"      |     "retira_com_garantia"     |      "retira"     |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |             "locker"           |     "locker"      |     "retira_com_garantia"     |      "retira"     |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |             "locker"           |     "locker"      | "retira_com_garantia_24horas" |  "retira_24horas" |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |             "locker"           |     "locker"      | "retira_com_garantia_24horas" |  "retira_24horas" |     "novo"    |       "novo"      |     "12_meses"  | "nao" |
  |             "locker"           |     "locker"      |            "correios"         |     "correios"    |   "carrinho"  |     "carrinho"    |     "12_meses"  | "nao" |
  |             "locker"           |     "locker"      |            "correios"         |     "correios"    |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     |     "normal_com_garantia"     |      "normal_porteiro"     |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     |     "normal_com_garantia"     |      "normal_porteiro"     |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     |     "retira_com_garantia"     |      "retira"     |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     |     "retira_com_garantia"     |      "retira"     |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     | "retira_com_garantia_24horas" |  "retira_24horas" |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     | "retira_com_garantia_24horas" |  "retira_24horas" |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     |            "locker"           |     "locker"      |   "carrinho"  |     "carrinho"    |    "12_meses"  | "nao" |
  |            "correios"          |    "correios"     |            "locker"           |      "locker"     |     "novo"    |       "novo"      |    "12_meses"  | "nao" |
