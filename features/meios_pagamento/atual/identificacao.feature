#language: pt
@meio_pagamento
Funcionalidade: Validaçoes referentes a tela do identificacao

# 21/03 FMDPDT-90 FMDPDT-91
@EmailValido @cd
Cenario: Validar funcionalidade dos campos E-mail e Senha - Valor Valido
  Dado que acesso a pagina de "login"
  Quando faço o login com email "valido2" e senha "valida2" e "não limpar" o carrinho
  Entao valido a existencia do elemento "campo_login_efetuado"

@EmailInvalido @cd
Cenario: Validar funcionalidade dos campos E-mail e Senha - Valor invalido
  Dado que acesso a pagina de "login"
  Quando faço o login com email "invalido" e senha "invalida" e "não limpar" o carrinho
  Entao visualizo a exibicao da mensagem "email_senha_incorreto" no elemento "campo_login_erro"

#21/03 FMDPDT-92
@validarLimiteCaracEmail @cd
Cenario: Validar campo E-mail Limite de caracteres
  Dado que acesso a pagina de "login"
  Quando eu insiro no campo "campo_email" o valor "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbb"
  Entao valido a existencia de somente "50" caracteres no campo "campo_email"

#FMDPDT-93
@validarLimite
Cenario: Validar campo Senha Limite de caracteres
  Dado que acesso a pagina de "login"
  E eu insiro no campo "campo_senha" o valor "12345678912345678912"
  Quando clico em "campo_informe_email"
  Entao visualizo a exibicao da mensagem "mensagem_senha_invalida" no elemento "label_user_senha_formato_invalido"

#22/03 FMDPDT-94 FMDPADT-101  06/04 - #FMDPADT-155
@validarLink @cd
Esquema do Cenario: Validar funcionalidade do hiperlink Meu e-mail mudou/ Esqueci minha senha
  Dado que acesso a pagina de "login"
  Quando eu clico no link <link>
  Entao valido a existencia do elemento <elemento>

  Exemplos:
  |                link              |            elemento          |
  |         "link_email_mudou"       |     "frame_modal_indereco"   |
  | "link_esqueci_minha_senha_modal" |     "frame_modal_indereco"   |
  |     "link_esqueci_meu_email"     |     "frame_modal_indereco"   |

#22/03
#FMDPADT-95
@validarFecharModal @cd
Cenario: Validar funcionalidade botao Fechar
  Dado que acesso a pagina de "login"
  E eu clico no botao "link_email_mudou"
  Quando eu clico dentro do modal "frame_modal" no botao "botao_fechar_modal"
  Entao valido a existencia do elemento "label_dados_login"

#22/03
#FMDPADT-96
@validaContinuarModal @cd
Cenario: Validar funcionalidade botao Continuar
  Dado que acesso a pagina de "login"
  E eu clico no botao "link_email_mudou"
  Quando eu clico dentro do modal "frame_modal" no botao "botao_continuar_modal"
  Entao visualizo a exibicao da mensagem "mensagem_email_obrigatorio" dentro do modal "frame_modal" no elemento "label_informe_nome"

#22/03
#FMDPADT-97 FMDPADT-98 FMDPADT-99 FMDPADT-100
@validarCamposModal @cd
Esquema do Cenario: Validar funcionalidade campo Email/Novo email/Senha/Confirme novo Email
  Dado que acesso a pagina de "login"
  E eu clico no botao "link_email_mudou"
  Quando que eu insiro dentro do modal "frame_modal" no campo <campo> o valor <tipo>
  E eu clico dentro do modal "frame_modal" no botao "botao_confirmar"
  Entao valido a existencia do elemento "imagem_campo_valido" dentro do modal "frame_modal"

  Exemplos:
  |              campo             |             tipo             |
  |           "campo_email"        | "guilhermeteste@groove.tech" |
  |        "campo_email_novo"      | "guilhermeteste@groove.tech" |
  |          "campo_senha"         |          "teste2018"         |
  |   "campo_confirmar_email_novo" | "guilhermeteste@groove.tech" |


