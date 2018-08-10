Dado(/^que eu insiro dentro do modal "([^"]*)" no campo "([^"]*)" o valor "([^"]*)"$/) do |modal,campo, valor|
  sleep(10)
  within_frame(EL[modal]) do
    find(EL[campo], wait: 15).set(valor)
  end
end

Quando(/^eu clico dentro do modal "([^"]*)" no botao "([^"]*)"$/) do |modal,botao|
  within_frame(EL[modal]) do
    @common.clica_elemento(botao)
  end
end

Quando(/^eu seleciono dentro do modal "([^"]*)" a primeira loja$/) do |modal|
  within_frame(EL[modal]) do
    @paginaModal.seleciona_loja(0)
  end
end

Entao(/^visualizo a exibicao do modal "([^"]*)" na Loja$/) do |modal|
  within_frame(EL[modal]) do
    @assertPage.valida_exibicao_modal_retira
  end
end

Entao(/^visualizo a exibicao da mensagem "([^"]*)" dentro do modal "([^"]*)" no elemento "([^"]*)"$/) do |msg,modal,elemento|
  within_frame(EL[modal]) do
    @assertPage.valida_exibicao_mensagem(elemento,msg)
  end
end

Entao(/^visualizo o modal "([^"]*)" fechado$/) do |modal|
  if has_selector?(EL[modal], visible:false)
      p "Modal fechado"
    else
      raise "Modal continua aberto"
  end
end
