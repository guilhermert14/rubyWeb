class Assert_Page

 include RSpec::Matchers
 include Capybara::DSL

  def valida_existencia_elemento(elemento)
   if assert_selector(elemento, wait:20)
     p "Elemento (#{elemento}) localizado com sucesso na página"
   else
     raise "Elemento (#{elemento}) não foi localizado na página"
   end
  end

  def visualizo_texto_desabilitado(texto)
  if assert_selector(texto, wait: 10, visible: false)
    p "Texto (#{texto}) esta desablitado"
  else
    raise "Texto (#{texto}) continua habilitado"
  end
end

  def valida_string_diferentes(string1, string2)
    if string1 == string2
      raise "As strings são iguais"
    else
      p "A String:(#{string1}) é diferente da String:(#{string2})"
    end
  end

  def valida_carrinho_vazio
     if has_text?("Não há produtos em seu carrinho")
       p "Carrinho limpo com sucesso"
     elsif  has_selector?(EL['remover_produtos'])
       raise "Carrinho com produto"
     end
  end

  def valida_login
    if has_text?("Olá")
      p "Login efetuado com sucesso"
    elsif has_text?("E-mail inválido")
      raise "Email inválido"
    elsif has_text?("E-mail ou senha incorretos")
      raise "Dados incorretos"
    end
  end

  def valida_login_sem_sucesso
    if has_text?("E-mail inválido")
      p "Email inválido"
    elsif has_text?("E-mail ou senha incorretos")
      p "Dados incorretos"
    elsif has_text?("Olá")
      raise "Login efetuado com sucesso"
    end
  end

  def valida_url(url)
    if page.driver.current_url.include? url
      p "Pagina correta #{page.driver.current_url}"
    elsif page.driver.current_url.downcase.include? url
      p "Pagina correta #{page.driver.current_url}"
    else
      raise "Página incorreta #{page.driver.current_url}"
    end
  end

 # def valida_finalizacao_compra_um_cartao_credito
 #   assert_selector(".subtitulo", wait: 15)
 # end
 #
 # def valida_finalizacao_compra_dois_cartoes_credito
 #   assert_selector(".subtitulo", wait: 15)
 # end

 def valida_finalizacao_compra
   assert_selector(".tit", wait: 30, visible: true)
   num_pedido = all("strong", wait: 30)[0].text
   if num_pedido != "" && num_pedido != " "
     p "Pedido concluido. #{num_pedido}"
   else
     raise "Pedido não concluido."
   end
