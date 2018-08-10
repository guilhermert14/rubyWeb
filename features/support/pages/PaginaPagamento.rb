#Encoding
class PaginaPagamento

  include RSpec::Matchers
  include Capybara::DSL

  def seleciona_forma_pagamento(formaPagamento)
    assert_selector(".paymentMethods", wait: 25, visible: true)
    find(EL["el_#{formaPagamento}"]['classe'], text: EL["el_#{formaPagamento}"][formaPagamento], wait: 20).click
  end

  def preenche_um_cartao_credito(bandeira = "master", parcela = 1)
    preenche_cartao_credito("cartao_um", 0, bandeira)
    all(EL["cartao_um"]['texto_QtdParcelas'], wait: 15)[0].set(parcela)
    # Common.new.clica_elemento("botao_ConcluirPgto")
  end


  def finaliza_debito(tipo_debito)
    case tipo_debito

      when "itau"
        Common.new.clica_elemento("debito_itau")
        sleep 1
        Common.new.clica_elemento("botao_ConcluirPgto")
      when "visa"
        Common.new.clica_elemento("debito_visa")
        sleep 1
        Common.new.clica_elemento("botao_ConcluirPgto")
      when "maestro"
        Common.new.clica_elemento("debito_maestro")
        sleep 1
        Common.new.clica_elemento("botao_ConcluirPgto")
    end
  end

  def preenche_dois_cartoes_credito(bandeira = "master", parcela = 1)
    assert_selector(EL['utilizar_dois_cartoes'], wait: 15)
    sleep 1
    Common.new.clica_elemento('utilizar_dois_cartoes')
    preenche_cartao_credito("cartao_um", 0, bandeira)
    all(EL["cartao_um"]['texto_QtdParcelas'], wait: 15)[0].set(parcela)
    # assert_selector(EL['cartao_dois']['texto_NomeTitular'], wait:15)
    # preenche_cartao_credito("cartao_dois", 1, bandeira)
    Common.new.clicar_inserir_valor("texto_cartao_dois", "4111111111111111")
    Common.new.seleciono_combobox_index("texto_val_mes_dois", 4)
    Common.new.seleciono_combobox_index("texto_val_ano_dois", 4)
    Common.new.clicar_inserir_valor("texto_nome_cartao_dois", "Teste Teste")
    Common.new.clicar_inserir_valor("texto_Cvv_dois", "324")
    all(EL["cartao_dois"]['texto_QtdParcelas'], wait: 15)[1].set(parcela)
    #Common.new.clica_elemento("rdEnderecoSim")
    Common.new.clica_elemento("botao_ConcluirPgto")
  end

  def preencho_boleto_cartao(bandeira = "master", parcela = 1)
    assert_selector(EL['utilizar_dois_cartoes'], wait: 15)
    Common.new.clica_elemento('utilizar_boleto_cartao')
    preenche_cartao_credito("cartao_um", 0, bandeira)
    all(EL["cartao_um"]['texto_QtdParcelas'], wait: 15)[0].set(parcela)
  end



  def preenche_cartao_credito(tipo_cartao,index = 0, tipo_dado)
    dados = CARTAO[:"#{tipo_dado}"]
    sleep(5)
    all(EL[tipo_cartao]['texto_NrCartao'], wait: 15)[index].set(dados[:numero])
    all(EL[tipo_cartao]['texto_NomeTitular'], wait: 15)[index].set(dados[:nome])
    # all(EL[tipo_cartao]['texto_ValAno'], wait: 15)[index].all("option", text:dados[:dtValAno].to_i).click
    all(EL[tipo_cartao]['texto_ValAno'], wait: 15)[index].all(:option, dados[:dtValAno].to_i)[index].select_option
    all(EL[tipo_cartao]['texto_ValMes'], wait: 15)[index].all("option")[dados[:dtValMes].to_i].select_option
    all(EL[tipo_cartao]['texto_Cvv'], wait: 15)[index].set(dados[:cvv]) if dados[:cvv] != ""
  end

  def seleciona_parcelas(qtd, tipo_cartao, index = 0)
    # sleep 1
    assert_no_selector('input[disabled="disabled"]', wait: 15, visible: true)
    # unless has_selector?(EL['campo_des_parcela'])
    all(EL[tipo_cartao]['texto_QtdParcelas'], wait: 15)[index].set(qtd)
    # end
    #find(EL["cartao_um"]['listParcelas'], wait: 15).click
    #find(EL["cartao_um"]['listParcelas'], wait: 15).all(:option, text: "x")[qtd.to_i-1].select_option
  end

  def pagar_cartaocredito_responsivo_mp
    assert_selector
  end
  #12/02/2017 - Juliana Rossi - Massa para pagamento responsivo mp
  @numeros_cartoes = {
    'visa' => '4024007169900114',
    'master' => '5587136716372968',
    'hipercard' => '3841001111222233334',
    'gpa' => '5274050000000003',
    'Elo' => '6363689262635244',
    'Diners' => '36920076710695',
    'amex' => '376441091652018'
  }

  @pagamento_cartao = {
    'val_mes' => %w[01 02 03 04 05 06 07 08 09 10 11 12].sample,
    'val_ano' => %w[2019 2020 2021 2022 2023 2024].sample,
    'name' => MASSA['fullName'],
    'cvv' => %w[411 123 332 558 220 550].sample,
    'cvv_amex' => %w[4111 1231 3321 5581 2201 5501].sample,
    'parcelamento' => ['1x'],
    'parcelas' => %w[1 2].sample
  }
  #12/02/2017 - Juliana Rossi - Criado novo metodo para pagamento responsivo mp
  def pagar_um_cartao_r(bandeira_cartao)
    assert_selector(EL['label_cartao_credito_r'], wait: 15, visible: true)
    find(EL['label_cartao_credito_r']).click
    assert_selector(EL['texto_NrCartao_r'], wait: 15, visible: true)
    find(EL['texto_NrCartao_r']).set @numeros_cartoes[bandeira_cartao]
    find(EL['combobox_val_mes_r']).set @pagamento_cartao['val_mes']
    find(EL['combobox_val_ano_r']).set @pagamento_cartao['val_ano']
    find(EL['texto_NomeTitular_r']).set @pagamento_cartao['name']
    find(EL['texto_Cvv_r']).set @pagamento_cartao['cvv'] if bandeira_cartao != 'amex'
    find(EL['texto_Cvv_r']).set @pagamento_cartao['cvv_amex'] if bandeira_cartao == 'amex'
    find(EL['combobox_parcelas_r']).set @pagamento_cartao['parcelamento']
    find(EL['botao_Finalizar_Compra_r']).click
  end
  #12/02/2017 - Juliana Rossi - Criado novo metodo para pagamento responsivo mp
  def pagar_com_boleto_responsivo_mp
    #pendente desenvolvimento
    assert_selector(EL['label_cartao_credito_r'], wait: 15, visible: true)
    find(EL['label_boleto_r']).click
    assert_selector(EL['botao_Finalizar_Compra_r'], wait: 15, visible: true)
    find(EL['botao_Finalizar_Compra_r']).click
  end
  #12/02/2017 - Juliana Rossi - Criado novo metodo para pagamento responsivo mp
  def pagar_com_debito_responsivo_mp(bandeira_debito)
    assert_selector(EL['label_cartao_credito_r'], wait: 15, visible: true)
    find(EL['label_boleto_r']).click
    assert_selector(EL['botao_Finalizar_Compra_r'], wait: 15, visible: true)
    find(EL['botao_Finalizar_Compra_r']).click
  end
end
