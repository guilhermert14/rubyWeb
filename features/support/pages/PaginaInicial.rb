class PaginaInicial

  include RSpec::Matchers
  include Capybara::DSL

  def pesquisa_produto(produto)
    assert_selector(EL["texto_Busca"], wait: 15)
    find(EL["texto_Busca"], wait: 15).set(produto)
    Common.new.clica_elemento("botao_Buscar")
  end

  def verifica_carrinho_vazio
    case $site
      when "barateiro"
        unless has_selector?('.cestaVazia')
          Common.new.clica_elemento("botao_carrinho_barateiro")
          Common.new.limpar_carrinho
        end
      when "casasbahia"
        valor = find(".cart-quantity").text
        unless valor == "Vazio"
          Common.new.clica_elemento("botao_carrinho")
          Common.new.limpar_carrinho
        end
      when "pontofrio"
        valor = find(".navbar-cart-itens.badge", visible:false).text
        unless valor == ""
          Common.new.clica_elemento("botao_carrinho_pf_ex")
          Common.new.limpar_carrinho
        end
      when "extra"
        valor = find(".navbar-cart-itens.badge", visible:false).text
        unless valor == ""
          Common.new.clica_elemento("botao_carrinho_pf_ex")
          Common.new.limpar_carrinho
        end
    end
  end

  #08/02/2017 - Juliana Rossi - Criado novo método para acessar site
  def chamar_url
    local = DATA["local"]
    local = local.gsub('bandeira', $site)
    visit(local)
  end

  #09/02/2017 - Juliana Rossi - Criado novo método para acessar site responsivo
  def chamar_url_responsivo
    local = DATA["url_ck_responsivo"]
    local = local.gsub('bandeira', $site)
    visit(local)
  end

  #09/02/2017 - Juliana Rossi - Criado novo método para acessar site responsivo
  def chamar_url_cadastro_responsivo
    local = DATA["url_ck_login_responsivo"]
    local = local.gsub('bandeira', $site)
    visit(local)
  end

  #09/02/2017 - Juliana Rossi - Criado método para banner exibido na Home.
  #09/02/2017 - Juliana Rossi - Quando tento mudar o elemento para camada elements.yml, a automação "quebra"
  def fechar_banner_promocional
    # banner = has_selector?('.content span:first-child', wait:3)
    banner = has_selector?('.popup_barateiro', wait:3)
    find('.popup_barateiro').find('.content span:first-child').click if banner == true
  end


end
