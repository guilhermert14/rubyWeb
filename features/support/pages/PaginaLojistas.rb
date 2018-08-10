class PaginaLojistas

  include RSpec::Matchers
  include Capybara::DSL

  def seleciona_ordenacao(valor)
    find('select[id=ddlOrdenacao]', wait: 5).find(:option, valor).select_option
  end
end
