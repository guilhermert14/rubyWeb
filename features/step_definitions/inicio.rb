
Dado(/^que acesso o site da bandeira$/) do
  $EL = "EL_#{$site}"
  local = DATA["local"]
  local = local.gsub('bandeira', $site)
  visit(local)
end

Dado(/^que acesso a pagina de "([^"]*)"$/) do |pagina|
  login = DATA[pagina]
  login = login.gsub('bandeira', $site)
  visit(login)
  sleep 2
end

Dado(/^que estou logado com "([^"]*)"$/) do |massa|
  teste = DATA["login"]
  teste = teste.gsub('bandeira', $site)
  visit(teste)
  dados = LOGIN[:"#{massa}"]
  @paginaLogin.login(dados[:email],dados[:senha])
  @paginaInicial.fechar_banner_promocional
  @paginaInicial.verifica_carrinho_vazio
end

Entao(/^faço o login com email "([^"]*)" e senha "([^"]*)" e "([^"]*)" o carrinho$/) do |email, senha, carrinho|
  @paginaLogin.login(MASSA[eval('email')],MASSA[eval('senha')])
  sleep(2)
  if has_text?("Olá") && carrinho == "limpar"
    @paginaInicial.verifica_carrinho_vazio
  end
end

Entao(/^eu atualizo a pagina$/) do
  @common.atualizar
end