#22/03 - FMDPADT-102 #FMDPADT-156
@validarTexto @cd
Esquema do Cenario: Validar texto Esqueci minha senha/esqueci meu email
  Dado que acesso a pagina de "login"
  Quando eu clico no link <link>
  Entao visualizo a exibicao da mensagem <msg> dentro do modal "frame_modal" no elemento <label>

  Exemplos:
  |              link                |                  msg                 |            label            |
  | "link_esqueci_minha_senha_modal" | "mensagem_esqueci_minha_senha_modal" | "label_esqueci_minha_senha" |
  |   "link_esqueci_meu_email"       |    "mensagem_esqueci_email_modal"    | "label_esqueci_email_modal" |

#22/03
#FMDPADT-103
@validarEmailInvalido @cd
Cenario: Validar funcionalidade campo Email - Invalido
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_minha_senha_modal"
  E que eu insiro dentro do modal "frame_modal" no campo "campo_email" o valor "sashaa.com"
  Quando eu clico dentro do modal "frame_modal" no botao "botao_continuar_esqueci_login"
  Entao visualizo a exibicao da mensagem "formato_email_invalido" dentro do modal "frame_modal" no elemento "label_email_invalido"

#22/03
#FMDPADT-104
@validarContinuar @cd
Cenario: Validar funcionalidade do botao Continuar
  Dado que acesso a pagina de "login"
  Quando faço o login com email "valido" e senha "valida" e "não limpar" o carrinho
  Entao visualizo meu "nome" no topo da tela inicial

#22/03
#FMDPADT-105 FMDPADT-106 FMDPADT-107
@validaRadio @cd
Esquema do Cenario: Validar botao (radio) - Pessoa Fisica/Pessoa Juridica e Ja tenho cadastro
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu clico no botao <opcao>
  Entao visualizo a exibicao da mensagem <msg> no elemento <campo>

  Exemplos:
  |           opcao         |              msg            |            campo            |
  |     "pessoa_fisica"     |   "mensagem_dados_pessoais" |    "campo_meu_perfil_PF"    |
  |    "pessoa_juridica"    |   "mensagem_dados_empresa"  |    "campo_meu_perfil_PJ"    |
  |  "botao_tenho_cadastro" |   "mensagem_dados_login"    |      "label_dados_login"    |

#22/03
#FMDPADT-108
@validarDadosValidosCPF @cd
Cenario: Validar funcionalidade em dados Pessoais do campo CPF - dados Validos
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu insiro no campo "texto_Cpf" o valor "73488589021"
  Quando eu clico no botao "texto_NomeCompleto"
  Entao valido a existencia do elemento "imagem_campo_valido"

#22/03
#FMDPADT-109
@validarCPF @cd
Cenario: Validar funcionalidade em dados Pessoais do campo CPF - Limite de dados
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo "texto_Cpf" o valor "11111111111111111111"
  Entao valido a existencia de somente "11" caracteres no campo "texto_Cpf"

#22/03 - CPF/DDD #26/03 - DDD2 - FMDPADT-117
#22/03 CPF - FMDPADT-110 DDD - FMDPADT-111
@validarCaracEspeciaisI @cd
Esquema do Cenario: Validar funcionalidade em dados Pessoais do campo CPF/DDD - Caracter especial
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo <texto> o valor <valor>
  Entao valido o texto sem caracter especial <texto>

  Exemplos:
  |       texto       |      valor      |
  |    "texto_Cpf"    |   "@!#@11&¨%%"  |
  | "texto_DddPhone"  |   "@!#@11&¨%%"  |
  | "texto_DddPhone2" |   "@!#@11&¨%%"  |


#22/03 - DDD1/DDD2
#DDD1 - FMDPADT-114 DDD2 - #26/03 FMDPADT-115
@validarDDDvalido @cd
Esquema do Cenario: Validar funcionalidade em dados Pessoais do campo DDD - dados validos
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo <campo> o valor "11"
  Entao valido a existencia do elemento "imagem_DDD_valido"

  Exemplos:
  |      campo        |
  | "texto_DddPhone"  |
  | "texto_DddPhone2" |


