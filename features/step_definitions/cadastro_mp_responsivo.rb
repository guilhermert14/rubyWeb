#encoding: utf-8
#Contexto
Dado("ter um novo cliente no site") do
  #16/02/18 - Juliana Rossi - Geração do novo cliente em: PaginaCadastro
  @paginaInicial.chamar_url #tentar implementar no Hooks
  @paginaInicial.fechar_banner_promocional #tentar implementar no Hooks
end

#steps
Quando("realizo o cadastro desse novo cliente {string}") do |tipo_cliente|
  pending # Write code here that turns the phrase above into concrete actions

end

Quando("realizo o cadastro desse novo cliente {string} na tela principal") do |tipo_cliente|
  @paginaLogin.acessar_pagina_login_home
  @paginaInicial.chamar_url_cadastro_responsivo #16/02/2018 - Juliana Rossi - temporario até implementação em Prod
  @paginaLogin.acessar_tela_cadastro_responsivo
  @paginaCadastro.cadastrar_dados_pessoais_pessoa_fisica_responsivo(NOVO_CLIENTE) if tipo_cliente == 'pessoa_fisica'
  @paginaCadastro.cadastrar_dados_pessoais_pessoa_juridica_responsivo(NOVO_CLIENTE) if tipo_cliente == 'pessoa_juridica'
  @paginaCadastro.cadastrar_dados_acesso_responsivo(NOVO_CLIENTE)
end

Quando("realizo o cadastro de endereço") do
  @paginaEndereco.cadastrar_endereco_responsivo(NOVO_CLIENTE)
end

Então("visualizo a tela de cadastro de endereço") do
  pending # Write code here that turns the phrase above into concrete actions
end
