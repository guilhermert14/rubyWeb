#language: pt
@meio_pagamento
Funcionalidade: Login
  Eu, como usuario do site, tento me logar com dados invalidos de email e senha.

  Contexto:
  Dado que acesso a pagina de "login"

Esquema do Cenario: Tentar logar com usuario invalido e senha correta
 Quando faço o login com email <email> e senha <senha> e "não limpar" o carrinho
 Entao visualizo a exibicao da mensagem <msg> no elemento <elemento>
Exemplos:
  |    email    |   senha    |            msg           |             elemento                |
  | "incorreto" | "invalida" | "formato_email_invalido" | "label_user_senha_formato_invalido" |
  |  "valido"   | "invalida" |  "email_senha_incorreto" |    "label_user_senha_incorreta"     |
  | "invalido"  | "invalida" |  "email_senha_incorreto" |    "label_user_senha_incorreta"     |
