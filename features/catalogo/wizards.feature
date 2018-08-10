#language: pt
@atracao
Funcionalidade: Verificar todas as funcionalidades dos Wizards.
  Como usuário eu quero fazer busca, navegar pelos Wizards e finalizar a navegação.

Contexto:
  Dado que acesso o site da bandeira

@wizard_moveis_busca @busca
Esquema do Cenário: Realizar uma busca, fazer a navegação e validar o resultado.

  E realizo a pesquisa <wizard>
  Quando faço a navegação pelo wizard com as opçoes aleatórias
  Entao valido a finalizacao da navegação do wizard

Exemplos:
  | wizard         |
  | "Sofa"         |
  | "Colchao"      |
  | "Guarda roupa" |
  | "Armario"      |

@wizard_moveis_busca_repetir @busca
Esquema do Cenário: Realizar uma busca, fazer a navegação e validar o resultado e repetir.

  E realizo a pesquisa <wizard>
  E faço a navegação pelo wizard com as opçoes aleatórias
  E valido a finalizacao da navegação do wizard
  Quando clico em repetir a navegação
  Entao valido a tela do primeiro passo do wizard

Exemplos:
  | wizard         |
  | "Sofa"         |
  | "Colchao"      |
  | "Guarda roupa" |
  | "Armario"      |

@wizard_moveis_busca_fechar @busca
Esquema do Cenário: Realizar uma busca, começar a navegação, clicar em fechar e validar a tela inicial.

  E realizo a pesquisa <wizard>
  E começo a navegação pelo wizard com as opçoes aleatórias
  Quando clico em fechar
  Entao valido a tela inicial do wizard

Exemplos:
  | wizard         |
  | "Sofa"         |
  | "Colchao"      |
  | "Guarda roupa" |
  | "Armario"      |

@wizard_moveis_busca_fechar_final @busca
Esquema do Cenário: Realizar uma busca, fazer a navegação, clicar em fechar e validar a tela inicial.

  E realizo a pesquisa <wizard>
  E faço a navegação pelo wizard com as opçoes aleatórias
  Quando clico em fechar
  Entao valido a tela inicial do wizard

Exemplos:
  | wizard         |
  | "Sofa"         |
  | "Colchao"      |
  | "Guarda roupa" |
  | "Armario"      |

@wizard_moveis_busca_atualizar @busca
Esquema do Cenário: Realizar uma busca, começar a navegação, atualizar a página e validar a tela inicial.

  E realizo a pesquisa <wizard>
  E começo a navegação pelo wizard com as opçoes aleatórias
  Quando eu atualizo a pagina
  Entao valido a tela inicial do wizard

Exemplos:
  | wizard         |
  | "Sofa"         |
  | "Colchao"      |
  | "Guarda roupa" |
  | "Armario"      |

@wizard_moveis_busca_atualizar_final @busca
Esquema do Cenário: Realizar uma busca, fazer a navegação, atualizar a página e validar o resultado.

  E realizo a pesquisa <wizard>
  E faço a navegação pelo wizard com as opçoes aleatórias
  Quando eu atualizo a pagina
  Entao valido a finalizacao da navegação do wizard

Exemplos:
  | wizard         |
  | "Sofa"         |
  | "Colchao"      |
  | "Guarda roupa" |
  | "Armario"      |

@wizard_moveis @vitrine
Esquema do Cenário: Realizar uma navegação até o Wizard, fazer a navegação e validar o resultado.

  E eu clico no departamento "Móveis"
  E eu clico na categoria <categoria>
  Quando faço a navegação pelo wizard com as opçoes aleatórias
  Entao valido a finalizacao da navegação do wizard

Exemplos:
  | categoria        |
  | "Sofás"          |
  | "Colchões"       |
  | "Guarda-roupas"  |
  | "Cozinha"        |

@wizard_moveis_repetir @vitrine
Esquema do Cenário: Realizar uma navegação até o Wizard, fazer a navegação e validar o resultado e repetir.

  E eu clico no departamento "Móveis"
  E eu clico na categoria <categoria>
  E faço a navegação pelo wizard com as opçoes aleatórias
  E valido a finalizacao da navegação do wizard
  Quando clico em repetir a navegação
  Entao valido a tela do primeiro passo do wizard

Exemplos:
  | categoria        |
  | "Sofás"          |
  | "Colchões"       |
  | "Guarda-roupas"  |
  | "Cozinha"        |

@wizard_moveis_fechar @vitrine
Esquema do Cenário: Realizar uma navegação até o Wizard, começar a navegação, clicar em fechar e validar a tela inicial.

  E eu clico no departamento "Móveis"
  E eu clico na categoria <categoria>
  E começo a navegação pelo wizard com as opçoes aleatórias
  Quando clico em fechar
  Entao valido a tela inicial do wizard

Exemplos:
  | categoria        |
  | "Sofás"          |
  | "Colchões"       |
  | "Guarda-roupas"  |
  | "Cozinha"        |

@wizard_moveis_fechar_final @vitrine
Esquema do Cenário: Realizar uma navegação até o Wizard, fazer a navegação, clicar em fechar e validar a tela inicial.

  E eu clico no departamento "Móveis"
  E eu clico na categoria <categoria>
  E faço a navegação pelo wizard com as opçoes aleatórias
  Quando clico em fechar
  Entao valido a tela inicial do wizard

Exemplos:
  | categoria        |
  | "Sofás"          |
  | "Colchões"       |
  | "Guarda-roupas"  |
  | "Cozinha"        |

@wizard_moveis_atualizar @vitrine
Esquema do Cenário: Realizar uma navegação até o Wizard, começar a navegação, atualizar a página e validar a tela inicial.

  E eu clico no departamento "Móveis"
  E eu clico na categoria <categoria>
  E começo a navegação pelo wizard com as opçoes aleatórias
  Quando eu atualizo a pagina
  Entao valido a tela inicial do wizard

Exemplos:
  | categoria        |
  | "Sofás"          |
  | "Colchões"       |
  | "Guarda-roupas"  |
  | "Cozinha"        |

@wizard_moveis_atualizar_final @vitrine
Esquema do Cenário: Realizar uma navegação até o Wizard, fazer a navegação, atualizar a página e validar o resultado.

  E eu clico no departamento "Móveis"
  E eu clico na categoria <categoria>
  E faço a navegação pelo wizard com as opçoes aleatórias
  Quando eu atualizo a pagina
  Entao valido a finalizacao da navegação do wizard

Exemplos:
  | categoria       |
  | "Sofás"         |
  | "Colchões"      |
  | "Guarda-roupas" |
  | "Cozinha"       |
