class PaginaCarrinho

  include RSpec::Matchers
  include Capybara::DSL


  def seleciona_item_porteiro(item)
    within_frame("TB_iframeContent") do
      has_selector?(EL['botao_Continuar'], wait:15)
      if item == "novo"
        Common.new.clica_elemento("botao_Continuar")
      else
        find('.retiraGrp.retiraLastProd').click
        Common.new.clica_elemento("botao_Continuar")
      end
    end
  end

   #08/02/18 - Juliana Rossi - Alerta: Caso a imagem do produto tenha delay este metodo nao ira funcionar
  def somente_adiciona_item_ao_carrinho
    assert_selector(EL['botao_Comprar'], wait: 15)
    Methods_common.new.clica_elemento("botao_Comprar")
  end

  #08/02/18 - Juliana Rossi - Add novo Metodo para inserir um item no carrinho. Testado em todas bandeiras
  def adicionar_item_ao_carrinho
    assert_selector(EL['produto_img_detalhe'], wait: 15, visible:true)
    find(EL['botao_Comprar'], wait: 15).click
  end

  #08/02/18 - Juliana Rossi - Add novo Metodo avançar para tela de Identificação
  def concluir_compra_responsivo
    assert_selector(:xpath,'(//*[text()="Concluir Compra"])[1]', wait: 15, visible:true)
    # find(:xpath,"//*[text()='x']").click
    find(:xpath,'(//*[text()="Concluir Compra"])[1]', wait: 15).click
  end

  #08/02/18 - Juliana Rossi - Add novo Metodo. Pois não localizei outro com a mesma funcionalidade
  def concluir_compra
    assert_selector(EL['botao_ConcluirCompra'], wait: 15, visible:true)
    find(EL['botao_ConcluirCompra'], wait: 15).click
  end

  def adicionando_novo_produto
    assert_selector(EL["botao_Comprar_Mais_Produtos"], wait: 15)
    Methods_common.new.clica_elemento("botao_Comprar_Mais_Produtos")
  end

  def validar_texto_meu_carrinho
    carrinho = find(:xpath, EL['label_meu_carrinho'], wait:10).text
    return carrinho
  end

  def reabrir_navegador
    Capybara.current_session.driver.quit
    $EL = "EL_#{$site}"
    local = DATA["local"]
    local = local.gsub('bandeira', $site)
    visit(local)
  end
end
