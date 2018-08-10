Dado(/^realizo login com "([^"]*)"$/) do |arg1|
  dados = LOGIN[:usuarioValido]
  @paginaLogin.login(dados[:email],dados[:senha])
end

Quando(/^preencho a forma de pagamento "([^"]*)"$/) do |formaPagamento|
  if formaPagamento == "boleto"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    sleep(2)
    @common.clica_elemento("botao_ConcluirPgto")
  elsif formaPagamento.include?("debito_online")
    tipo_debito = formaPagamento.split("_")
    assert_selector('.paymentMethods', wait: 15, visible: true)
    sleep (1)
    @paginaPagamento.seleciona_forma_pagamento(tipo_debito[0])
    assert_selector('.debitoContent', wait: 15, visible: true)
    @paginaPagamento.finaliza_debito(tipo_debito[2])
  elsif formaPagamento.include?("credito")
    bandeira = formaPagamento.split("_")
    formaPagamento = "#{bandeira[0]}_#{bandeira[1]}_#{bandeira[2]}"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}", bandeira[3])
    @common.clica_elemento("botao_ConcluirPgto")
  elsif formaPagamento.include?("boleto_cartao")
    @paginaPagamento.preencho_boleto_cartao
    @common.clica_elemento("botao_ConcluirPgto")
  elsif formaPagamento.include?("paypal")
    assert_selector(EL["botao_Paypal"], wait: 15, visible: true)
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @common.clica_elemento("botao_ConcluirPgto")
    @assertPage.valida_existencia_elemento('main[id="main"]')
  elsif formaPagamento.include?("visa_checkout")
    assert_selector(EL["botao_visa_checkout"], wait: 15, visible: true)
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @common.clica_elemento("botao_finalizar_visa_checkout")
    @assertPage.valida_existencia_elemento("#vcop-src-frame")
  else
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}")
    @common.clica_elemento("botao_ConcluirPgto")
  end
end

Entao(/^realizo a finalizacao da compra com "([^"]*)" e garantia "([^"]*)"$/) do |formaPagamento, garantia|
  @paginaGarantia.seleciona_garantia(garantia)
  @paginaGarantia.continua_garantia
  sleep(3)
  @common.clica_elemento("botao_ConcluirCompra")
  sleep(5)
  @common.clica_elemento("botao_Concluir")
  if formaPagamento == "boleto"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    sleep(3)
    @common.clica_elemento("botao_ConcluirPgto")
  elsif formaPagamento.include?("debito_online")
    tipo_debito = formaPagamento.split("_")
    @paginaPagamento.seleciona_forma_pagamento(tipo_debito[0])
    @paginaPagamento.finaliza_debito(tipo_debito[2])
  elsif formaPagamento.include?("credito")
    bandeira = formaPagamento.split("_")
    formaPagamento = "#{bandeira[0]}_#{bandeira[1]}_#{bandeira[2]}"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}", bandeira[3])
    @common.clica_elemento("botao_ConcluirPgto")
  else
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}")
    @common.clica_elemento("botao_ConcluirPgto")
  end
  @assertPage.valida_finalizacao_compra
  #@assertPage.send("valida_finalizacao_compra_#{formaPagamento}")
end

Entao(/^realizo a finalizacao da compra com "([^"]*)" e seguro "([^"]*)"$/) do |formaPagamento, seguro|
  @paginaGarantia.seleciona_seguro(seguro)
  @paginaGarantia.continua_garantia
  sleep(2)
  @common.clica_elemento("botao_ConcluirCompra")
  sleep(5)
  @common.clica_elemento("botao_Concluir")
  if formaPagamento == "boleto"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    sleep(3)
    @common.clica_elemento("botao_ConcluirPgto")
  elsif formaPagamento.include?("debito_online")
    tipo_debito = formaPagamento.split("_")
    @paginaPagamento.seleciona_forma_pagamento(tipo_debito[0])
    @paginaPagamento.finaliza_debito(tipo_debito[2])
  elsif formaPagamento.include?("credito")
    bandeira = formaPagamento.split("_")
    formaPagamento = "#{bandeira[0]}_#{bandeira[1]}_#{bandeira[2]}"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}", bandeira[3])
    @common.clica_elemento("botao_ConcluirPgto")
  else
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}")
    @common.clica_elemento("botao_ConcluirPgto")
  end
  @assertPage.send("valida_finalizacao_compra_#{formaPagamento}",seguro)
end

