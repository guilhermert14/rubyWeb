Dado(/^eu clico no botao "([^"]*)" ,com index (\d+)$/) do |botao, index|
  @common.clica_elemento(botao, index.to_i)
end

Dado(/^eu seleciono o radio button "([^"]*)"$/) do |radioButton|
  sleep(2)
  find(:xpath, EL[radioButton], visible: true).click
end

Dado(/^eu seleciono o Checkbox "([^"]*)"$/) do |checkbox|
  @common.clica_elemento(checkbox)
end

Quando(/^eu clico no botao "([^"]*)"$/) do |botao|
  sleep (3)
  @common.clica_elemento(botao)
  page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
end

Quando(/^clico em "([^"]*)"$/) do |botao|
  @common.clica_elemento(botao)
end

Dado(/^na pagina principal, eu acesso a minha conta$/) do
  @common.clica_link("link_Meus_Pedidos")
end

Dado(/^eu avanco para a tela de mudanca de senha$/) do
  @common.clica_link("link_Meu_Perfil")
  @common.clica_elemento("botao_Alterar_Senha")
end

Quando(/^eu troco a antiga senha "([^"]*)" pela nova senha "([^"]*)"$/) do |senha_antiga, senha_nova|
  @paginaLogin.alteracao_de_senha_login(senha_antiga, senha_nova)
end

Quando(/^faço o login com tanto email "([^"]*)" e senha "([^"]*)"$/) do |email, senha|
  @menu.seleciona_login
  @paginaLogin.login(email, senha)
end

Então(/^preencho o formulário de cadastro$/) do
  @paginaRegistro.preencher_formulario
end

Dado(/^crio um usuario novo valido$/) do
  @common.clica_elemento("botao_CadastreSe")
  email = eval(MASSA['randomEmail'])
  @common.clicar_inserir_valor("texto_Email", email)
  find(:xpath, EL['primeiraCompra'], wait: 15).click
  @common.clica_elemento("botao_ContinuarLogin")
  @paginaRegistro.preencher_formulario
  @common.clica_elemento("botao_Salvar_Continuar")
  assert_selector(EL['link_sair'], wait: 15, visible:true)
end
