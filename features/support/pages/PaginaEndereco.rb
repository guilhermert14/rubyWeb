class PaginaEndereco

  include RSpec::Matchers
  include Capybara::DSL

    def cadastrar_endereco_responsivo(novo_cliente)
        Common.new.aguardar_load_responsivo
        assert_selector(EL['combo_tipo_endereco_r'], visible: true, wait: 10)
        find(EL['combo_tipo_endereco_r']).all(:option, novo_cliente['tipo_endereco'])[0].select_option
        find(EL['texto_id_endereco_r']).set novo_cliente['name']
        find(EL['texrue to_nome_destinatario_r']).set novo_cliente['name']
        find(EL['texto_cep_r']).set novo_cliente['cep']
        Common.new.aguardar_load_responsivo
        find(EL['texto_numero_r']).set novo_cliente['numero']
        find(EL['texto_ponto_referencia_r']).set novo_cliente['ref']
        Common.new.clicar_botao_continuar_responsivo
    end

  def cadastra_endereco_sucesso
    sleep(4)
    assert_selector(EL['identificao_end'], wait: 15, visible:true)
    find(EL['identificao_end']).set("casa")
    find(EL['nome_destinatario']).set(eval(MASSA['fullName']))
    find(EL['texto_cep_carrinho']).set("09520010")
    find(EL['ponto_referencia']).set("sao caetano do sul")
    sleep(1)
    find(EL['numero_casa']).set("1234")
    find(EL['botao_Continuar']).click
  end

  def realizo_novo_endereco
    cep = CEP[:cepAll]
    assert_selector(EL['identificao_end'], wait: 15, visible:true)
    find(EL["combobox_tipo_endereco"]).find('option', text: 'Outro').click
    find(EL['identificao_end']).set(eval(MASSA['fullName']))
    find(EL['nome_destinatario']).set(eval(MASSA['fullName']))
    find(EL['texto_cep_carrinho']).set(cep[:cep].sample)
    find(EL['ponto_referencia']).set('teste')
    sleep(1)
    find(EL['numero_casa']).set("1234")
    find(EL['botao_Continuar']).click
  end

  def realizo_endereco_PJ
    novo = NOVO_CLIENTE
    assert_selector(EL['campo_razao_social'], wait: 15, visible:true)
    find(EL["campo_razao_social"]).set(novo['name'])
    find(EL["campo_nome_fantasia"]).set(novo['name'])
    find(EL["campo_cnpj"]).set(novo['cnpj'])
    find(EL["checkbox_isento"]).click
    find(EL["texto_ddd_PJ"]).set(novo['phone_ddd'])
    find(EL["texto_telefone_PJ"]).set(novo['phone_number'])
    find(EL["link_remover_telefone_pj"]).click
    find(EL["campo_informe_email"]).set(novo['email'])
    find(EL["texto_Conf_Email"]).set(novo['email'])
    find(EL["texto_Senha"]).set(novo['senha'])
    find(EL["texto_conf_senha"]).set(novo['senha'])
  end
end
