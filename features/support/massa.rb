 require 'rest-client'
 require 'json-schema'
class MassaDados

  def retira_com_servico_estoque_site
     url = "http://www.testdatamanagerhlg.net/skus/comservicos?request.sku.qtdeRegistros=5&request.sku.flagSkuSaldoDisponivel=true"
     api = RestClient.get(url)
     json = JSON.parse(api)
     sku = { tag:{ normal:[json['skus'].sample['idSku']]}}
     return sku = sku[:tag][:normal][0]
  end

  def retira_sem_servico_estoque_site
    url = "http://www.testdatamanagerhlg.net/skus/semservicos?request.sku.qtdeRegistros=5&request.sku.flagSkuSaldoDisponivel=true"
    api = RestClient.get(url)
    json = JSON.parse(api)
    sku = { tag:{ normal:[json['skus'].sample['idSku']]}}
    return sku = sku[:tag][:normal][0]
  end

  def retira_com_servico_estoque_loja
    url = "http://www.testdatamanagerhlg.net/skus/comservicos?request.sku.qtdeRegistros=5&request.sku.flagSkuSaldoDisponivel=true"
    api = RestClient.get(url, headers={:Authorization=>"Yq0ehyqJgpuTOHIW31DNbmBgb+rWm/pwliSlqxGTzm64m06nFbqH/N/Qc9UEjq2pKibYNld5jbGsu4LgOeohsRGFC/nGRWgHhoxTwwX3P4QudjmATFHLXzvO65+ITN1K"})
    json = JSON.parse(api)
    sku = { tag:{ normal:[json['skus'].sample['idSku']]}}
    return sku = sku[:tag][:normal][0]
  end

  def retira_sem_servico_estoque_loja
    url = "http://www.testdatamanagerhlg.net/skus/semservicos?request.sku.qtdeRegistros=5&request.sku.flagSkuSaldoDisponivel=true"
    api = RestClient.get(url, headers={:Authorization=>"Yq0ehyqJgpuTOHIW31DNbmBgb+rWm/pwliSlqxGTzm64m06nFbqH/N/Qc9UEjq2pKibYNld5jbGsu4LgOeohsRGFC/nGRWgHhoxTwwX3P4QudjmATFHLXzvO65+ITN1K"})
    json = JSON.parse(api)
    sku = { tag:{ normal:[json['skus'].sample['idSku']]}}
    return sku = sku[:tag][:normal][0]
  end

end