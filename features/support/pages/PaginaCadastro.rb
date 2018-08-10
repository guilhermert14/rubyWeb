class PaginaCadastro

    include RSpec::Matchers
    include Capybara::DSL

    
  def cadastrar_dados_pessoais_pessoa_fisica_responsivo(novo_cliente)
    Common.new.aguardar_load_responsivo
    assert_selector(EL['texto_nome_completo_r'], visible: true, wait: 10)
    find(EL['texto_nome_completo_r']).set novo_cliente['name']
    find(EL['texto_cpf_r']).set novo_cliente['cpf']
    find(EL['radio_sexo_masculino']).click if novo_cliente['gender'] == 'M'
    find(EL['radio_sexo_feminino']).click if novo_cliente['gender'] == 'F'
    find(EL['texto_NascDia_r']).set novo_cliente['data_nascimento'][0]
    find(EL['texto_NascMes_r']).set novo_cliente['data_nascimento'][1]
    find(EL['texto_NascAno_r']).set novo_cliente['data_nascimento'][2]
    find(EL['combo_phone_tipo_r']).all(:option, novo_cliente['phone_type'])[0].select_option
    find(EL['texto_phone_ddd_r']).set novo_cliente['phone_ddd']
    find(EL['texto_phone_numero_r']).set novo_cliente['phone_number']
  end

  def cadastrar_dados_pessoais_pessoa_juridica_responsivo(novo_cliente)
    Common.new.aguardar_load_responsivo
    assert_selector(EL['radio_pessoa_juridica'], visible: true, wait: 10)
    find(EL['radio_pessoa_juridica']).click
    find(EL['texto_razao_social_r']).set novo_cliente['name']
    find(EL['texto_nome_fantasia_r']).set novo_cliente['name']
    find(EL['texto_cnpj_r']).set novo_cliente['cnpj']
    find(EL['combo_estado_ie_r']).all(:option, novo_cliente['estado'])[0].select_option
    find(EL['texto_ie_numeros_r']).set novo_cliente['ie']
    find(EL['combo_phone_tipo_r']).all(:option, novo_cliente['phone_type'])[0].select_option
    find(EL['texto_phone_ddd_r']).set novo_cliente['phone_ddd']
    find(EL['texto_phone_numero_r']).set novo_cliente['phone_number']
  end

  def cadastrar_dados_acesso_responsivo(novo_cliente)
    find(EL['texto_email_cadastro_r']).set novo_cliente['email']
    find(EL['texto_confirmar_email_cadastro_r']).set novo_cliente['email']
    find(EL['texto_senha_dados_acesso_r']).set novo_cliente['senha']
    find(EL['texto_confirmar_senha_dados_acesso_r']).set novo_cliente['senha']
    Common.new.clicar_botao_continuar_responsivo
  end

end