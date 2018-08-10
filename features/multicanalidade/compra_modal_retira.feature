#language: pt
@multicanal
Funcionalidade: Finalizacao de compra atraves do Modal Retira

Contexto: Acessar produto com tag Retira Rapido com usuario logado
  Dado que estou logado com "usuarioValido2"

#126956
@fast @126956 @regressivo
Cenário: Compra de SKU s/ serviço, Retira no Modal e cartão de crédito (estoque loja)
  E que acesso um produto com a tag "normal_com_garantia"
  E eu clico no botao "botao_Retirar+"
  E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "02047050"
  E eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
  E eu clico dentro do modal "retira" no botao "botao_retira_24horas"
  Quando eu seleciono dentro do modal "retira" a primeira loja
  Entao realizo a finalizacao da compra com "boleto" e garantia "nao"

@fast @regressivo
Cenário: Compra de SKU s/ serviço, Retira no Modal e cartão de crédito (estoque site)
  E que acesso um produto com a tag "normal_com_garantia"
  E eu clico no botao "botao_Retirar+"
  E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "06449060"
  E eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
  Quando eu seleciono dentro do modal "retira" a primeira loja
  Entao realizo a finalizacao da compra com "boleto" e garantia "nao"

#126964
@fast @regressivo
  Cenário: Compra de SKU c/ serviço, Retira no Modal e cartão de crédito (estoque loja)
    E que acesso um produto com a tag "retira_sem_servico_estoque_site"
    E eu clico no botao "botao_RetirarNaLoja"
    E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "06186100"
    E eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
    E eu clico dentro do modal "retira" no botao "botao_retira_24horas"
    Quando eu seleciono dentro do modal "retira" a primeira loja
    Entao realizo a finalizacao da compra com "boleto" e garantia "12_meses"

#126963
@fast @regressivo2121
Cenário: Compra de SKU c/ serviço, Retira no Modal e cartão de crédito (estoque site)
  E que acesso um produto com a tag "retira_com_servico_estoque_site"
  E eu clico no botao "botao_RetirarNaLoja"
  E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "06186100"
  E eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
  Quando eu seleciono dentro do modal "retira" a primeira loja
  Entao realizo a finalizacao da compra com "boleto" e garantia "12_meses"

Cenário: Compra de SKU c/ serviço, Retira no Modal e debito (estoque site)
  E que acesso um produto com a tag "retira_com_servico_estoque_site"
  E eu clico no botao "botao_RetirarNaLoja"
  E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "06186100"
  E eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
  Quando eu seleciono dentro do modal "retira" a primeira loja
  Entao realizo a finalizacao da compra com "debito_online_itau" e garantia "12_meses"

@ref
  Cenário: Compra de SKU c/ serviço, Retira no Modal e cartão de crédito (estoque site)
    E que acesso um produto com a tag "retira_com_servico_estoque_site"
    E eu clico no botao "botao_RetirarNaLoja"
    E que eu insiro dentro do modal "retira" no campo "texto_cep" o valor "06186100"
    E eu clico dentro do modal "retira" no botao "botao_EncontrarLojas"
    Quando eu seleciono dentro do modal "retira" a primeira loja
    Entao realizo a finalizacao da compra com "um_cartao_credito_master" e garantia "12_meses"

#126947
@fast @ref @regressivo
  Cenário: Compra de SKU s/ serviço, Retira na página de endereços e cartão de credito
    E que acesso um produto com a tag "retira_sem_servico_estoque_site"
    E eu clico no botao "botao_Comprar"
    E eu clico no botao "botao_ConcluirCompra"
    E seleciono a forma de entrega "Retira" com endereco "sucesso"
    Entao realizo a finalizacao da compra pela tela de enderecos com "boleto" e garantia "nao"

#126949
@fast
  Cenário: Compra de SKU c/ serviço, Retira na página de endereços e cartão de credito
    E que acesso um produto com a tag "retira_com_servico_estoque_site"
    E adiciono o item ao carrinho pelo metodo "normal_servico" e garantia "12_meses"
    E eu clico no botao "botao_ConcluirCompra"
    E seleciono a forma de entrega "Retira" com endereco "sucesso"
    Entao realizo a finalizacao da compra pela tela de enderecos com "boleto" e garantia "12_meses"
