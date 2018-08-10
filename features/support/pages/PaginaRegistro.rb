class PaginaRegistro

  include RSpec::Matchers
  include Capybara::DSL

  def preencher_formulario()
    campo = [EL["texto_NomeCompleto"],EL["texto_Cpf"],EL["texto_DddPhone"],EL["texto_Phone"],EL["texto_DddPhone2"],EL["texto_Phone2"],
      EL["texto_NascDia"],EL["texto_NascMes"],EL["texto_NascAno"],EL["texto_Email"],EL["texto_Conf_Email"],EL["texto_Senha"],EL["texto_conf_senha"]]
      dados = REGISTRO[:dados_validos]
    valor = [dados[:nome],dados[:cpf],dados[:dddPhone],dados[:phone],dados[:dddPhone2],dados[:phone2],
      dados[:nascData][0],dados[:nascData][1],dados[:nascData][2],dados[:email],dados[:email],dados[:password],dados[:password]]
    dados = Hash[campo.zip(valor)]
    dados.each do |campo , valor|
      find(campo).set(valor)
    end
    Common.new.clica_elemento("masculino")
  end
end
