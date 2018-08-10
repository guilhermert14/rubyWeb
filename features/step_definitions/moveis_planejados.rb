Então("o sistema apresenta modal de móveis planejados, com campos CEP habilitado para impressão") do
    @assertPage.valida_existencia_elemento(EL['modal_moveis_planejados'])
    @common.clicar_inserir_valor('texto_cep_moveis_planejados',CEP[:cepValido][:cep])
end

Então("insiro no campo {string} o valor {string}") do |campo, cep|
  @paginaEntrega.gera_cep(cep)
  @common.clicar_inserir_valor(campo, $cep_gerado)
end

Quando(/^seleciono a cor "([^"]*)"$/) do |opcao|
  opcao = opcao.to_i - 1
  @common.clica_elemento("botao_+_cor")
  find(EL['lista_cores']).all('li')[opcao].click
end

Quando(/^seleciono o acessorio "([^"]*)"$/) do |opcao|
  opcao = opcao.to_i - 1
  @common.clica_elemento("botao_+_acessorio")
  find(EL['lista_acessorios']).all('li')[opcao].click
end

Quando(/^seleciono o tipo de material "([^"]*)"$/) do |opcao|
  opcao = opcao.to_i - 1
  @common.clica_elemento("botao_+_material")
  find(EL['lista_material']).all('li')[opcao].click
end