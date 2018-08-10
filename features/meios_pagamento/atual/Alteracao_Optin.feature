#language: pt

Funcionalidade: Alteração da descrição das Opções de OpIN na tela de Cadastro

Eu como área de marketing e atendimento
Desejo que a descrição das Opções OpIn seja alterada convenientemente
Para melhor entendimento dos nossos clientes

@Desktop
Esquema do Cenario: Validar a alteracao da descricao das opcoes de OptIN/OUT Desktop (1° texto e 2° texto), novo cadastro
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  Quando eu clico no botao "botao_ContinuarLogin"
  Entao visualizo a exibicao da mensagem <msg> no elemento <campo>

  Exemplos:
  |           msg          |        campo        |
  | "mensagem_email_optin" | "texto_email_optin" |
  |  "mensagem_sms_option" |  "texto_sms_option" |

@Desktop
Esquema do Cenário: Validar a alteracao da descricao das opcoes de OptIN/OUT Desktop (1° texto e 2° texto), alteracao de cadastro
  Dado que estou logado com <usuario>
  E eu clico no link "link_pedidos"
  Quando eu clico no botao "botao_meu_perfil"
  Entao visualizo a exibicao da mensagem <msg> no elemento <campo>

  Exemplos:
  |         usuario         |           msg          |        campo        |
  | "usuarioGuilhermeTeste" | "mensagem_email_optin" | "texto_email_optin" |
  | "usuarioGuilhermeTeste" |  "mensagem_sms_option" |  "texto_sms_option" |
  |   "usuarioBlackList"    | "mensagem_email_optin" | "texto_email_optin" |
  |   "usuarioBlackList"    |  "mensagem_sms_option" |  "texto_sms_option" |
