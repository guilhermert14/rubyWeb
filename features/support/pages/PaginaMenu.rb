class PaginaMenu

  include RSpec::Matchers
  include Capybara::DSL
  def seleciona_login
    assert_selector(EL["botao_CadastreSe"], wait: 15)
    find(EL["botao_CadastreSe"], wait: 15).click
    assert_text("Identificação", wait: 15)
  end

  def seleciona_departamento(departamento)
    sleep(2)
    if $site == "casasbahia"
      find(".btTodosDpt").click
      all("a[title='#{departamento}']", wait: 15)[0].click
    elsif $site == "extra"
      departamento_min = departamento.downcase
      if has_selector?(".nav-item-#{departamento_min}", wait: 15)
        find(".nav-item-#{departamento_min}", wait: 15).click
      else
        find(".nav-item-todos", wait: 15).click
        all("a[title='#{departamento}']", wait: 15)[0].click
      end
    elsif $site == "pontofrio"
      departamento_min = departamento.downcase
      if departamento != "Download / Games" && has_selector?(".nav-item--#{departamento_min}", wait: 15)
        find(".nav-item--#{departamento_min}", wait: 15).click
      else
        find(".nav-item--todas-categorias", wait: 15).click
        find(".navsub-link", wait: 15, exact_text: departamento).click
      end
    end
  end

  def seleciona_categoria(categoria)
    sleep(2)
    all("a[title='#{categoria}']", wait: 15)[0].click #"a[href='#{categoria}']"
  end

end
