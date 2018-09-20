cadastro_processo = CadastroProcesso.new
  
  Dado("que acessei o menu Cadastro de processo") do
    sleep(0.1)
    #cadastro_processo.link_cadastro_processo.click
    cadastro_processo.find_link(:link_cadastro_processo,"Cadastro de Processo").click
  end
  
  Dado("informo o assunto do processo e avanço para a próxima etapa") do
    cadastro_processo.codigo_classe.set 'Processo de designação de autoridade consular'
    cadastro_processo.proximo.click
  end
  
  Dado("preencho os dados básicos do cadastro") do
    cadastro_processo.marcar_resp.click
    cadastro_processo.interessado.set '05114568590'
    cadastro_processo.detalhamento.set 'Automação'
    cadastro_processo.proximo.click
  end
  
  Dado("concluo o cadastro do Processo") do
    cadastro_processo.proximo.click
  end
  
  Entao("o sistema exibe a confirmação de sucesso e o número do cadastro de processo") do
    expect(cadastro_processo).to have_text('Processo número')
    expect(cadastro_processo).to have_text('cadastrado com sucesso')
  end