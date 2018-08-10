class PaginaProduto

  include RSpec::Matchers
  include Capybara::DSL

  # Na PaginaBusca ha um metodo com a mesma responsabilidade
  def seleciona_produto
    if $site == "pontofrio"
      assert_selector(EL['produto_img_pf'], wait: 15, visible:true)
      n = all(EL["produto_img_pf"]).count
      indice = rand(0 .. n-1)
      all(EL["produto_img_pf"], wait: 15)[indice].click
      sleep(2)
    else
      assert_selector(EL['produto'], wait: 15, visible:true)
      n = all(EL["produto"]).count
      indice = rand(0 .. n-1)
      all(EL["produto"], wait: 15)[indice].click
      sleep(2)
    end
  end



  def navega_aleatoriamente_wizard
    sleep(2)
    while has_no_selector?(EL['botao_finalizar_wizard'], wait: 15) do
      n = all(EL["opcoes_wizard"]).count
      option = rand(0 .. n-1)
      Common.new.clica_elemento("opcoes_wizard", option)
      sleep(2)
    end
  end

  def navega_aleatoriamente_widget
      sleep(2)
      all(EL['campo_opcoes_widget'], wait: 15)[0].click
      ni = all(EL['opcoes_widget'], wait: 15)[0].all('li').count
      index = rand(0 .. ni-1)
      all(EL['opcoes_widget'], wait: 15)[0].all('li')[index].click
      sleep(2)
      all(EL['campo_opcoes_widget'], wait: 15)[0].click
      ni = all(EL['opcoes_widget'], wait: 15)[1].all('li').count
      index = rand(0 .. ni-1)
      all(EL["opcoes_widget"], wait: 15)[1].all('li')[index].click
      sleep(2)
      all(EL['campo_opcoes_widget'], wait: 15)[0].click
      ni = all(EL['opcoes_widget'], wait: 15)[2].all('li').count
      index = rand(0 .. ni-1)
      all(EL["opcoes_widget"], wait: 15)[2].all('li')[index].click
      sleep(2)
  end


end
