class PaginaEntrega

    include RSpec::Matchers
    include Capybara::DSL

  def seleciona_tipo_entrega(entrega,dados_endereco="sucesso")
    # assert_selector(EL['radio_button_entrega_normal'], wait: 15, visible:true)
    assert_selector(".fEntrega", text:"Normal",wait: 15, visible:true)
    endereco = ENDERECO[:dados_endereco]

    case entrega
      when "Retira"
        assert_selector(".grp.tEntrega.pickup.on", wait: 15)
        find(EL['radio_button_entrega_retrira']).click
        find(EL['estado_retira']).find('option', text: "SP").click
        find(EL['regiao_retira']).find('option', text: "Capital").click
        find(EL['cidade_retira']).find('option', text: "o Paulo").click
        find(EL['bairro_retira']).find('option', text: "Cambuci").click
        find(EL['loja_retira']).find('option', text: "Casas Bahia").click
        # assert_selector('.map', wait:25)
        Common.new.clica_elemento("botao_continuar_endereco")
        # assert_selector('.map', wait:25)
      when "Agendada"
        assert_selector(".grp.tEntrega.agendada.on")
        find(EL['radio_button_entrega_agendada']).click
        #find(EL['agenda_data']).select(".ui-state-default", text: data)
        find(EL['agenda_horario']).select("07:00 - 12:00")
        Common.new.clica_elemento("botao_continuar_endereco")
      when "Expressa"
        assert_selector(".grp.tEntrega.expressa.on")
        find(EL['radio_button_entrega_expressa'], wait:15).click
        Common.new.clica_elemento("botao_continuar_endereco")
      when "SuperExpressa"
        assert_selector(".grp.tEntrega.urgente.on")
        find(EL['radio_button_entrega_super_expressa'], wait:15).click
        Common.new.clica_elemento("botao_continuar_endereco")
      when "Normal"
        assert_selector(".grp.tEntrega.normal.on", wait:15)
        sleep(2)
        find(EL['radio_button_entrega_normal'], wait:15).click
        Common.new.clica_elemento("botao_continuar_endereco")
      else
        Common.new.clica_elemento("botao_continuar_endereco")
    end
    #13/02/2017 - Juliana Rossi - Ajustado elemento .map, não estava sendo encontrado em todas as bandeiras
    assert_selector(EL['label_endereco'], wait:15)
    #Common.new.clica_elemento("botao_continuar_endereco")
    # assert_selector('.map', wait:25)
  end


  def garante_entrega_selecionada
    sleep(2)
    assert_selector(".fEntrega", wait:20)
    unless has_selector?(".grp.tEntrega.normal.on")
      find(:xpath, "//*[@name='IdEntregaTipoSelecionado' and @value='2']").click
    end
  end

  def calcula_frete(cep)
    if cep=="cepValido"
      zipCode = CEP[:cepValido]
    elsif cep=="cepInvalido"
      zipCode = CEP[:cepInvalido]
    else
      zipCode = CEP[:cepNumero]
    end
    if has_selector?(EL['texto_cep_carrinho'],wait: 25, visible:true)
      find(EL['texto_cep_carrinho'], wait: 15).set(zipCode[:cep])
    else
      find(EL['texto_cep'], wait: 15).set(zipCode[:cep])
    end
    if has_selector?(EL['botao_OkCalculoFrete_carrinho'])
      find(EL['botao_OkCalculoFrete_carrinho'], wait: 15).click
    else
      find(EL['botao_OkCalculoFrete'], wait: 15).click
    end
  end

  def gera_cep(cep)
      if cep=="cepValido"
        zipCode = CEP[:cepValido]
      elsif cep=="cepInvalido"
        zipCode = CEP[:cepInvalido]
      else
        zipCode = CEP[:cepNumero]
      end
     $cep_gerado = zipCode[:cep]
  end

  #12/02/2017 - Juliana Rossi - Criado novo método para escolher tipo entrega responsivo mp
  def escolher_tipo_entrega_responsivo (tipo_entrega)
    assert_selector(EL['radio_entrega_ativa_r'], wait: 15, visible:true)
    find(EL['radio_entrega_normal_r']).click if tipo_entrega == 'Normal'
    find(:xpath,'//label[text()="Agendada').click if tipo_entrega == 'Agendada'
    assert_selector(:xpath, '(//button[@class="btn buttonPrimary"])[1]', wait: 15, visible:true)
    find(:xpath, '(//button[@class="btn buttonPrimary"])[1]').click
  end

  def method_name

  end

end
