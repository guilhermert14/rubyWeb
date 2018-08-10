Quando(/^seleciono o "([^"]*)" valor dentro do combobox "([^"]*)"$/) do |index, elemento|
 @common.seleciono_combobox_index(elemento, index)
end

Entao(/^capturo valor no campo "([^"]*)"$/) do |elemento|
  $valor_texto = @common.captura_valor_campo(elemento)
end

Entao(/^visualizo o "([^"]*)" do combobox "([^"]*)" selecionado$/) do |texto, combobox|
@common.verifica_texto_combobox_selecionado(texto, combobox)
end
