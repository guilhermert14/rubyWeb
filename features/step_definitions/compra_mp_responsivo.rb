#encoding: utf-8
#Contexto
Dado("Adiciono um produto com garantia no carrinho") do
    @paginaInicial.chamar_url #tentar implementar no Hooks
    sorteia_produto_garantia = %w{10404669 10030427 1820215}.sample
    @paginaInicial.pesquisa_produto(sorteia_produto_garantia)
    @paginaBusca.selecionar_produto()
    @paginaCarrinho.adicionar_item_ao_carrinho
    @paginaGarantia.seleciona_garantia('24_meses')
end

Dado("Adiciono um produto sem garantia no carrinho") do
    @paginaInicial.chamar_url #tentar implementar no Hooks
    @paginaInicial.fechar_banner_promocional #tentar implementar no Hooks
    sorteia_produto_simples = %w{fraldas livros toalha lençol pneu panelas faqueiro}.sample
    @paginaInicial.pesquisa_produto(sorteia_produto_simples)
    sorteia_posicao = [0,1,2].sample
    @paginaBusca.selecionar_produto(sorteia_posicao)
    @paginaCarrinho.adicionar_item_ao_carrinho
end

Dado("Sou redirecionado para a tela do carrinho no endereço responsivo") do
    @paginaInicial.chamar_url_responsivo if $site == 'barateiro'
    @paginaCarrinho.concluir_compra_responsivo if $site == 'barateiro'
    @paginaCarrinho.concluir_compra if $site != 'barateiro'
end

Dado("Realizo a autenticação no site") do
    @paginaLogin.login_responsivo('meiospagamento003@gmail.com', 'a123456') if $site == 'barateiro'
    @paginaLogin.login('meiospagamento003@gmail.com', '123456') if $site != 'barateiro'
end

#steps
Quando("escolho a forma de entrega {string}") do |tipo_entrega|
    @paginaEntrega.escolher_tipo_entrega_responsivo(tipo_entrega) if $site == 'barateiro'
    @paginaEntrega.seleciona_tipo_entrega(tipo_entrega, 'sucesso') if $site != 'barateiro'
end

Quando("finalizo uma compra com o cartão de crédito {string}") do |bandeira|
    @paginaPagamento.pagar_um_cartao_r(bandeira) if $site == 'barateiro'
end

Quando("finalizo uma compra com o boleto") do
    @paginaPagamento.pagar_com_boleto_responsivo_mp if $site == 'barateiro'
end

Quando("finalizo uma compra com o débito {string}") do |bandeira_debito|
    @paginaPagamento.pagar_com_debito_responsivo_mp(bandeira_debito) if $site == 'barateiro'
end

Então("visualizo o número do pedido na tela de finalização") do
    @paginaFinalizacao.finalizar_pedido_responsivo_mp if $site == 'barateiro'
end
################################# esqueci meu email #############################

Dado("que estou na tela de login checkout responsivo") do
    visit 'https://checkout.barateiro.com.br/Login'
    assert_selector('input[name="login"]', wait: 30)
end

Dado("clico no link Esqueci meu email") do
    txt = "Esqueci meu e-mail"
    assert_selector('a', text: txt)
    find('a', text: txt).click
end

Dado(/^eu preencho os dados do usuario "([^"]*)"$/) do |tipo_pessoa|
#Quando("eu preencho os dados do usuario {string}") do |tipo_pessoa|
    @tipo_pessoa = tipo_pessoa
    if tipo_pessoa == "cpf"
      @paginaModal.esqueci_meu_email_responsivo(tipo_pessoa)
    else
      @common.clica_elemento("botao_tipo_pessoa_pj_checkout")
      @paginaModal.esqueci_meu_email_responsivo(tipo_pessoa)
    end
end

Então("recebo os dados do meu email") do
    #Por default vem Pessoa fisica
    if @tipo_pessoa == "cpf"
      @common.clica_elemento("botao_enviar_pf_esqueci_email", 1)
    else
    @common.clica_elemento("botao_enviar_pj_esqueci_email")
    @email_recuperado = find('p[class="warning"]')
      puts @email_recuperado
    end

end