#23/03 -DDD #26/03 - Numero/DDD2 - FMDPADT-118, FMDPADT-119
#23/03 - DDD - FMDPADT-112 #12/04 - FMDPADT-183
@validarLimiteI @cd
Esquema do Cenario: Validar funcionalidade em dados Pessoais do campo DDD/Numero/DDD2/Numero2 - Limite de dados
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo <campo> o valor <valor>
  Entao valido a existencia de somente <qtd> caracteres no campo <campo>

  Exemplos:
  |        campo          |       valor         |  qtd |
  |  "texto_DddPhone"     |       "11111"       |  "2" |
  |    "texto_Phone"      |    "11111111111"    |  "9" |
  |   "texto_DddPhone2"   |       "11111"       |  "2" |
  |    "texto_Phone2"     |   "11111111111"     |  "9" |

#23/03
#FMDPADT-116
@validarNumeroValido @cd
Cenario: Validar funcionalidade em dados Pessoais do campo Numero - dados validos
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo "texto_Phone" o valor "111111111"
  Entao valido a existencia do elemento "imagem_numero_valido"

#23/03
#FMDPADT-113
@validarNumeroCE @cd
Cenario: Validar funcionalidade em dados Pessoais do campo Numero - Caracter especial
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo "texto_DddPhone" o valor "@#$$41221$@#3145"
  Entao valido o texto sem caracter especial "texto_DddPhone"

#27/03 - FMDPADT-120
@isento @cd
Cenario: Validar funcionalidade em dados da Empresa do Checkbox ISENTO
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando eu seleciono o Checkbox "checkbox_pj_isento"
  Entao valido a existencia do elemento "imagem_campo_valido"

#28/03 - FMDPADT-121
@optSimples
Cenario: Validar funcionalidade em dados da Empresa do Checkbox Optante pelo Simples
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu clico no botao "pessoa_juridica"
  Entao eu seleciono o Checkbox "check_pj_optante_simples"

#27/03 - FMDPADT-122
@confSenhaDadosValidos @cd
Cenario: Validar funcionalidade em dados de acesso do campo Confirmar Senha - dados validos
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  E eu insiro no campo "campo_senha" o valor "12345"
  Quando eu insiro no campo "texto_conf_senha" o valor "12345"
  E clico em "campo_senha"
  Entao valido a existencia do elemento "imagem_campo_valido"

#27/03 - FMDPADT-123
@limiteCaracConfirmar @cd
Cenario: Validar funcionalidade em dados de acesso do campo Confirmar Senha - Limite de caracter
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando eu insiro no campo "texto_conf_senha" o valor "12468451356723564321"
  E clico em "campo_senha"
  Entao visualizo a exibicao da mensagem "mensagem_conf_senha_invalida" no elemento "label_conf_senha_invalida"

#27/03 - FMDPADT-124
@caracEspCnpj @cd
Cenario: Validar funcionalidade em dados da Empresa do campo CNPJ - Caracter especial
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando eu insiro no campo "campo_cnpj" o valor "@!#@11124&¨%%"
  Entao valido o texto sem caracter especial "campo_cnpj"

#27/03
#razao social - FMDPADT-125
# nome fantasia - FMDPADT-126
# Cnpj - FMDPADT-127
@validoCampo @cd
Esquema do Cenario: Validar funcionalidade em dados da Empresa do campo Razao Social/nome fantasia/Cnpj-Limite de dados
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando eu insiro no campo <campo> o valor <valor>
  Entao valido a existencia de somente <qtd> caracteres no campo <campo>

  Exemplos:
  |        campo          |       valor         |  qtd |
  |     "campo_cnpj"      | "12345678912345678" | "14" |
  | "campo_razao_social"  | "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"                                                   | "50"  |
  | "campo_nome_fantasia" | "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" | "100" |

#27/03 - FMDPADT-128
@validoCnpj @cd
Cenario: Validar funcionalidade em dados da Empresa do campo CNPJ - dados Válidos
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando eu insiro no campo "campo_cnpj" o valor "47013285000169"
  E eu clico no botao "campo_nome_fantasia"
  Entao valido a existencia do elemento "imagem_campo_valido"