Entao(/^realizo a finalizacao da compra pela tela de enderecos com "([^"]*)" e garantia "([^"]*)"$/) do |formaPagamento, garantia|
  @paginaGarantia.seleciona_garantia(garantia)
  # @paginaGarantia.continua_garantia
  @common.clica_elemento("botao_ConcluirCompra")
  sleep(5)
  @common.clica_elemento("botao_Concluir")
  if formaPagamento == "boleto"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    sleep(3)
    @common.clica_elemento("botao_ConcluirPgto")
  elsif formaPagamento.include?("debito_online")
    tipo_debito = formaPagamento.split("_")
    @paginaPagamento.seleciona_forma_pagamento(tipo_debito[0])
    @paginaPagamento.finaliza_debito(tipo_debito[2])
  elsif formaPagamento.include?("credito")
    bandeira = formaPagamento.split("_")
    formaPagamento = "#{bandeira[0]}_#{bandeira[1]}_#{bandeira[2]}"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}", bandeira[3])
    @common.clica_elemento("botao_ConcluirPgto")
  else
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}")
    @common.clica_elemento("botao_ConcluirPgto")
  end
  @assertPage.valida_finalizacao_compra
#  @assertPage.send("valida_finalizacao_compra_#{formaPagamento}")
end

Dado(/^adiciono o item ao carrinho pelo metodo "([^"]*)" e servico "([^"]*)"$/) do |entrega, servico|
  @common.adiciona_item_carrinho(entrega,servico)
end

Dado(/^adiciono o item ao carrinho pela forma de entrega "([^"]*)"$/) do |forma|
  @common.forma_entrega(forma)
end

Quando(/^seleciono no porteiro o item "([^"]*)"$/) do |tipo_item|
  @paginaCarrinho.seleciona_item_porteiro(tipo_item)
end

Entao(/^seleciono o endereco e forma de entrega "([^"]*)"$/) do |entrega|
  @paginaEntrega.seleciona_tipo_entrega(entrega,"sucesso")
end

Entao(/^calculo o frete para "([^"]*)"$/) do |cep|
  sleep(1)
  @paginaEntrega.calcula_frete(cep)
  sleep(3)
  assert_text("prazo", wait: 25)
end

Entao(/^eu adiciono a garantia de "([^"]*)" no carrinho$/) do |garantia|
  @paginaGarantia.seleciona_garantia_carrinho(garantia)
end

Dado(/^seleciono a forma de entrega "([^"]*)" com endereco "([^"]*)"$/) do |formaEntrega, endereco|
  @paginaEntrega.seleciona_tipo_entrega(formaEntrega,endereco)
end

Entao(/^escolho o meio de pagamento "([^"]*)" em "([^"]*)" parcelas$/) do |formaPagamento, parcelas|
  if formaPagamento == "boleto"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    sleep(3)
    @common.clica_elemento("botao_ConcluirPgto")
  elsif formaPagamento.include?("debito_online")
    tipo_debito = formaPagamento.split("_")
    @paginaPagamento.seleciona_forma_pagamento(tipo_debito[0])
    @paginaPagamento.finaliza_debito(tipo_debito[2])
  elsif formaPagamento.include?("credito")
    bandeira = formaPagamento.split("_")
    formaPagamento = "#{bandeira[0]}_#{bandeira[1]}_#{bandeira[2]}"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}", bandeira[3],parcelas)
    @common.clica_elemento("botao_ConcluirPgto")
    @common.clica_elemento("botao_ConcluirPgto") if has_selector?(EL['botao_ConcluirPgto'])
  else
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
    @paginaPagamento.send("preenche_#{formaPagamento}")
    @common.clica_elemento("botao_ConcluirPgto")
  end
end
Quando(/^eu seleciono o produto desejado adicionando o servico de instalacao$/) do
  @paginaBusca.seleciona_produto(0)
  @common.clica_elemento("radio_Seleciona_Servico")
end

Entao(/^seleciono o seguro "([^"]*)"$/) do |seguro|
  @paginaGarantia.seleciona_seguro(seguro)
  @paginaGarantia.continua_garantia
  sleep(3)
  @common.clica_elemento("botao_ConcluirCompra")
end

Entao(/^seleciono o tipo de entrega "([^"]*)"$/) do |tipo_entrega|
  @paginaEntrega.seleciona_tipo_entrega(tipo_entrega)
end

Quando(/^preencho os campos do cartao de credito com dados "([^"]*)"$/) do |dados|
    @paginaPagamento.seleciona_forma_pagamento("um_cartao_credito")
  if dados == "parcInvalida" || dados == "cartaoInvalido" || dados == "dadosInvalidos"
    @paginaPagamento.preenche_cartao_credito("cartao_um", 0, dados)
  else
    @paginaPagamento.preenche_cartao_credito("cartao_um", 0, dados)
    @paginaPagamento.seleciona_parcelas(1, "cartao_um")
  end
end

Dado(/^seleciono a forma de pagamento "([^"]*)"$/) do |formaPagamento|
  if formaPagamento == "boleto"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
  elsif formaPagamento.include?("debito_online")
    tipo_debito = formaPagamento.split("_")
    @paginaPagamento.seleciona_forma_pagamento(tipo_debito[0])
  elsif formaPagamento.include?("credito")
    bandeira = formaPagamento.split("_")
    formaPagamento = "#{bandeira[0]}_#{bandeira[1]}_#{bandeira[2]}"
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
  else
    @paginaPagamento.seleciona_forma_pagamento(formaPagamento)
  end

end
