
Entao(/^faço a navegação pelo wizard com as opçoes aleatórias$/) do
  @assertPage.valida_visualizacao_wizard
  @common.clica_elemento("botao_comecar_wizard")
  @paginaProduto.navega_aleatoriamente_wizard
  @common.clica_elemento("botao_finalizar_wizard")
end

Entao(/^começo a navegação pelo wizard com as opçoes aleatórias$/) do
  @assertPage.valida_visualizacao_wizard
  @common.clica_elemento("botao_comecar_wizard")
  @paginaProduto.navega_aleatoriamente_wizard
end

Entao(/^clico em repetir a navegação$/) do
  @common.clica_elemento("botao_refazer_wizard")
end

Entao(/^clico em fechar$/) do
  @common.clica_elemento("botao_fechar_wizard")
end

Entao(/^faço a navegação pelo widget com as opçoes aleatórias$/) do
  @assertPage.valida_visualizacao_widget
  @paginaProduto.navega_aleatoriamente_widget
  @common.clica_elemento("botao_buscar_widget")
end

Entao(/^clico em ver todas as ofertas$/) do
  if has_selector?(EL["botao_todas_ofertas_widget"])
    @common.clica_elemento("botao_todas_ofertas_widget")
  elsif has_selector?(EL["botao_todas_ofertas_widget_medida"])
    @common.clica_elemento("botao_todas_ofertas_widget_medida")
  end
end

Entao(/^clico em buscar por medida$/) do
  @common.clica_elemento("botao_widget_medida")
  sleep(4)
end
