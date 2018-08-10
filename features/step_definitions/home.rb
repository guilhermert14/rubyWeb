Entao(/^clico no "([^"]*)" do header$/) do | link |
  if $site == "extra" && link == "retira_rapido"
    p "#{$site.capitalize} não possui o link #{link}"
    skip_this_scenario
  else
    nome_link = EL[$site][link]
    assert_selector(nome_link, wait: 15)
    all(nome_link, wait:15)[0].click
    if link == "nossas_lojas" || (link == "duvidas" && $site == "extra")
      @common. vai_para_guia(1)
    end
  end
end

Entao(/^eu clico no departamento "([^"]*)"$/) do |departamento|
  if $site == "casasbahia" && (departamento == "Cine e Foto" || departamento == "Festival de Verão" || departamento == "Malas" || departamento == "Telefones e Celulares" || departamento == "Alimentos e Bebidas" || departamento == "Calçados" || departamento == "Vinhos e Cervejas" || departamento == "Móveis e Colchões" || departamento == "Tablets" || departamento == "Artigos para Festas")
    p "#{$site.capitalize} não possui o departamento #{departamento}"
    skip_this_scenario
  elsif $site == "pontofrio" && (departamento == "Alimentos e Bebidas" || departamento == "Calçados" || departamento == "Câmeras e Filmadoras" || departamento == "Celulares e Telefones" || departamento == "Malas e Mochilas" || departamento == "Móveis" || departamento == "Suplementos Alimentares" || departamento == "Tablet" || departamento == "Vinhos e Cervejas" || departamento == "Artigos para Festas")
    p "#{$site.capitalize} não possui o departamento #{departamento}"
    skip_this_scenario
  elsif $site == "extra" && (departamento == "Alimentos" || departamento == "Bebidas" || departamento == "Câmeras e Filmadoras" || departamento == "Celulares e Telefones" || departamento == "Festival de Verão" || departamento == "Malas" || departamento == "Móveis e Colchões" || departamento == "Tablet" || departamento == "Artigos para Festa")
    p "#{$site.capitalize} não possui o departamento #{departamento}"
    skip_this_scenario
  else
    @menu.seleciona_departamento(departamento)
  end
end

Entao(/^eu clico no departamento de serviço "([^"]*)"$/) do |servico|
  if $site == "casasbahia" && (servico == "Cartão Pontofrio" || servico == "Atacado")
    p "#{$site.capitalize} não possui o serviço #{servico}"
    skip_this_scenario
  elsif $site == "pontofrio" && servico == "Cartão Casas Bahia"
    p "#{$site.capitalize} não possui o serviço #{servico}"
    skip_this_scenario
  elsif $site == "extra"
    p "#{$site.capitalize} não possui serviços dentro de Todos Departamentos"
    skip_this_scenario
  else
    @menu.seleciona_departamento(servico)
    if servico == "Atacado"
      @common. vai_para_guia(1)
    end
  end
end

Entao(/^eu clico na categoria "([^"]*)"$/) do |categoria|
  @menu.seleciona_categoria(categoria)
end

Entao(/^eu clico no "([^"]*)" do footer$/) do |link|
  if $site == "casasbahia" && (link == "Como pagar" || link == "Política e Privacidade" || link == "Retira Rápido" || link == "Revelação Digital" || link == "Pontofrio Atacado" || link == "Entrega Agendada" || link == "Conheça o Pontofrio" || link == "Sobre o Pontofrio.com" || link == "Relação com Investidores" || link == "Ponto Premium" ||
    link == "Programa de Afiliados" || link == "Via Varejo Ads" || link == "Prepare-se para a BlackFriday" || link == "Sobre a entrega" || link == "Trabalhe conosco" || link == "Prazos e locais de entrega" || link == "Meus Pedidos" || link == "Editar Meu Cadastro" || link == "Serviços" || link == "Blog Extra" || link == "Anuncie com a Gente" || link == "Nosso manifesto. Vai que você pode!" ||
    link == "Marketplace, Soluções & Serviços" || link == "Política de Privacidade" || link == "Atendimento Loja Física")
    p "#{$site.capitalize} não possui o link #{link} no footer"
    skip_this_scenario
  elsif $site == "pontofrio" && (link == "Nota Fiscal Eletrônica" || link == "Editar meu Cadastro" || link == "Prepare-se para o Black Friday" || link == "Sobre as Casas Bahia" || link == "Cartão Casas Bahia" || link == "Lojas Físicas" || link == "Privacidade e Segurança" || link == "Anuncie com a gente" || link == "Venda seus produtos nas Casas Bahia" ||
     link == "Sobre a Entrega" || link == "Trabalhe Conosco" || link == "Prazos e locais de entrega" || link == "Meus Pedidos" || link == "Editar Meu Cadastro" || link == "Serviços" || link == "Blog Extra" || link == "Anuncie com a Gente" || link == "Nosso manifesto. Vai que você pode!" || link == "Marketplace, Soluções & Serviços" || link == "Política de Privacidade" || link == "Atendimento Loja Física")
    p "#{$site.capitalize} não possui o link #{link}"
    skip_this_scenario
  elsif $site == "extra" && (link == "Como pagar" || link == "Política e Privacidade" || link == "Retira Rápido" || link == "Revelação Digital" || link == "Pontofrio Atacado" || link == "Entrega Agendada" || link == "Conheça o Pontofrio" || link == "Sobre o Pontofrio.com" || link == "Relação com Investidores" || link == "Ponto Premium" ||
  link == "Programa de Afiliados" || link == "Via Varejo Ads" || link == "Trabalhe conosco" || link == "Atendimento para Internet ou Televendas" || link == "Sobre a Entrega" || link == "Sobre a entrega" || link == "Nota Fiscal Eletrônica" || link == "Editar meu Cadastro" || link == "Seguro de Garantia Estendida Original" || link == "Prepare-se para o Black Friday" || link == "Prepare-se para a BlackFriday" ||
  link == "Sobre as Casas Bahia" || link == "Cartão Casas Bahia" || link == "Nossas Lojas" || link == "Lojas Físicas" || link == "Privacidade e Segurança" || link == "Anuncie com a gente" || link == "Venda seus produtos nas Casas Bahia" || link == "Atendimento para Loja Física")
    p "#{$site.capitalize} não possui o link #{link}"
    skip_this_scenario
  else
    if $site == "pontofrio"
      find(".footer-link", text: link).click
      sleep(1)
      if link == "Atendimento para Loja Física" || link == "Relação com Investidores" || link == "Ponto Premium" || link == "Via Varejo Ads" || link == "Trabalhe conosco" || link == "Nossas Lojas"
        @common. vai_para_guia(1)
      end
    else
      sleep(1)
      if all("a[title='#{link}']", wait: 15).count >= 2
        all("a[title='#{link}']", wait: 15)[1].click
      else
        find("a[title='#{link}']", wait: 15).click
      end
      sleep(1)
      if $site == "casasbahia" && (link == "Sobre as Casas Bahia" || link == "Cartão Casas Bahia" || link == "Lojas Físicas" || link == "Trabalhe Conosco" || link == "Mapa do Site" || link == "Anuncie com a gente" || link == "Lista de Casamento" || link == "Nossas Lojas")
        @common. vai_para_guia(1)
      elsif $site == "extra" && (link == "Anuncie com a Gente")
        @common. vai_para_guia(1)
      end
    end
  end
end
