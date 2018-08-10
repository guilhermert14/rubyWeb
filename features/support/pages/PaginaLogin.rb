class PaginaLogin
  include RSpec::Matchers
  include Capybara::DSL

  def login(email, senha)
    assert_selector(EL['texto_Email'], wait: 15, visible:true)
    find(EL['texto_Email'], wait: 15).set(email)
    find(EL['texto_Senha'], wait: 15).set(senha)
    Common.new.clica_elemento("botao_ContinuarLogin")
  end

  #16/02/18 - Juliana Rossi - Add metodo para acessar o login pela pagina Home
  def acessar_pagina_login_home
    assert_selector(EL['botao_CadastreSe'], visible: true, wait: 10)
    find(EL['botao_CadastreSe'], visible: true, wait: 10).click
    assert_selector(EL['botao_ContinuarLogin'], visible: true, wait: 10)
  end

  def acessar_tela_cadastro_responsivo
    Common.new.aguardar_load_responsivo
    find(EL['radio_PrimeiraCompra_r'], visible: true, wait: 10).click
    assert_selector(EL['botao_Continuar_r'], visible: true, wait: 10)
    Common.new.aguardar_load_responsivo
    find(EL['botao_Continuar_r'], visible: true, wait: 10).click
  end

  #09/02/18 - Juliana Rossi - Add metodo para Responsivo Meio Pagamento
  def login_responsivo(email, senha)
    assert_selector(EL['texto_Email_r'], wait: 15, visible:true)
    find(EL['texto_Email_r'], wait: 15).set(email)
    find(EL['texto_Senha_r'], wait: 15).set(senha)
    Common.new.clica_elemento("botao_Continuar_r")
  end

  def alteracao_de_senha_login(senha_antiga, senha_nova)
    assert_selector(EL['texto_Senha_Antiga'], wait: 15)
    find(EL['texto_Senha_Antiga'], wait: 15).set(senha_antiga)
    find(EL['texto_Nova_Senha'], wait: 15).set(senha_nova)
    find(EL['texto_Confirmar_Nova_Senha'], wait: 15).set(senha_nova)
    Methods_common.new.clica_elemento("botao_Salvar_Senha")
    puts "Senha alterada: #{senha_nova}"
  end

  def login_sucesso
    assert_selector(EL['texto_Email'], wait: 15, visible:true)
    find(EL['texto_Email'], wait: 15).set(LOGIN[:usuarioSucesso][:email])
    find(EL['texto_Senha'], wait: 15).set(LOGIN[:usuarioSucesso][:senha])
    Common.new.clica_elemento("botao_ContinuarLogin")
  end
end
