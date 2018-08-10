#language: pt
@multicanal
Funcionalidade: Exibição do botão
  Botão 'Retirar' deve ser exibido para bandeiras do Grupo(GPA)
  Finalizar compra atravéz do botão Retira Rápido.
Contexto: Acessar produto que seja eleito para uma loja MarketPlace
  Dado que estou logado com "usuarioValido2"
  E que acesso um produto com a tag "Retira_Rapido_Opcoes"

# #PBI:106595
@modal
Cenário: Exibir botão Retira na lista de + opções na tela de detalhe do produto
  Entao visualizo o botão "botao_Retirar+" na lista de mais opcoes

# #PBI: 106594
 @106594
@modal @106594
Cenário: Compra com retira selecionando na lista de mais opções
  Dado que eu clico no botao "botao_Retirar+"
  E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "05112010"
  E eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
  Quando eu seleciono dentro do modal "retira" a primeira loja
  Entao realizo a finalizacao da compra com "boleto" e garantia "nao"

#PBI:
  @106596
@modal
Esquema do Cenário: Exibir botão de retira somente para Casas Bahia na página de lojistas
  após alterar ordenação da lista de lojistas.
  Dado eu clico no link "lnk+opcoes"
  E eu insiro no campo "texto_CepLojista" o valor "05112010"
  E eu clico no botao "botao_OkCalculoFrete"
  Quando seleciono a ordenacao da lista por <ordem>
  Entao espero visualizar o botao 'Retirar' somente para casas bahia

  Exemplos:
    |    ordem    |
    | "Avaliação" |
    | "Prazo de Entrega" |
    | "Menor Preço" |
    | "Maior Preço" |
