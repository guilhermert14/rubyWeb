require 'ffaker'
require './features/support/pages/common.rb'

REGISTRO = {
    dados_validos: {
        nome: FFaker::NameBR.name,
        cpf: FFaker::IdentificationBR.cpf,
        dddPhone: 11,
        phone: 988233005,
        dddPhone2: 11,
        phone2: 988233005,
        nascData: [01,01,1994],
        email: FFaker::Internet.email,
        password: 'ViaVarejo2017'
    },
}

ENDERECO = {
    sucesso:{
      estado:"SP",
      regiao:"Capital",
      cidade: "o Paulo",
      bairro:"Cambuci",
      loja:"Casas Bahia"
    }
}

LOGIN = {
  usuarioValido: {
    email:'marcos.barbosa@groove.tech',
    senha: 'Br@sil123'
  },

  usuarioValido2: {
    email:'qautomacao@gmail.com',
    senha: 'Br@sil123'
},
  usuarioLucas: {
    email:'vinicius.rosa@cnova.com',
    senha:'teste2017'
  },
  usuarioLucasTeste: {
    email: 'teste@testeqa123.com',
    senha: 'Br@sil123'
},
  usuarioGuilhermeTeste: {
    email:'guilhermeteste20@groove.tech',
    senha: 'teste2018'
  },
  usuarioNerso: {
    email:'nerso@nerso.com',
    senha: '123456'
  },
  usuarioBlackList: {
    email:'user_automacao03112014_090627649@cnova.com',
    senha: '123456'
  },
  usuarioBlackListBoleto: {
    email:'user_automacao03112014_090634513@cnova.com',
    senha: '123456'
  },
  usuarioCupomOmni: {
    email:'cupomdesconto2@gmail.com',
    senha: 'a123456'
  },
}

CARTAO = {
  dadosValidos: {
    numero: 4111111111111111,
    dtValMes: 01,
    dtValAno: 2021,
    cvv: 111,
    nome: "Marcos Barbosa"
  },
  master: {
    numero: 5567474977476697,
    dtValMes: 01,
    dtValAno: 2021,
    cvv: 111,
    nome: "teste master"
  },
  mesInvalido: {
    numero: 5567474977476697,
    dtValMes: "",
    dtValAno: 2021,
    cvv: 111,
    nome: "teste master"
  },
  anoInvalido: {
    numero: 5567474977476697,
    dtValMes: 01,
    dtValAno: "",
    cvv: 111,
    nome: "teste master"
  },
  nomeInvalido: {
    numero: 5567474977476697,
    dtValMes: 01,
    dtValAno: 2021,
    cvv: 111,
    nome: "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
},
  caractereInvalido: {
    numero: 5567474977476697,
    dtValMes: 01,
    dtValAno: 2021,
    cvv: 111,
    nome: "Gu!lh&rme teste"
  },
  codigoInvalido: {
    numero: 5567474977476697,
    dtValMes: 01,
    dtValAno: 2021,
    cvv: "",
    nome: "teste master"
  },
  cartaoInvalido: {
    numero: 4111111111111111111,
    dtValMes: 01,
    dtValAno: 2021,
    cvv: "",
    nome: "teste master"
  },
  dadosInvalidos: {
    numero: "",
    dtValMes: 01,
    dtValAno: 2021,
    cvv: "",
    nome: ""
  }
}
CEP = {
  cepValido: {
    cep: FFaker::AddressBR.zip_code
  },
  cepNumero: {
    cep: "09560065"
  },
  cepAll: {
    cep: ['05112010','06449060','06447540','08584-195','18307-575','09134-710']
  }
}

name = "#{FFaker::NameBR.first_name} #{FFaker::NameBR.last_name}"
NOVO_CLIENTE = {
  'name' => name,
  'cpf' => FFaker::IdentificationBR.cpf,
  'cnpj' => FFaker::IdentificationBR.cnpj,
  'phone_type' => ['Residencial','Celular','Comercial'].sample,
  'phone_ddd' => ['11','12','99'].sample,
  'phone_number' => FFaker::PhoneNumberBR.phone_number,
  'data_nascimento' => ['26','01','1989'],
  'gender' => ['M','F'].sample,
  'estado' => ['AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG','MS', 'MT','PA','PB','PE','PI','PR','RJ','RN','RO','RR','RS','SC','SE','SP','TO'].sample,
  'email' => FFaker::InternetSE.free_email(name),
  'senha' => 'a123456',
  'ie' => ['885544', '556478','322566','845735'].sample,
  'tipo_endereco' => ['Residencial','Comercial','Outro'].sample,
  'cep' => ['09520010','09854020','38402196'].sample,
  'numero' => '93',
  'ref' => 'Próximo a estação CPTM'
}