end


 def valida_finalizacao_compra_um_cartao_credito(seguro)
   assert_selector(".tit", wait: 30)
   num_pedido = all("strong", wait: 30)[0].text
   if num_pedido != "" && num_pedido != " "
     p "Pedido concluido. #{num_pedido}"
   else
     raise "Pedido não concluido."
   end
   if seguro != "nao"
   case seguro
     when "roubo_furto_quebra"
       assert_text("1 ano de Seguro, Roubo, Furto Qualificado e Quebra Acidental")
     when "roubo_furto"
       assert_text("1 ano de Seguro contra Roubo e Furto Qualificado")
     else
       assert_text("1 ano de Seguro Contra Quebra Acidental")
    end
  end
 end

 def valida_finalizacao_compra_dois_cartoes_credito(seguro)
   assert_selector(".tit", wait: 30)
   num_pedido = all("strong", wait: 30)[0].text
   if num_pedido != "" && num_pedido != " "
     p "Pedido concluido. #{num_pedido}"
   else
     raise "Pedido não concluido."
   end
   if seguro != "nao"
   case seguro
     when "roubo_furto_quebra"
       assert_text("1 ano de Seguro, Roubo, Furto Qualificado e Quebra Acidental")
     when "roubo_furto"
       assert_text("1 ano de Seguro contra Roubo e Furto Qualificado")
     else
       assert_text("1 ano de Seguro Contra Quebra Acidental")
    end
  end
 end

 def valida_finalizacao_compra_debito_online(seguro)
   assert_selector(".tit", wait: 30)
   num_pedido = all("strong", wait: 30)[0].text
   if num_pedido != "" && num_pedido != " "
     p "Pedido concluido. #{num_pedido}"
   else
     raise "Pedido não concluido."
   end
   if seguro != "nao"
   case seguro
     when "roubo_furto_quebra"
       assert_text("1 ano de Seguro, Roubo, Furto Qualificado e Quebra Acidental")
     when "roubo_furto"
       assert_text("1 ano de Seguro contra Roubo e Furto Qualificado")
     else
       assert_text("1 ano de Seguro Contra Quebra Acidental")
    end
  end
 end

  def valida_finalizacao_compra_boleto(seguro = "nao")
    assert_selector(".tit", wait: 30)
    num_pedido = all("strong", wait: 30)[0].text

    if num_pedido != "" && num_pedido != " "
      p "Pedido concluido. #{num_pedido}"
    else
      raise "Pedido não concluido."
    end
    if seguro != "nao"
    case seguro
      when "roubo_furto_quebra"
        assert_text("1 ano de Seguro, Roubo, Furto Qualificado e Quebra Acidental")
      when "roubo_furto"
        assert_text("1 ano de Seguro contra Roubo e Furto Qualificado")
      else
        assert_text("1 ano de Seguro Contra Quebra Acidental")
     end
   end
  # num_pedido = all(".ng-binding")[0].text
  #
  # if num_pedido != "" && num_pedido != " "
  #   p "Numero do pedido sendo enviado após finalizar transacao: #{num_pedido}."
  # else
  #   raise "Numero do pedido não está sendo informado no final da transacao."
  # end
 end

  def valida_botao_retira_lista_lojista
    sleep(6)
    if all(".lnkPop.bt.bt-retirar").length == 1
      p "Botao 'Retira' sendo exibido somente para CasasBahia.com.br"
    else
      raise "Botao Retirar aparecendo para outros lojistas."
    end

  end

  def valida_visualizacao_wizard
    sleep(4)
    if has_selector?(EL["wizard"])
      assert_selector(EL["wizard"], wait: 15, visible:true)
    else
      raise "Wizard não encontrado"
    end
  end

  def valida_visualizacao_widget
    if has_selector?(EL["widget_pneu"], wait: 15)
      assert_selector(EL["widget_pneu"], wait: 15, visible:true)
    elsif has_selector?(EL["widget_pneu_medida"], wait: 15)
      assert_selector(EL["widget_pneu_medida"], wait: 15, visible:true)
    else
      raise "Widget não encontrado"
    end
  end

  def valida_finalizacao_wizard
    if has_selector?(EL['wizard_finalizado'], wait: 15)
      assert_selector(EL['wizard_finalizado'], wait: 15, visible:true)
    else
      raise "Tela de finalização do Wizard não encontrada"
    end
    assert_text("Muito bem, terminamos!")
    if has_selector?(EL["botao_refazer_wizard"], wait: 15)
      assert_selector(EL["botao_refazer_wizard"], wait: 15, visible:true)
    else
      raise "Botão refazer não foi encontrado"
    end
    if has_selector?(EL["produto"], wait: 15)
      assert_selector(EL["produto"], wait: 15, visible:true)
    elsif has_selector?(EL["produto_img_pf"], wait: 15)
      assert_selector(EL["produto_img_pf"], wait: 15, visible:true)
    else
      raise "Não retornou nenhum produto"
    end
  end

  def valida_finalizacao_widget
    if has_selector?(EL["widget_sem_resultado"], wait: 15)
      p "Ofertas não encontradas"
    elsif has_selector?(EL["widget_resultado"], wait: 15)
      assert_selector(EL["widget_resultado"], wait: 15)
    elsif has_selector?(EL["widget_resultado_medida"], wait: 15)
      assert_selector(EL["widget_resultado_medida"], wait: 15)
    else
      raise "Erro no resultado do Widget"
    end
    if has_selector?(EL["produto"], wait: 15)
      assert_selector(EL["produto"], wait: 15, visible:true)
    elsif has_selector?(EL["produto_img_pf"], wait: 15)
      assert_selector(EL["produto_img_pf"], wait: 15, visible:true)
    else
      raise "Não retornou nenhum produto"
    end
  end

  def valida_resultado_widget
    if has_selector?(EL["campo_resultado"], wait: 15)
      assert_selector(EL["campo_resultado"], wait: 15)
    else
      raise "Erro no resultado de ver todas as ofertas do Widget"
    end
    if has_selector?(EL["produto"], wait: 15)
      assert_selector(EL["produto"], wait: 15, visible:true)
    elsif has_selector?(EL["produto_img_pf"], wait: 15)
      assert_selector(EL["produto_img_pf"], wait: 15, visible:true)
    else
      raise "Não retornou nenhum produto"
    end
  end

  def valida_inicio_wizard
    if has_selector?(EL["wizard"])
      assert_selector(EL["wizard"], wait: 15, visible:true)
    else
      raise "Tela inicial do Wizard não encontrada"
    end
    assert_text("QUER AJUDA PARA ESCOLHER", wait: 15)
  end

  def valida_passo_um_wizard
    if has_selector?(EL["wizard"])
      assert_selector(EL["wizard"], wait: 15, visible:true)
    else
      raise "Tela do Wizard não encontrada"
    end
    if has_text?("Tamanho", wait: 15)
      assert_text("Tamanho", wait: 15)
    elsif has_text?("Largura", wait: 15)
      assert_text("Largura", wait: 15)
    elsif has_text?("PROCURANDO?", wait: 15)
      assert_text("PROCURANDO?", wait: 15)
    else
      raise "Tela do pirmeiro passo do Wizard não encontrada"
    end
  end

