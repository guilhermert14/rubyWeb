#language: pt
@multicanal
Funcionalidade: Retira Rápido
  Exibir Modal atraves do clique no botao Retirar na Loja

Contexto: Acessar produto com tag Retira Rápido
  Dado que estou logado com "usuarioValido2"
  E que acesso um produto com a tag "retira_sem_servico_estoque_site"
  Dado que acesso o site da bandeira
  E que acesso um produto com a tag "Retira_Rapido"

@modal @regressivo @exec
Cenário: Acessar modal Retirar na Loja
    Dado que eu clico no botao "botao_RetirarNaLoja"
    Entao visualizo a exibicao do modal "retira" na Loja

@cep @regressivo @exec
Cenário: Realizar busca de cep invalido
  Dado que eu clico no botao "botao_RetirarNaLoja"
  E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "11111-111"
  Quando eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
  Entao visualizo a exibicao da mensagem "cep_invalido" dentro do modal "retira" no elemento "cep_invalido"