#06/04 - FMDPADT-157 #09/04 - FMDPADT - 165
@validarRbPFePJ @as
Esquema do Cenario: Validar Radio Button Pessoa Fisica/Pessoa Juridica
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  Quando eu clico dentro do modal "frame_modal" no botao <radiobutton>
  Entao visualizo a exibicao da mensagem <msg> dentro do modal "frame_modal" no elemento <elemento>

  Exemplos:
  |      radiobutton     |             msg          |       elemento      |
  |  "rb_pessoa_fisica"  |  "mensagem_digite_cpf"   |  "label_digite_cpf" |
  | "rb_pessoa_juridica" |  "mensagem_digite_cnpj"  | "label_digite_cnpj" |

#06/04 - FMDPADT-158
@validarCampoCpf @as
Cenario: Validar funcionalidade campo Digite seu CPF
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_Cpf" o valor "48754180864"
  Entao valido a existencia do elemento "imagem_cpf_valido" dentro do modal "frame_modal"

#06/04 - FMDPADT-159
@validaCECpf @as
Cenario: Validar funcionalidade campo: Digite seu CPF - Caracter especial
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_Cpf" o valor "48#7(5&41@8$0)8!64"
  Entao valido o texto sem caracter especial "texto_Cpf" dentro do modal "frame_modal"

#06/04 - FMDPADT-161
@validaLimiteMaxCaracCPF @as
Cenario: Validar funcionalidade campo Digite seu CPF - Limite maximo de caracter
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_Cpf" o valor "4875411111180864"
  Entao valido a existencia de somente "11" caracteres no campo "texto_Cpf" dentro do modal "frame_modal"

#06/04 - FMDPADT-160
@validaLimiteMinCaracCPF @as
Cenario: Validar funcionalidade campo Digite seu CPF - Limite minimo de caracter
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_Cpf" o valor "4221960000"
  E eu clico dentro do modal "frame_modal" no botao "texto_NascDia"
  Entao visualizo a exibicao da mensagem "mensagem_CPF_invalido" dentro do modal "frame_modal" no elemento "label_campo_invalido"

@validaCampoInv @as
Cenario: Validar funcionalidade campo Confirmar Email - Invalido
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_minha_senha_modal"
  Quando que eu insiro dentro do modal "frame_modal" no campo "campo_email" o valor "teste.com"
  E eu clico dentro do modal "frame_modal" no botao "botao_ConcluirPgto"
  Entao visualizo a exibicao da mensagem "formato_email_invalido" dentro do modal "frame_modal" no elemento "label_campo_invalido"

#FMDPDT-163
@EmailMax @as
Cenario: Validar funcionalidade campo Confirmar Email - Limite de caracter (Max)
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_minha_senha_modal"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_Conf_Email" o valor "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbb"
  Entao valido a existencia de somente "50" caracteres no campo "texto_Conf_Email" dentro do modal "frame_modal"

#10/04 - FMDPADT-164 - FMDPADT-166
@EmailMin
Esquema do Cenario: Validar funcionalidade campo Confirmar Email/Email - Limite de caracter (Min)
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_minha_senha_modal"
  Quando que eu insiro dentro do modal "frame_modal" no campo <campo> o valor "a"
  E eu clico dentro do modal "frame_modal" no botao "botao_ConcluirPgto"
  Entao visualizo a exibicao da mensagem "formato_email_invalido" dentro do modal "frame_modal" no elemento "label_campo_invalido"

  Exemplos:
  |       campo       |
  |   "campo_email"   |
  | "texto_Conf_Email" |

#10/04 - FMDPADT-167
@Exibicao3links
Cenario: Validar exibição link - 1 Identificação, 2 Endereço, 3 Pagamento
  Dado que estou logado com "usuarioGuilhermeTeste"
  E que acesso um produto com a tag "normal_com_garantia"
  E seleciono o produto desejado com garantia de "nao" e seguro para "nao"
  Quando eu clico no botao "botao_concluir_compra"
  Entao valido a existencia do elemento "label_identificao"
  E valido a existencia do elemento "label_endereco"
  E valido a existencia do elemento "label_pagamento"

