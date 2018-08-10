class PaginaGarantia

  include RSpec::Matchers
  include Capybara::DSL

  def cancela_garantia
    if has_selector?('.contentWrapper', text: '12 meses')
      if has_selector?(EL['botao_RecusaGarantia'])
        Common.new.clica_elemento("botao_RecusaGarantia",1)
      else
        Common.new.clica_elemento("botao_ContinuarGarantia",1)
      end
    end
  end

  def seleciona_garantia(tipo_garantia)
    sleep(2)
    #08/02/2017 - Juliana Rossi - Elemento '.extended-warranty' disponível apenas em CB e PF.
    has_selector?(EL['planos_garantia_extendida_CB_PF'], wait:15, visible: true) if $site == 'pontofrio' or $site == 'casasbahia'
    has_selector?(EL['planos_garantia_extendida_BT'], wait:15, visible: true) if $site == 'barateiro'
    has_selector?(EL['planos_garantia_extendida_EX'], wait:15, visible: true) if $site == 'extra'

        case tipo_garantia

        when "nao"
          #06/03/2018 - Vitor - Remoção do cacela garantia, pois temos que chamar o metodo seleciona seguro ainda.
          cancela_garantia
        when "12_meses"
          find(EL['botao_contratar_12m_EX']).click if $site == 'extra'
          all(EL['radio_planos_CB_PF_pai'], wait: 5)[0].click if $site == 'casasbahia'
          all(EL['radio_planos_CB_PF_pai'], wait: 5)[0].click if $site == 'pontofrio'
          all(EL['radio_planos_BT_pai'], wait: 5)[0].click if $site == 'barateiro'
          # Common.new.clica_elemento("botao_RecusaGarantia",0) if $site == 'casasbahia'
          # Common.new.clica_elemento('botao_continuar_garantia_r') if $site == 'pontofrio'
          # Common.new.clica_elemento('botao_continuar_garantia_r') if $site == 'barateiro'
        when "24_meses"
          all(EL['radio_planos_CB_PF_pai'], wait: 5)[1].click if $site == 'casasbahia'
          find(EL['botao_contratar_24m_EX']).click if $site == 'extra'
          all(EL['radio_planos_CB_PF_pai'], wait: 5)[1].click if $site == 'pontofrio'
          all(EL['radio_planos_BT_pai'], wait: 5)[1].click if $site == 'barateiro'
          # Common.new.clica_elemento("botao_RecusaGarantia",0) if $site == 'casasbahia'
          # Common.new.clica_elemento('botao_continuar_garantia_r') if $site == 'pontofrio'
          # Common.new.clica_elemento('botao_continuar_garantia_r') if $site == 'barateiro'
        else
          find(EL['botao_contratar_36m_EX']).click if $site == 'extra'
          all(EL['radio_planos_CB_PF_pai'], wait: 5)[2].click if $site == 'casasbahia'
          all(EL['radio_planos_CB_PF_pai'], wait: 5)[2].click if $site == 'pontofrio'
          all(EL['radio_planos_BT_pai'], wait: 5)[2].click if $site == 'barateiro'
          # Common.new.clica_elemento("botao_RecusaGarantia",0) if $site == 'casasbahia'
          # Common.new.clica_elemento('botao_continuar_garantia_r') if $site == 'pontofrio'
          # Common.new.clica_elemento('botao_continuar_garantia_r') if $site == 'barateiro'
        end
  end

  def seleciona_seguro(tipo_seguro)
    #06/03/2018 - Vitor - Remoção do clique no botão continuar, pois temos um metodo para isso
    if has_selector?(".extended-warranty", wait:15, visible: true)

      case tipo_seguro

      when "nao"
        cancela_garantia
      when "roubo_furto"
        all(".input-custom")[3].click
      when "roubo"
        all(".input-custom", wait: 15)[3].click
      when "quebra"
        all(".input-custom", wait: 15)[4].click
      when "roubo_quebra"
        all(".input-custom")[5].click
      end
      # if has_selector?(EL['botao_RecusaGarantia'])
      #   Common.new.clica_elemento("botao_RecusaGarantia",1)
      # elsif has_selector?(EL['botao_ContinuarGarantia'])
      #   Common.new.clica_elemento("botao_ContinuarGarantia",1)
      # end
    end
  end

  def continua_garantia
    sleep(2)
    if has_selector?(EL["botao_RecusaGarantia"], wait: 15)
      Common.new.clica_elemento("botao_RecusaGarantia",1)
    elsif has_selector?(EL['botao_ContinuarGarantia'])
      Common.new.clica_elemento("botao_ContinuarGarantia",1)
    end
  end

  def seleciona_garantia_carrinho(garantia)
    sleep(2)
    Common.new.clica_elemento_com_texto("garantia_carrinho", "Garantia")
    within_frame('TB_iframeContent') do
      Common.new.clica_elemento_com_texto("radio_button_garantia_carrinho", DT_LINKS[garantia])
      Common.new.clica_elemento("botao_continuar_garantia")
    end
  end

end
