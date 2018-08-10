#language: pt
@atracao
Funcionalidade: Verificar todos os links do header, footer, serviços e a paginação.

Contexto:
  Dado que acesso a pagina de "login"

@header @links @mp
Esquema do Cenário: Verificar todos os links do header.

  E faço o login com email "valido" e senha "valida" e "não limpar" o carrinho
  E eu clico no botao "logo"
  Quando clico no <link> do header
  Então valido se a <link> esta correta

Exemplos:
  | link              |
  | "meus_pedidos"    |
  | "duvidas"         |
  | "atendimento"     |
  | "retira_rapido"   |
  | "carrinho"        |
  | "lista_casamento" |
  | "televendas"      |
  | "nossas_lojas"    |

@header @departamentos
Esquema do Cenário: Verificar todos os departamentos do header.

  Quando faço o login com email "valido" e senha "valida" e "não limpar" o carrinho
  E eu clico no botao "logo"
  Quando eu clico no departamento <departamento>
  Então valido se a <departamento> esta correta

Exemplos:
  | departamento              |
  | "Alimentos"               |
  | "Alimentos e Bebidas"     |
  | "Ar e Ventilação"         |
  | "Artesanato"              |
  | "Artigos para Festa"      |
  | "Artigos para Festas"     |
  | "Áudio"                   |
  | "Automotivo"              |
  | "Bebês"                   |
  | "Bebidas"                 |
  | "Beleza e Saúde"          |
  | "Brinquedos"              |
  | "Calçados"                |
  | "Câmeras e Filmadoras"    |
  | "Cama, Mesa e Banho"      |
  | "Casa e Construção"       |
  | "Celulares e Telefones"   |
  | "Cine e Foto"             |
  | "Decoração"               |
  | "DVDs e Blu-Ray"          |
  | "Eletrodomésticos"        |
  | "Eletroportáteis"         |
  | "Esporte e Lazer"         |
  | "Ferramentas"             |
  | "Festival de Verão"       |
  | "Flores"                  |
  | "Games"                   |
  | "Informática"             |
  | "Instrumentos Musicais"   |
  | "Joias"                   |
  | "Livros"                  |
  | "Linha Industrial"        |
  | "Malas"                   |
  | "Malas e Mochilas"        |
  | "Moda"                    |
  | "Móveis"                  |
  | "Móveis e Colchões"       |
  | "Natal"                   |
  | "Papelaria"               |
  | "Perfumaria"              |
  | "Pet Shop"                |
  | "Produtos Importados"     |
  | "Produtos de Limpeza"     |
  | "Relógios"                |
  | "Suplementos Alimentares" |
  | "Tablet"                  |
  | "Tablets"                 |
  | "Telefones e Celulares"   |
  | "TVs e Acessórios"        |
  | "Utilidades Domésticas"   |
  | "Vinhos e Cervejas"       |

@header @servicos
Esquema do Cenário: Verificar todos os links de serviços do header.

  Quando faço o login com email "valido" e senha "valida" e "não limpar" o carrinho
  E eu clico no botao "logo"
  Quando eu clico no departamento de serviço <servico>
  Então valido se a <servico> esta correta

Exemplos:
  | servico                                  |
  | "Atacado"                                |
  | "Seguro de Garantia Estendida Original"  |
  | "Fique Seguro"                           |
  | "Download / Games"                       |
  | "Montagem de Móveis"                     |
  | "Instalações"                            |
  | "Revelação Digital"                      |
  | "Multiassistência"                       |
  | "Lista de Casamento"                     |
  | "Retira Rápido"                          |
  | "Cartão Casas Bahia"                     |
  | "Cartão Pontofrio"                       |

@footer @links
Esquema do Cenário: Verificar todos os links do footer.

  E faço o login com email "valido" e senha "valida" e "não limpar" o carrinho
  E eu clico no botao "logo"
  Quando eu clico no <link> do footer
  Então valido se a <link> do footer esta correta

Exemplos:
  | link                                      |
  | "Atendimento para Internet ou Televendas" |
  | "Atendimento para Loja Física"            |
  | "Sobre a Entrega"                         |
  | "Sobre a entrega"                         |
  | "Política de Troca e Devolução"           |
  | "Nota Fiscal Eletrônica"                  |
  | "Editar meu Cadastro"                     |
  | "Nota Fiscal Paulista"                    |
  | "Seguro de Garantia Estendida Original"   |
  | "Termos e Condições de Uso"               |
  | "Quantidade de itens por pedido"          |
  | "Prepare-se para o Black Friday"          |
  | "Prepare-se para a BlackFriday"           |
  | "Sobre as Casas Bahia"                    |
  | "Cartão Casas Bahia"                      |
  | "Nossas Lojas"                            |
  | "Lojas Físicas"                           |
  | "Privacidade e Segurança"                 |
  | "Trabalhe Conosco"                        |
  | "Trabalhe conosco"                        |
  | "Lista de Casamento"                      |
  | "Mapa do Site"                            |
  | "Anuncie com a gente"                     |
  | "Venda seus produtos nas Casas Bahia"     |
  | "Palavras mais Buscadas"                  |
  | "Como pagar"                              |
  | "Política e Privacidade"                  |
  | "Retira Rápido"                           |
  | "Revelação Digital"                       |
  | "Pontofrio Atacado"                       |
  | "Entrega Agendada"                        |
  | "Conheça o Pontofrio"                     |
  | "Sobre o Pontofrio.com"                   |
  | "Relação com Investidores"                |
  | "Ponto Premium"                           |
  | "Programa de Afiliados"                   |
  | "Via Varejo Ads"                          |
  | "Atendimento Loja Física"                 |
  | "Prazos e locais de entrega"              |
  | "Política de Privacidade"                 |
  | "Meus Pedidos"                            |
  | "Editar Meu Cadastro"                     |
  | "Serviços"                                |
  | "Blog Extra"                              |
  | "Anuncie com a Gente"                     |
  | "Nosso manifesto. Vai que você pode!"     |
  | "Marketplace, Soluções & Serviços"        |

#@paginacao
#Cenario: Verificar a paginação.
#
#  E eu clico no botao "botao_CadastreSe"
#  E faço o login com email "valido" e senha "valida" e "não limpar" o carrinho
#  E eu clico no botao "logo"