#09/04 - FMDPADT-168
@DataNascCaracEsp @as
Cenario: Validar funcionalidade campo Data Nasc - Caract. Esp
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  E que eu insiro dentro do modal "frame_modal" no campo "texto_NascDia" o valor "###2*#1%%%"
  E que eu insiro dentro do modal "frame_modal" no campo "texto_NascMes" o valor "###7%%%"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_NascAno" o valor "###19$%96%%%"
  Entao valido o texto sem caracter especial "texto_NascDia" dentro do modal "frame_modal"
  E valido o texto sem caracter especial "texto_NascMes" dentro do modal "frame_modal"
  E valido o texto sem caracter especial "texto_NascAno" dentro do modal "frame_modal"

#10/04 - FMDPADT-169
@TelefoneCaracEsp @as
Cenario: Validar funcionalidade campo Telefone de Contato - Caract. Esp
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  E que eu insiro dentro do modal "frame_modal" no campo "texto_ddd" o valor "###1@@1%%%"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_numero" o valor "###9724%%38097##%"
  Entao valido o texto sem caracter especial "texto_ddd" dentro do modal "frame_modal"
  E valido o texto sem caracter especial "texto_numero" dentro do modal "frame_modal"

#10/04 - FMDPADT-170
@TelefoneMax @as
Cenario: Validar funcionalidade campo Telefone de Contato - Limite de caracter (Max)
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  E que eu insiro dentro do modal "frame_modal" no campo "texto_ddd" o valor "11112434323"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_numero" o valor "9724380973425432"
  Entao valido a existencia de somente "2" caracteres no campo "texto_ddd" dentro do modal "frame_modal"
  E valido a existencia de somente "9" caracteres no campo "texto_numero" dentro do modal "frame_modal"

#10/04 - FMDPADT-171
@DigiteCNPJ @as
Cenario: Validar funcionalidade campo Digite seu CNPJ
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  E eu clico dentro do modal "frame_modal" no botao "rb_pessoa_juridica"
  Quando que eu insiro dentro do modal "frame_modal" no campo "campo_cnpj" o valor "60020916000135"
  E eu clico dentro do modal "frame_modal" no botao "texto_ddd_pj"
  Entao valido a existencia do elemento "label_cnpj_valido" dentro do modal "frame_modal"

#10/04 - FMDPADT-172
@DigiteCNPJcaracEsp @as
Cenario: Validar funcionalidade campo Digite seu CNPJ - Caracter especial
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  E eu clico dentro do modal "frame_modal" no botao "rb_pessoa_juridica"
  Quando que eu insiro dentro do modal "frame_modal" no campo "campo_cnpj" o valor "!!!60%%%"
  Entao valido o texto sem caracter especial "campo_cnpj" dentro do modal "frame_modal"

#10/04 - FMDPADT-173
@DigiteCNPJLimiteMax
Cenario: Validar funcionalidade campo: Digite seu CNPJ - Limite de caracter (Max)
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  E eu clico dentro do modal "frame_modal" no botao "rb_pessoa_juridica"
  Quando que eu insiro dentro do modal "frame_modal" no campo "campo_cnpj" o valor "7341296300017645523653"
  Entao valido a existencia de somente "14" caracteres no campo "campo_cnpj" dentro do modal "frame_modal"

#10/04 - FMDPADT-174
@CNPJLimiteMin
Cenario:  Validar funcionalidade campo: Digite seu CNPJ - Limite de caracter (Min)
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_meu_email"
  E eu clico dentro do modal "frame_modal" no botao "rb_pessoa_juridica"
  Quando que eu insiro dentro do modal "frame_modal" no campo "texto_ddd_pj" o valor "1"
  E eu clico dentro do modal "frame_modal" no botao "campo_cnpj"
  Entao valido a existencia do elemento "imagem_campo_invalido" dentro do modal "frame_modal"

