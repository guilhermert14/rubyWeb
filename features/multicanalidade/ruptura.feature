#language: pt
@multicanal
Funcionalidade: Exibição do botão Comprar
  Botão 'Comprar' não deve ser exibido para produtos que não possuem estoque online, somente em lojas fisicas.
Contexto: Acessar produto que possua somente estoque em loja fisica
  Dado que estou logado com "usuarioValido"
  E que acesso um produto com a tag "Ruptura"

#PBI: 106598
Cenário: Não exibir botão Comprar dentro do buybox na tela de detalhe do produto
  Entao não visualizo o elemento "botao_ComprarDesativado"


#PBI: 106599
Cenário: Não exibir botão Comprar na lista de + opções na tela de detalhe do produto
  Entao não visualizo o botão "botao_ComprarDesativado" na lista de mais opcoes

#PBI: 106600
@marcops
Esquema do Cenário: Não exibir o botão de compra na página de lojistas
  após alterar ordenação da lista de lojistas.
  Dado eu clico no link "lnk+opcoes"
  E eu insiro no campo "texto_CepLojista" o valor "06449060"
  E eu clico no botao "botao_OkCalculoFrete"
  Quando seleciono a ordenacao da lista por <ordem>
  Entao não visualizo o elemento "botao_ComprarDesativado"

  Exemplos:
    |    ordem    |
    | "Avaliação" |
    | "Prazo de Entrega" |
    | "Menor Preço" |
    | "Maior Preço" |
