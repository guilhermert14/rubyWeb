#language: pt
@regressivo @atracao
Funcionalidade: Verificar todas as funcionalidades do Widget de Pneus.
  Como usuário eu quero fazer busca, navegar pelo Widget de Pneus e validar a navegação.

Contexto:
  Dado que acesso o site da bandeira

@widget_pneu_busca @busca
Cenario: Realizar uma busca de pneu, fazer a navegação e validar o resultado.

  E realizo a pesquisa "pneu"
  Quando faço a navegação pelo widget com as opçoes aleatórias
  Entao valido a finalizacao da navegação do widget

@widget_pneus_busca @busca
Cenario: Realizar uma busca de pneus, fazer a navegação e validar o resultado clicando em ver todas as ofertas.

  E realizo a pesquisa "pneus"
  E faço a navegação pelo widget com as opçoes aleatórias
  E valido a finalizacao da navegação do widget
  Quando clico em ver todas as ofertas
  Então valido o resultado do widget

@widget_pneus_categoria @vitrine
Cenario: Realizar a navegação até o widget de pneus, fazer a navegação e validar o resultado.

  E eu clico no departamento "Automotivo"
  Quando faço a navegação pelo widget com as opçoes aleatórias
  Entao valido a finalizacao da navegação do widget

@widget_pneu_busca_medida @busca @medida
Cenario: Realizar uma busca de pneu, clicar em buscar por medida, fazer a navegação e validar o resultado.

  E realizo a pesquisa "pneu"
  E clico em buscar por medida
  Quando faço a navegação pelo widget com as opçoes aleatórias
  Entao valido a finalizacao da navegação do widget

@widget_pneus_busca_medida @busca @medida
Cenario: Realizar uma busca de pneus, clicar em buscar por medida, fazer a navegação e validar o resultado.

  E realizo a pesquisa "pneus"
  E clico em buscar por medida
  E faço a navegação pelo widget com as opçoes aleatórias
  E valido a finalizacao da navegação do widget
  Quando clico em ver todas as ofertas
  Então valido o resultado do widget
