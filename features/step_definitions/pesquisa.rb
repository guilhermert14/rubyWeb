Dado(/^realizo a pesquisa "([^"]*)"$/) do |item|
  @paginaInicial.pesquisa_produto(item)
end

Quando(/^seleciono o produto desejado, adiciono ele ao carrinho$/) do
  @paginaBusca.seleciona_produto(0)
  @common.adiciona_item_carrinho("normal", "nao")
end

Entao(/^seleciono o produto desejado com garantia de "([^"]*)" e seguro para "([^"]*)"$/) do |garantia, seguro|
  unless has_text?("Vendido e entregue por", wait: 15)
    @paginaProduto.seleciona_produto
  end
  @common.clica_elemento("botao_Comprar")
  page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
  @paginaGarantia.seleciona_garantia(garantia) if garantia != "nao"
  @paginaGarantia.seleciona_seguro(seguro) if seguro != "nao"
  @paginaGarantia.continua_garantia
end