#10/04 - FMDPADT-175
@BotaoContinuar
Cenario: Validar funcionalidade do botão Continuar - Campos Obrigatorios
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_minha_senha_modal"
  Quando eu clico dentro do modal "frame_modal" no botao "botao_confirmar"
  Entao valido a existencia do elemento "imagem_campo_invalido" dentro do modal "frame_modal"


#12/04 - FMDPADT-176
@BotaoContinuarCampoObrigatorio
Cenario: Validar funcionalidade do botao Continuar
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_minha_senha_modal"
  E que eu insiro dentro do modal "frame_modal" no campo "campo_informe_email" o valor "guilhermeteste10@groove.tech"
  E que eu insiro dentro do modal "frame_modal" no campo "texto_Conf_Email" o valor "guilhermeteste10@groove.tech"
  Quando eu clico dentro do modal "frame_modal" no botao "botao_ConcluirPgto"
  Entao visualizo a exibicao da mensagem "mensagem_esqueci_minha_senha_modal" dentro do modal "frame_modal" no elemento "label_esqueci_minha_senha"

#12/04 - FMDPADT-177
@BotaoFecharModal
Cenario: Validar funcionalidade do botao Fechar
  Dado que acesso a pagina de "login"
  E eu clico no link "link_esqueci_minha_senha_modal"
  Quando eu clico dentro do modal "frame_modal" no botao "botao_fechar_modal_esqueci_senha"
  Entao visualizo o modal "frame_modal_indereco" fechado

#12/04 - FMDPADT-178
@ValidarMsgRecuperarSenha
Cenario: Validar exibição da mensagem para recuperar senha
  Dado que acesso a pagina de "login"
  Quando eu clico no link "link_esqueci_minha_senha_modal"
  Entao visualizo a exibicao da mensagem "mensagem_esqueci_minha_senha_modal" dentro do modal "frame_modal" no elemento "label_esqueci_minha_senha"

#12/04 - FMDPADT-179
@ValidarNomeDadosValidos
Cenario: Validar funcionalidade em dados Pessoais do campo Nome Completo - dados Validos
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo "texto_NomeCompleto" o valor "guilherme teste"
  E eu clico no botao "texto_Cpf"
  Entao valido a existencia do elemento "imagem_campo_valido"
#
#12/04 - FMDPADT-180
@ValidarRadioButtonNao
Cenario: Validar o radio - Não, essa é a minha primeira compra
  Dado que acesso a pagina de "login"
  Quando eu seleciono o radio button "primeiraCompra"
  Entao valido o campo "campo_Senha_desabilitado" desabilitado

#12/04 - FMDPADT-181
@ValidarNomeDadoLimite
Cenario: Validar funcionalidade em dados Pessoais do campo Nome Completo - Limite de dados
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo "texto_NomeCompleto" o valor "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbb"
  Entao valido a existencia de somente "50" caracteres no campo "texto_NomeCompleto"

#12/04 - FMDPADT-182
@ValidaCaracterEspecial
Cenario: Validar funcionalidade em dados Pessoais do campo Numero - Caracter especial (Telefone 2)
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo "texto_Phone2" o valor "##4205@@@50&&9¨*2()"
  Entao valido o texto sem caracter especial "texto_Phone2"

#12/04 - FMDPADT-184
@ValidaLinkAddOutro
Cenario: Validar funcionalidade em dados Pessoais do hiperlink + Adicionar outro
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu clico no link "link_adicionar_outro_telefone"
  Entao valido a existencia do elemento "campo_telefone3"

#################### SPRINT 6 ##############################

#FMDPADT-185
@validarDataValida
Cenario: Validar funcionalidade em dados Pessoais do campo Data Nasc - Data valida
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu insiro no campo "texto_NascDia" o valor "21"
  E eu insiro no campo "texto_NascMes" o valor "05"
  Quando eu insiro no campo "texto_NascAno" o valor "1998"
  Entao valido a existencia do elemento "label_data_nasc_valido"

