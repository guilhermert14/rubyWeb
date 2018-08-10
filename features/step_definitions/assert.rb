Entao(/^valido a finalizacao da compra$/) do

  @assertPage.valida_finalizacao_compra
end

Entao(/^valido a mensagem de erro$/) do
  @assertPage.valida_login_sem_sucesso
end

Entao(/^valido a finalizacao da compra com "([^"]*)" e seguro "([^"]*)"$/) do |tipoValidacao, seguro|
  #@assertPage.valida_finalizacao_compra
  if  tipoValidacao.include?("credito")
    bandeira = tipoValidacao.split("_")
    tipoValidacao = "#{bandeira[0]}_#{bandeira[1]}_#{bandeira[2]}"
  end
    @assertPage.send("valida_finalizacao_compra_#{tipoValidacao}",seguro)
end

Entao(/^valido a finalizacao da compra com "([^"]*)" e entrega "([^"]*)"$/) do |tipoValidacao, tipoEntrega|
  @assertPage.valida_exibicao_mensagem("label_tipo_entrega",tipoEntrega)
end

Entao(/^valido a finalizacao da compra com "([^"]*)"$/) do |tipoValidacao|
  #@assertPage.valida_finalizacao_compra
  #@assertPage.send("valida_finalizacao_compra_#{tipoValidacao}")
   @assertPage.valida_finalizacao_compra

#  @assertPage.send("valida_finalizacao_compra_#{tipoValidacao}")

end

Entao(/^valido a finalizacao da compra com entrega "([^"]*)"$/) do |tipoEntrega|
  @assertPage.valida_exibicao_mensagem("label_tipo_entrega",tipoEntrega)
end

Entao(/^valido se a "([^"]*)" esta correta$/) do | url |
  if $site == "extra" && (url == "nossas_lojas" || url == "Artesanato" || url == "Eletrodomésticos" || url == "Cama, Mesa e Banho" || url == "Casa e Construção" || url == "Instrumentos Musicais" || url == "Joias" || url == "Linha Industrial" || url == "Moda" || url == "Papelaria" ||
    url == "Pet Shop" || url == "Produtos Importados")
    url_link = DATA["#{url}_ex"]
    url_link = url_link.gsub('bandeira', $site)
  elsif $site == "pontofrio" && (url == "Cama, Mesa e Banho" || url == "Casa e Construção" || url == "Eletrodomésticos" || url == "Linha Industrial" || url == "Papelaria" || url == "Produtos Importados" || url == "Instalações")
    url_link = DATA["#{url}_pf"]
    url_link = url_link.gsub('bandeira', $site)
  else
    url_link = DATA[url]
    url_link = url_link.gsub('bandeira', $site)
  end
  if url == "televendas"
    assert_text("Televendas")
  else
    @assertPage.valida_url(url_link)
  end
end

Entao(/^valido se a "([^"]*)" do footer esta correta$/) do | url |
  if $site == "extra" && (url == "Política de Troca e Devolução" || url == "Nota Fiscal Paulista" || url == "Termos e Condições de Uso" || url == "Quantidade de itens por pedido" || url == "Trabalhe Conosco" || url == "Palavras mais Buscadas")
    url_link = DATA["footer"]["#{url}_ex"]
    url_link = url_link.gsub('bandeira', $site)
  elsif $site == "pontofrio" && (url == "Atendimento para Internet ou Televendas" || url == "Nota Fiscal Paulista" || url == "Sobre a Entrega" || url == "Política de Troca e Devolução" || url == "Termos e Condições de Uso" || url == "Quantidade de itens por pedido" || url == "Seguro de Garantia Estendida Original" || url == "Palavras mais Buscadas" || url == "Nossas Lojas")
    url_link = DATA["footer"]["#{url}_pf"]
    url_link = url_link.gsub('bandeira', $site)
  else
    url_link = DATA["footer"][url]
    if url != "Trabalhe Conosco" && url != "Anuncie com a gente" && url != "Venda seus produtos nas Casas Bahia" && url != "Relação com Investidores" && url != "Via Varejo Ads" && url != "Atendimento Loja Física"
      url_link = url_link.gsub('bandeira', $site)
    end
  end
  if url == "televendas"
    assert_text("Televendas")
  else
    @assertPage.valida_url(url_link)
  end
end

Entao(/^valido a finalizacao da navegação do wizard$/) do
  @assertPage.valida_finalizacao_wizard
end

Entao(/^valido a tela inicial do wizard$/) do
  @assertPage.valida_inicio_wizard
end

Entao(/^valido a tela do primeiro passo do wizard$/) do
  @assertPage.valida_passo_um_wizard
end

Entao(/^valido a finalizacao da navegação do widget$/) do
  @assertPage.valida_finalizacao_widget
end

Entao(/^valido o resultado do widget$/) do
  @assertPage.valida_resultado_widget
end

Entao(/^visualizo meu "([^"]*)" no topo da tela inicial$/) do |nomeConta|
  has_selector?(EL["menuSaudacao"], wait: 15)
end

Entao(/^eu visualizo a pagina "([^"]*)"$/) do |pagina|
  assert_text(EL[pagina], wait:15)
end

Entao(/^eu visualizo a pagina de pagamento "([^"]*)"$/) do |pagina|
  @assertPage.valida_existencia_elemento(EL[pagina])
end

Entao(/^visualizo no carrinho a exibicao do item "([^"]*)"$/) do |tipo_item|
  if tipo_item == "carrinho"
    assert_selector("tr[data-idsku='#{$item_tipo[0]}']")
  else
    assert_selector("tr[data-idsku='#{$item_tipo[1]}']")
  end
end

