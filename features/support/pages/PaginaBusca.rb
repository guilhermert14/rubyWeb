class PaginaBusca

  include RSpec::Matchers
  include Capybara::DSL

  #08/02/18 - Juliana Rossi - Ajustado método pois nao funcionava para PF. Testado com sucesso em todas as bandeiras
  def selecionar_produto(index=0)
    #execute_script("window.scrollTo(0,500)")
    if $site == "pontofrio"
      assert_selector(EL['produto_img_pf'], wait: 15)
      all(EL['produto_img_pf'],wait: 15)[index.to_i].click
    else
    assert_selector(EL['produto_img'], wait: 15)
    all(EL['produto_img'],wait: 15)[index.to_i].click
    end
  end

  def seleciona_produto(index)
    #execute_script("window.scrollTo(0,500)")
    assert_selector('.hproduct', wait: 15)
    all('.hproduct',wait: 15)[index.to_i].click
  end

end
