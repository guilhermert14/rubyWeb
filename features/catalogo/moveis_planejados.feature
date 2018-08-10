#language: pt
@atracao
Funcionalidade: Verificar todos os links do header, footer, serviços e a paginação.

Contexto:
  Dado que acesso a pagina de "Planejados"

@valida_modal_test @cenario_ok
Cenário: Posso validar modal de móveis planejados
Então o sistema apresenta modal de móveis planejados

@valida_campo_cep @cenario_ok
Cenário: Posso validar o campo CEP e realizar a busca
E insiro no campo "campo_cep_planejados" o valor "cepValido"
Quando eu clico no botao "botao_consultCep"


@valida_modal_matriz @cenario_ok
Cenário: Posso validar banner de fotos
Então o sistema exibe banner de matriz de fotos dos móveis planejados

@valida_modal
Cenário: Posso validar o ambiente "Cozinha" default
Então posso visualizar o ambiente "botao_cozinha" default

@valida_abas @cenario_ok
Esquema do Cenário: Posso validar os ambientes disponíveis
E eu clico no botao <ambientes>
Então posso visualizar os demais ambientes disponíveis <ambientes>

Exemplos:
  | ambientes   |
  | "botao_quarto"    |
  | "botao_sala"      |
  | "botao_banheiro"  |

  @valida_informacoes @cenario_ok
  Esquema do Cenário: Posso validar os ambientes disponíveis
  E eu clico no botao <informacoes>
  Então posso visualizar as demais informações disponíveis <informacoes>

  Exemplos:
    | informacoes               |
    | "texto_informativo_como_funciona" |
    | "texto_conteudoDoCliente" |
    | "banner_modal_orcamento"  |
    | "texto_pqFazerTitle"      |


@valida_linkConteudo
Esquema do Cenário: Posso validar os ambientes disponíveis após clicar no link
  E que eu clico no link "link_moveis_planejados_ver_conteudo"
  E eu clico no botao <botao_ambiente>
  Então posso visualizar a imagem do <imagem_ambiente> selecionado

Exemplos:
  |  botao_ambiente   |         imagem_ambiente             |
  | "botao_quarto"    | "banner_projetos_clientes_quarto"   |
  | "botao_sala"      | "banner_projetos_clientes_sala"     |
  | "botao_banheiro"  | "banner_projetos_clientes_banheiro" |

@valida_modal1 @cenario_ok
Esquema do Cenário: Posso validar quadros de Por que fazer seus móveis aqui
Entao visualizo a exibicao da mensagem <mensagem>

Exemplos:
| mensagem |
| "texto_MVP_loja_mais_proxima" |
| "texto_MVP_orcamento"         |
| "texto_MVP_contato"           |
| "texto_MVP_projeto"           |
| "texto_MVP_profissionais_especializados" |
| "texto_MVP_entrega_montagem"  |
| "texto_MVP_confianca_experiencia" |
| "texto_MVP_taxas_especiais"   |

@marcosteste1
Esquema do Cenario: Validar selecao de opcoes dentro dos modais de matriz
  E seleciono a cor <id_cor>
  E seleciono o acessorio <id_acessorio>
  Quando seleciono o tipo de material <id_material>
  Então posso visualizar a imagem do "id_banner" selecionado

  Exemplos:
  | id_cor | id_acessorio | id_material |
  | "1"    |      "2"     |     "2"     |
  | "3"    |      "1"     |     "3"     |