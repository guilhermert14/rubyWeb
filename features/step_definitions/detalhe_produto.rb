
#encode: UTF-8
Dado(/^eu clico no link "([^"]*)"$/) do |link|
  @common.clica_elemento(link)
end

Quando(/^seleciono a ordenacao da lista por "([^"]*)"$/) do |ordem|
  sleep(6)
    @paginaLojistas.seleciona_ordenacao(ordem)
end

Dado(/^que acesso um produto com a tag "([^"]*)"$/) do |tipo|
  $item = PRODUTO[:tag]
  local = DATA["sku"]
  local = local.gsub('bandeira', $site)
  # $item_tipo << $item[eval(":#{tipo}")][0]
  # sku = MassaDados.new.send(tipo)
  # local = local.gsub('sku', sku.to_s)
  local = local.gsub('sku', $item[eval(":#{tipo}")].sample)
  visit(local)
end

Dado(/^que insiro uma lista de skus "([^"]*)" no carrinho$/) do |produto|
  $produto = 0
  qtd = 6
  while $produto < qtd
    $item = PRODUTO[:tag]
    local = DATA["sku"]
    local = local.gsub('bandeira', $site)
    local = local.gsub('sku', $item[eval(":#{produto}")].sample)
    visit(local)
    find(EL["botao_Comprar"]).click
    if "normal_com_garantia"
      assert_selector(EL["botao_RecusaGarantia"],wait:15, visible:true)
      (all(EL["botao_RecusaGarantia"])[0]).click
    end
    $produto += 1
    $qtd_produto = all('td[data-id="tdPrd"]').count
  end
end




Quando(/^adiciono ele ao carrinho sem garantia$/) do
  @common.adiciona_item_carrinho("normal","nao")
  if has_selector?(EL['botao_ConcluirCompra'], wait: 30)
    find(EL['botao_ConcluirCompra'], wait: 15).click
  else has_selector?(EL['botao_Concluir'], wait: 30)
    find(EL['botao_Concluir'], wait: 30).click
  end

end

Dado(/^eu insiro no campo "([^"]*)" o valor "([^"]*)"$/) do |campo, valor|
  sleep(1)
  valor == "randomEmail" ? @common.clicar_inserir_valor(campo,eval(MASSA[valor])) : @common.clicar_inserir_valor(campo,valor)
end
