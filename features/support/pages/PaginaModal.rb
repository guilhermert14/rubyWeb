class PaginaModal

  include RSpec::Matchers
  include Capybara::DSL

  def seleciona_loja(index)
    has_selector?(:xpath, "//div[@class='local-retira']", wait: 15, visible:true)
    all(:xpath , "//div[@class='local-retira']", wait:15, visible:true)[index.to_i].click
    assert_selector(EL['botao_RetirarNestaLoja'], wait: 10, visible:true)
    find(EL['botao_RetirarNestaLoja']).click
  end

  def seleciona_locker(index)
    has_selector?(:xpath, "//div[@class='local-retira']", wait: 15, visible:true)
    sleep(15)
    all(:xpath , "//div[@class='local-retira']", wait:15, visible:true)[index.to_i].click
    assert_selector(EL['botao_RetirarNestaLoja'], wait: 10, visible:true)
    find(EL['botao_RetirarNestaLoja']).click
  end

  def seleciona_correios(index)
    has_selector?(:xpath, "//div[@class='local-retira']", wait: 15, visible:true)
    sleep(15)
    all(".nome-estabelecimento", text:"AC", wait:15, visible:true)[index.to_i].click
    assert_selector(EL['botao_RetirarNestaLoja'], wait: 10, visible:true)
    find(EL['botao_RetirarNestaLoja']).click
  end

  def esqueci_meu_email_responsivo(tipo_pessoa)
    sleep 2
    if tipo_pessoa == "cpf"
      find("input[placeholder='CPF']").set("462.124.748-42")
      find("input[placeholder='Dia']").set('22')
      find("input[placeholder='Mês']").set('06')
      find("input[placeholder='Ano']").set('1996')
    elsif tipo_pessoa == "cnpj"
      find("input[id='pessoa_juridica']").click
      find("input[placeholder='CNPJ']").set('05.025.040/0001-01')
      find("input[placeholder='DDD']").set('11')
      find("input[placeholder='Telefone']").set('100000000')
    else
      raise "Parametro invalido"
    end

  end

end
