#language: pt
@multicanal
Funcionalidade: Cadastro de usuário
  Acessar tela de cadastro das bandeiras disponiveis informando um email que ainda nao existe na base das bandeiras.
  Preencher o formulario com dados validos nos campos: Nome Completo*, telefone*,Telefone2*, CPF*, Data de nascimento*,
  Sexo*, Email*(Já vem preenchido automaticamente), Confirmar E-mail*, Senha*, Corfirmar Senha*.
@ok @done @exec
Cenário: Acessar tela de cadastro

  Dado que acesso o site da bandeira
  E eu clico no botao "botao_CadastreSe" ,com index 0
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu seleciono o radio button "primeiraCompra"
  Quando eu clico no botao "botao_ContinuarLogin"
  Entao eu visualizo a pagina "identificacao"

@ok @done @exec
Cenário: Preenchimento do formulário de cadastro com sucesso

  Dado que acesso a pagina de "login"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  E preencho o formulário de cadastro
  Quando clico em "botao_Continuar"
  Entao visualizo meu "nome" no topo da tela inicial
