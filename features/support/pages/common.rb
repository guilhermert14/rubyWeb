class Common
  include RSpec::Matchers
  include Capybara::DSL
  include FFaker

  def clicar_inserir_valor(campo, valor)
    #execute_script("arguments[0].scrollIntoView();",all(EL[campo])[0])
    assert_selector(EL[campo], wait: 20, visible:true)
    find(EL[campo], wait: 15).set(valor)
  end

  def captura_valor_campo(elemento)
    assert_selector(EL[elemento], wait:15)
    value = all(EL[elemento])[0].text
    return value
  end
  def seleciono_combobox_index(elemento, index = 0)
    assert_selector(EL[elemento], wait:10)
    find(EL[elemento]).all('option')[index.to_i].click
  end

  def verifica_texto_combobox_selecionado(texto, combobox)
    find(EL[combobox]).find('option', text: texto).value
  end

  def clica_elemento(botao,index=0)
    assert_selector(EL[botao], wait: 25, visible:true)
    all(EL[botao], wait:20)[index.to_i].click
    # Assert_Page.new.verifica_existencia_carregamento
    #execute_script("arguments[0].click();",all(EL[botao])[index])
  end

  def limpar_carrinho
    if  has_selector?(EL['remover_produtos'])
      i = 0
      n = all(EL['remover_produtos']).count
      while i != n do
        clica_elemento("remover_produtos")
        atualizar
        sleep(3)
        n = all(EL['remover_produtos']).count
      end
    end
  end

  def clica_elemento_com_texto(botao, texto, index=0)
    assert_selector(EL[botao], wait: 15, visible:true)
    all(EL[botao], wait: 15, text: texto)[index].click
  end

  def verifica_carregamento
    assert_no_selector("p[id='blockMsg']", wait:15)
  end

  def atualizar
    page.driver.browser.navigate.refresh
  end

  def vai_para_guia(index)
    result = page.driver.browser.window_handles[index]
    page.driver.browser.switch_to.window(result)
  end

  def adiciona_item_carrinho(metodo, servico)
    assert_selector(EL['botao_Comprar'], wait:25)

    case metodo
      when "normal"
        if servico == "sim"
          clica_elemento("check_servico")
          clica_elemento("botao_Comprar")
          PaginaGarantia.new.continua_garantia()
        else servico == "nao"
          clica_elemento("botao_Comprar")
          PaginaGarantia.new.continua_garantia()
        end
        assert_selector(EL['botao_ConcluirCompra'],wait:20, visible: true)
        clica_elemento("botao_ConcluirCompra")
        assert_selector(".fEntrega", text:"Normal",wait: 20, visible:true)
        clica_elemento("botao_Concluir")
      when "normal_servico"
        clica_elemento("botao_Comprar")
        PaginaGarantia.new.seleciona_garantia(servico)
        PaginaGarantia.new.continua_garantia()
        assert_no_selector(EL['botao_Comprar'],wait:10)
        clica_elemento("botao_ConcluirCompra")
        sleep(5)
        clica_elemento("botao_Concluir")
      when "normal_cadastra_endereco"
        clica_elemento("botao_Comprar")
        PaginaGarantia.new.seleciona_garantia(servico)
        #capturar loader
        sleep(2)
        clica_elemento("botao_ConcluirCompra")
      when "normal_login"
        clica_elemento("botao_Comprar")
        clica_elemento("botao_ConcluirCompra")
        PaginaLogin.new.login_sucesso
        clica_elemento("botao_ConcluirCompra")
      when "normal_login_garantia"
        clica_elemento("botao_Comprar")
        PaginaGarantia.new.seleciona_garantia(servico)
        PaginaGarantia.new.continua_garantia()
        clica_elemento("botao_ConcluirCompra")
        PaginaLogin.new.login_sucesso
        clica_elemento("botao_ConcluirCompra")
      when "agendada"
         clica_elemento("botao_Comprar")
         Assert_Page.new.seleciona_ok_poppup
         if servico == "nao"
           PaginaGarantia.new.continua_garantia()
         end
         assert_selector(EL["botao_ConcluirCompra"], wait: 10, visible: true)
         clica_elemento("botao_ConcluirCompra")
         PaginaEntrega.new.seleciona_tipo_entrega("Agendada","sucesso")
       when "agendada_garantia"
         clica_elemento("botao_Comprar")
         PaginaGarantia.new.seleciona_garantia(servico)
         PaginaGarantia.new.continua_garantia()
         clica_elemento("botao_ConcluirCompra")
         PaginaEntrega.new.seleciona_tipo_entrega("Agendada","sucesso")
      when "normal_porteiro"
        clica_elemento("botao_Comprar")
      when "retira"
        clica_elemento("botao_RetirarNaLoja")
        within_frame(EL['retira'], wait:20) do
          has_selector?('.input-buscal-modal', wait: 15)
          clicar_inserir_valor("texto_cep","05112010")
          clica_elemento("botao_EncontrarLojas")
          PaginaModal.new.seleciona_loja(0)
        end
        PaginaGarantia.new.seleciona_garantia(servico)
        assert_no_selector(EL['botao_Comprar'],wait:15, visible: true)
        clica_elemento("botao_ConcluirCompra")
        assert_selector(".fEntrega", text:"Retira Rápido",wait: 15, visible:true)
        clica_elemento("botao_selecionar_pagamento")
      when "retira_servico"
        clica_elemento("botao_RetirarNaLoja")
        ithin_frame(EL['retira'], wait:20) do
          has_selector?('.input-buscal-modal', wait: 15)
          clicar_inserir_valor("texto_cep","05112010")
          clica_elemento("botao_EncontrarLojas")
          PaginaModal.new.seleciona_loja(0)
        PaginaGarantia.new.seleciona_garantia(servico)
        PaginaGarantia.new.continua_garantia()
        assert_no_selector(EL['botao_Comprar'],wait:10)
        clica_elemento("botao_ConcluirCompra")
        sleep(5)
        clica_elemento("botao_Concluir")
      end
      when "expressa"
        clica_elemento("botao_Comprar")
        clica_elemento("botao_ConcluirCompra")
        PaginaEntrega.new.seleciona_tipo_entrega("Expressa","sucesso")
      when "expressa_garantia"
        clica_elemento("botao_Comprar")
        PaginaGarantia.new.seleciona_garantia(servico)
        PaginaGarantia.new.continua_garantia()
        clica_elemento("botao_ConcluirCompra")
        PaginaEntrega.new.seleciona_tipo_entrega("Expressa","sucesso")
      when "retira_24horas"
        if has_selector?(EL['botao_RetirarNaLoja'])
          clica_elemento("botao_RetirarNaLoja")
        elsif has_selector?(EL['botao_Retirar+'])
          clica_elemento("botao_Retirar+")
        end
        within_frame(EL['retira']) do
          has_selector?('.modal-body', wait: 15)
          clicar_inserir_valor("texto_cep","02047050")
          clica_elemento("botao_EncontrarLojas")
          clica_elemento("botao_retira_24horas")
          PaginaModal.new.seleciona_loja(0)
        end
        PaginaGarantia.new.seleciona_garantia(servico)
      when "correios"
        clica_elemento("botao_RetirarNaLoja")
        within_frame(EL['retira']) do
          has_selector?('.modal-body', wait: 15)
          clicar_inserir_valor("texto_cep","09510970")
          clica_elemento("botao_EncontrarLojas")
          PaginaModal.new.seleciona_correios(0)
        end
      when "locker"
        clica_elemento("botao_RetirarNaLoja")
        within_frame(EL['retira']) do
          has_selector?('.modal-body', wait: 15)
          clicar_inserir_valor("texto_cep","04004040")
          clica_elemento("botao_EncontrarLojas")
          PaginaModal.new.seleciona_loja(0)
        end
        PaginaGarantia.new.seleciona_garantia(servico)
    end
  end

  def forma_entrega(forma)
  assert_selector(EL["botao_Comprar"], wait:15)
  clica_elemento("botao_Comprar")

      if $site != 'barateiro'

        if has_selector?(EL["botao_RecusaGarantia"], wait: 15, visible: true)
          sleep (2)
          clica_elemento("botao_RecusaGarantia")
        end

      else $site == 'barateiro'

        if has_selector?(EL["botao_recusar_garantia_BT"], wait: 15, visible: true)
          sleep (2)
          clica_elemento("botao_recusar_garantia_BT")
        end

      end

  assert_selector(EL["botao_ConcluirCompra"], wait: 15, visible: true)
  sleep (2)
  clica_elemento("botao_ConcluirCompra")

  case forma
    when "Normal"
      assert_selector(".fEntrega", text:"Normal", visible: true)
      clica_elemento("botao_Concluir")
    when "Retira"
      PaginaEntrega.new.seleciona_tipo_entrega("Retira","sucesso")
    when "Agendada"
      PaginaEntrega.new.seleciona_tipo_entrega("Agendada","sucesso")
    when "Expressa"
      PaginaEntrega.new.seleciona_tipo_entrega("Expressa","sucesso")
    when "SuperExpressa"
      PaginaEntrega.new.seleciona_tipo_entrega("SuperExpressa","sucesso")
    end
  end

  def gera_cartao(params = {})
    numeros = []
    numeros_verificacao = []

    if params[:bandeira].nil?
      numeros << [CODIGO_AMEX, CODIGO_VISA, CODIGO_MASTER].sample
    else
      numeros << CODIGO_AMEX if params[:bandeira] == :amex
      numeros << CODIGO_VISA if params[:bandeira] == :visa
      numeros << CODIGO_MASTER if params[:bandeira] == :master
    end

    1.upto(16 - numeros.size) do
      numeros << rand(1..9)
    end

    total_pares = 0
    1.upto(16) do |p|
      if p.even?
        n = numeros[p - 1]
        total_pares += n
      else
        n = numeros[p - 1] * 2
        n -= 9 if n >= 10
      end

      numeros_verificacao << n
    end
    total = numeros_verificacao.inject(:+)
    resto = total % 10
    if resto > 0
      if resto <= 5
        subtrair = (total_pares > 5)
      else
        subtrair = (total_pares > 67)
        resto = 10 - resto unless subtrair
      end

      while resto > 0
        1.upto(16) do |p|
          next unless resto > 0
          next unless p.even?
          p -= 1
          numero = numeros[p]
          if subtrair
            numeros[p] -= 1 if numeros[p] > 0
          else
            numeros[p] += 1 if numeros[p] < 9
          end
          resto -= 1 if numero != numeros[p]
        end
      end
    end

    numeros.join
    end

    def aguardar_load_responsivo
      has_no_selector?('.loader', wait:10)
    end

    def clicar_botao_continuar_responsivo
      find(EL['botao_Continuar_r']).click
    end
end
