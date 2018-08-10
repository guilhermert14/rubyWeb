Quando(/^preencho os dados de endereco$/) do
  @paginaEndereco.cadastra_endereco_sucesso
  sleep(3)
end

Dado(/^realizo o cadastro de endereco$/) do
  @paginaEndereco.realizo_novo_endereco
end

Dado(/^preencho o formulário de cadastro PJ$/) do
  @paginaEndereco.realizo_endereco_PJ
end