Entao("visualizo a exibicao do porteiro") do
  within_frame("TB_iframeContent") do
    assert_text("Opções distintas de entrega")
  end
end

Entao(/^visualizo o botão "([^"]*)" na lista de mais opcoes$/) do |botao|
  @assertPage.valida_existencia_elemento(EL[botao])
end

Entao(/^visualizo a tela inicial$/) do
  assert_text("Meus Pedidos", wait:15)
end

Entao(/^visualizo a exibicao da menssagem "([^"]*)" dentro do modal "([^"]*)"$/) do |menssagem, modal|
  within_frame(EL[modal]) do
    has_selector?('.cepInvalido', text: MSG["mensagem_ofertas_optin"], wait: 15)
  end
end

Entao(/^não visualizo o botão "([^"]*)" na lista de mais opcoes$/) do |botao|
  @assertPage.valida_existencia_elemento(EL[botao])
end

Entao(/^não visualizo o elemento "([^"]*)"$/) do |elemento|
  @assertPage.valida_existencia_elemento(EL[elemento])
end

Entao(/^espero visualizar o botao 'Retirar' somente para casas bahia$/) do
  @assertPage.valida_botao_retira_lista_lojista
end

Entao(/^valido o popup de redirecionamento para o banco escolhido$/) do
  if $site.include?("extra")
    assert_selector(".wrapper.order.pgtoDebitoWraper")
  else
    within_frame("TB_iframeContent", wait: 15, visible: true) do
      assert_selector("input[value='Débito em Conta']", wait: 15, visible: true)
    end
  end
end

Entao(/^valido o popup "([^"]*)"$/) do |tipo_debito|
  case tipo_debito
  when "debito_online_itau"
    within_frame("TB_iframeContent", wait: 25, visible: true) do
      assert_selector("input[value='Débito em Conta']", wait: 15, visible: true)
    end
  when "debito_online_visa"
    @assertPage.valida_exibicao_mensagem("texto_bandeira_debito_online", "Visa Electron")
  when "debito_online_maestro"
    @assertPage.valida_exibicao_mensagem("texto_bandeira_debito_online", "Maestro")
  end
end

Entao(/^valido o "([^"]*)" "([^"]*)" na tela de pedido$/) do |servico,msgs|
  @assertPage.send("valida_exibicao_#{servico}",msgs)
end

Entao(/^visualizo a exibicao da mensagem "([^"]*)" no elemento "([^"]*)"$/) do |mensagem, elemento|
  @assertPage.valida_exibicao_mensagem(elemento,mensagem)
end



Entao(/^valido a existencia de somente "([^"]*)" caracteres no campo "([^"]*)"$/) do |qtd, campo|
  @assertPage.valida_quantidade_caracteres(campo, qtd)
end

Entao(/^valido a existencia de somente "([^"]*)" caracteres no campo "([^"]*)" dentro do modal "([^"]*)"$/) do |qtd, campo, modal|
  within_frame(EL[modal]) do
    @assertPage.valida_quantidade_caracteres(campo, qtd)
  end
end

Quando(/^valido a existencia do elemento "([^"]*)"$/) do |elemento|
  @assertPage.valida_existencia_elemento(EL[elemento])
end

Entao(/^valido a existencia do elemento "([^"]*)" dentro do modal "([^"]*)"$/) do |elemento, modal|
  within_frame(EL[modal]) do
    @assertPage.valida_existencia_elemento(EL[elemento])
  end
end

Quando(/^valido o campo "([^"]*)" desabilitado$/) do |campo|
  @assertPage.valida_existencia_elemento(EL[campo])
end

Entao(/^visualizo o texto "([^"]*)" desabilitado$/) do |texto|
@assertPage.visualizo_texto_desabilitado(EL[texto])
end

Entao(/^valido o texto sem caracter especial "([^"]*)"$/) do |campo|
  texto = find(EL[campo]).value
  @assertPage.valida_caractere_especial(texto)
end

Entao(/^valido o texto sem caracter especial "([^"]*)" dentro do modal "([^"]*)"$/) do |campo, modal|
  within_frame(EL[modal]) do
    texto = find(EL[campo]).value
    @assertPage.valida_caractere_especial(texto)
  end
end

Entao(/^visualizo o valor do desconto "([^"]*)" nominal aplicado sobre o valor do produto$/) do |valor_desconto|
  @assertPage.validar_valor_desconto_nominal(valor_desconto)
end

Entao(/^valido o valor total no campo "([^"]*)"$/) do |elemento|
  sleep (10)
  valor_novo = @common.captura_valor_campo(elemento)
  @assertPage.valida_string_diferentes(valor_novo, $valor_texto)
end

Então("o sistema apresenta modal de móveis planejados") do
  @assertPage.valida_existencia_elemento(EL['banner_moveis_planejados'])
end

Então("posso visualizar as demais informações disponíveis {string}") do |informacoes|
  @assertPage.valida_existencia_elemento(EL[informacoes])
end

Então(/^posso visualizar a imagem do "([^"]*)" selecionado$/) do |ambiente|
  @assertPage.valida_existencia_elemento(EL[ambiente])
end

Entao("visualizo a exibicao da mensagem {string}") do |mensagem|
  @assertPage.valida_existencia_elemento(EL[mensagem])
end

Entao(/^valido quantidade de sku$/) do
  @assertPage.valido_quantida_sku
end

Entao(/^valido a url de finalizacao da compra$/) do
  3.times{
    has_selector?('#blockMsg', visible: true)
    assert_selector('#blockMsg', visible: false)
  }
  url = DATA["finalizacao"]
  url = url.gsub('bandeira', $site)
  page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
  @assertPage.valida_url(url)
end
