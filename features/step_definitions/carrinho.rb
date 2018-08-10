# encoding: utf-8

Entao(/^valido a mensagem "([^"]*)" no campo "([^"]*)"$/) do |msg, campo|
 @assertPage.valida_exibicao_mensagem(campo, msg)
end

Quando("preencho os dados esqueci minha senha") do
  within_frame(EL['frame_esqueci_senha']) do
  find(EL["campo_email"]).set("vinicius.rosa@cnova.com")
  find(EL["campo_confirmar_esqueci_senha"]).set("vinicius.rosa@cnova.com")
  end
end

Entao(/^valido o campo "([^"]*)"$/) do |campo|
  assert_selector(EL[campo], wait:20, visible:true)
end

Mas(/^desisto da compra$/) do
  @paginaCarrinho.reabrir_navegador
end

Dado(/^eu insiro o cupom "([^"]*)" no campo "([^"]*)"$/) do |valor, campo|
  @common.clicar_inserir_valor(campo, valor)
  find(EL["botao_inserir_cupom"]).click
end