#FMDPADT-186 #FMDPADT-187
@validarCamposDataNasc
Esquema do Cenario: Validar funcionalidade em dados Pessoais do campo: Data Nasc - Data futura/Data Invalida
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  E eu insiro no campo "texto_NascDia" o valor <dia>
  E eu insiro no campo "texto_NascMes" o valor <mes>
  Quando eu insiro no campo "texto_NascAno" o valor <ano>
  E eu clico no botao "texto_Cpf"
  Entao visualizo a exibicao da mensagem <msg> no elemento "label_campo_invalido"

  Exemplos:
  | dia  | mes  |  ano   |               msg              |
  | "21" | "05" | "2001" |     "mensagem_data_futura"     |
  | "01" | "01" |  "01"  | "mensagem_nascimento_invalido" |

#FMDPADT-188
@DataNascCaracterEsp
Cenario: Validar funcionalidade em dados Pessoais do campo Data Nasc - Caract. Esp
    Dado que acesso a pagina de "login"
    E eu seleciono o radio button "primeiraCompra"
    E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
    E eu clico no botao "botao_ContinuarLogin"
    E eu insiro no campo "texto_NascDia" o valor "#&!2@1¨%"
    E eu insiro no campo "texto_NascMes" o valor "#&!0@1¨%"
    Quando eu insiro no campo "texto_NascAno" o valor "#&!20@0¨%"
    Entao valido o texto sem caracter especial "texto_NascDia"
    E valido o texto sem caracter especial "texto_NascMes"
    E valido o texto sem caracter especial "texto_NascAno"

#FMDPADT-189
@DadosDeAcesso
Cenario: Validar exibição do texto dados de Acesso ao
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  Quando eu clico no botao "botao_ContinuarLogin"
  Entao visualizo a exibicao da mensagem "mensagem_dados_de_acesso" no elemento "label_dados_de_acesso"

#FMDPADT-190  FMDPADT-193  FMDPADT-198
@CamposValidosInvalidos
Esquema do Cenario: Validar funcionalidade em dados de acesso do campo Email/Confirmar Email/Senha - Valido
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo <campo> o valor <email>
  E clico em "texto_conf_senha"
  Entao valido a existencia do elemento <elemento>

  Exemplos:
  |             email             |         campo         |        elemento         |
  | "guilhermeteste80@gmail.com"  | "campo_informe_email" | "imagem_campo_valido"   |
  | "guilhermeteste1@groove.tech" |  "texto_Conf_Email"   | "imagem_campo_valido"   |
  |          "teste2018"          |     "campo_senha"     |  "imagem_campo_valido"  |

#FMDPADT-192 FMDPADT-195
@EmailLimiteCaracter
Esquema do Cenario: Validar funcionalidade em dados de acesso do campo Email/Confirmar Email - Limite de caracter (Max)
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo <campo> o valor <valor>
  Entao valido a existencia de somente <qtd> caracteres no campo <campo>

  Exemplos:
    |         campo         |                        valor                              | qtd  |
    | "campo_informe_email" | "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbb" | "50" |
    |   "texto_Conf_Email"  | "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbb" | "50" |

#FMDPADT-196 FMDPADT-197
@EmailConfirmarEmailMin
Esquema do Cenario: Validar funcionalidade em dados de acesso do campo Email/Confirmar Email - Limite de caracter (Min)
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo <campo> o valor <valor>
  E clico em "campo_senha"
  Entao visualizo a exibicao da mensagem "mensagem_email_invalido" no elemento "label_campo_invalido"

  Exemplos:
  |         campo         |  valor  |
  | "campo_informe_email" |  "a@a." |
  |  "texto_Conf_Email"   |  "a@a." |

#FMDPADT-191 FMDPADT-194
Esquema do Cenario: Validar funcionalidade em dados de acesso do campo Email/Confirmar Email/Senha - Invalido
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo <campo> o valor <email>
  E clico em "texto_conf_senha"
  Entao visualizo a exibicao da mensagem <msg> no elemento "label_campo_invalido"

  Exemplos:
  |        campo          |         email         |              msg               |
  | "campo_informe_email" | "guilhermeteste@.com" |   "mensagem_email_invalido"    |
  |  "texto_Conf_Email"   |  "guilh@groove.tech"  | "mensagem_conf_email_invalido" |