#Valida exibicao do modal retira dentro da tela de detalhe do produto
#Autor: Marcos Barbosa
#Data: 16/02/2017
  def valida_exibicao_modal_retira
     assert_selector(".chamada-modal", wait:15, visible:true)
  end

#Valida exibicao de qualquer mensagem na tela.
#Autor: Marcos Barbosa
#Data: 16/02/2017
  def valida_exibicao_mensagem(elemento, mensagem)
    assert_selector(EL[elemento], text: MSG[mensagem], wait:25)
  end

  def valida_exibicao_garantia(mensagem)
    assert_selector("div[class='resumoPedido']", text:MSG["garantia_#{mensagem}"], wait:20, visible:true)
  end

  def valida_exibicao_seguro(mensagem)
    assert_selector("div[class='resumoPedido']", text:MSG["seguro_#{mensagem}"], wait:20, visible:true)
  end

  def validar_tela_meus_pedidos
      texto = find(EL['label_meus_pedidos'], wait:10).text
      return texto
  end

  def valida_quantidade_caracteres(elemento, qtd_char)
    valor=find(EL[elemento]).value
    valor.gsub!(/[^0-9A-Za-z]/, '')
    valor=valor.length
     if qtd_char.to_i == valor
       p "Quantidade de caracteres validada com sucesso"
     else
       raise "Era esperado #{qtd_char} e foi recebido #{valor}"
     end
  end

  def valida_caractere_especial(texto)
    valor = texto.scan(/[^0-9A-Za-z" "-]/)
    if valor.length == 0
      p "Campo nao esta aceitando caracteres especiais"
    else
      raise "Campo aceitando caracteres especiais"
    end
  end

  def validar_valor_desconto_nominal(valor_aplicado)
   valor_total = find("td[data-id='precoTotal']").text
   valor_aplicado.delete!(',')
   valor_total.delete!('R$ ')
   valor_total.delete!(',')
   sleep 3
   valor_desconto = find("em[data-id='valorTotal']").text
   valor_desconto.delete!('R$ ')
   valor_desconto.delete!(',')
   valor_com_desconto = valor_total.to_i - valor_aplicado.to_i
    if valor_com_desconto.to_s === valor_desconto.to_s
      p "valido"
    else
      raise "invalido"
    end
  end

  def verifica_existencia_carregamento
    result = has_selector?(:xpath,"//div[@id='block']//p[@id='blockMsg']", wait:15)
    while result =! true
      result = has_selector?(:xpath,"//div[@id='block']//p[@id='blockMsg']", wait:15)
    end
  end

  ##Verifica existencia do popup e seleciona 'Ok'
  ##Marcos barbosa 29/03/2018
  def seleciona_ok_poppup
      page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
  end

  def valido_quantida_sku
    quantidade = all(".tabelaItem.col-md-2.text-right").count
    if $qtd_produto == quantidade
      p "Quantidade de SKU são iguais "
    else
      raise "Quantida de SKU não são iguais"
    end
  end
end
