Dado(/^que eu clico no botao "([^"]*)"$/) do |botao|
  sleep(3)
  @common.clica_elemento(botao)
end