#FMDPADT-199
@SenhaLimiteCaracteres
Cenario: Validar funcionalidade em dados de acesso do campo Senha - Limite de caracteres
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "campo_email" o valor "guilhermeteste1@groove.tech"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu insiro no campo "campo_senha" o valor "12345678901234567890123456"
  E clico em "texto_conf_senha"
  Entao valido a existencia do elemento "imagem_campo_invalido"

#FMDPADT-200
@ValidarBotaoContinuar
Cenario: Validar funcionalidade em dados de acesso do botao Continuar
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  E preencho o formulário de cadastro
  Quando eu clico no botao "botao_Continuar"
  Entao visualizo meu "nome" no topo da tela inicial

#FMDPADT-201
@ContinuarCamposObrigatorios
Cenario: Validar funcionalidade em dados de acesso do botão Continuar - Campos Obrigatorios
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu clico no botao "botao_Continuar"
  Entao valido a existencia do elemento "imagem_campo_invalido"

#FMDPADT-202 FMDPADT-203 FMDPADT-205 FMDPADT-206
@RazaoSocialSiteDadosValidos
Esquema do Cenario:Validar funcionalidade em dados da Empresa do campo Razao Social/Site/nome fantasia/inscricao estadual - dados Validos
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando eu insiro no campo <campo> o valor <valor>
  E clico em "texto_conf_senha"
  Entao valido a existencia do elemento "imagem_campo_valido"

  Exemplos:
  |           campo            |             valor              |
  |    "campo_razao_social"    |            "G&T14"             |
  |    "campo_nome_fantasia"   |            "G&T14"             |
  |        "texto_site"        | "https://www.viavarejo.com.br" |
  | "texto_inscricao_estadual" |            "52371"             |

#FMDPADT-204
@CadastroPJ
Cenario: Validar funcionalidade cadastro PJ
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  E preencho o formulário de cadastro PJ
  Quando eu clico no botao "botao_confirmar"
  Entao visualizo meu "nome" no topo da tela inicial

#FMDPADT-207
@RemoverTelefone
Cenario: Validar funcionalidade em dados Pessoais do hiperlink - Remover telefone
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  Quando eu clico no link "link_remover_telefone_pf"
  Entao visualizo o texto "texto_telefone2" desabilitado

############################# SPRINT 7 ###########################
#FMDPADT-209 FMDPADT-215
@TelefoneCombo
Esquema do Cenario: Validar funcionalidade em dados Pessoais do campo Telefone - Combo
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  Quando seleciono o "1" valor dentro do combobox <combobox>
  Entao visualizo o <texto> do combobox <combobox> selecionado

  Exemplos:
  |    texto    |       combobox       |
  |  "Celular"  | "combobox_telefone1" |
  | "Comercial" | "combobox_telefone2" |

#FMDPADT-217
@InscricaoEstadualCombo
Cenario: Validar funcionalidade em dados da Empresa do campo Inscrição Estadual - Estado - Combobox
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando seleciono o "4" valor dentro do combobox "combobox_inscricao_estudal"
  Entao visualizo o "BA" do combobox "combobox_inscricao_estudal" selecionado

#FMDPADT-218 FMDPADT-219
@CampoRSeNF
Esquema do Cenario: Validar funcionalidade em dados da Empresa do campo Razao Social/Nome Fantasia - Caracter especial
  Dado que acesso a pagina de "login"
  E eu seleciono o radio button "primeiraCompra"
  E eu insiro no campo "texto_Email" o valor "randomEmail"
  E eu clico no botao "botao_ContinuarLogin"
  E eu clico no botao "pessoa_juridica"
  Quando eu insiro no campo <campo> o valor "G&T14$"
  E eu clico no botao "campo_informe_email"
  Entao valido a existencia do elemento "imagem_campo_valido"

  Exemplos:
  |         campo         |
  |  "campo_razao_social" |
  | "campo_nome_fantasia" |
