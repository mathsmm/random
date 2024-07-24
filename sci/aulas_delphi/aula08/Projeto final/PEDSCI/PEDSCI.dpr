program PEDSCI;

uses
  Vcl.Forms,
  uPEDSCI in 'uPEDSCI.pas' {frPEDSCI},
  udmConnectionPEDSCI in '..\PEDSCIForms\DataModule\udmConnectionPEDSCI.pas' {dmConnectionPEDSCI: TDataModule},
  udmDadosPEDSCI in '..\PEDSCIForms\DataModule\udmDadosPEDSCI.pas' {dmDadosPEDSCI: TDataModule},
  uFormPadraoPEDSCI in '..\PEDSCIForms\uFormPadraoPEDSCI.pas' {frFormPadraoPEDSCI},
  uFormPadraoCadastroPEDSCI in '..\PEDSCIForms\uFormPadraoCadastroPEDSCI.pas' {frFormPadraoCadastroPEDSCI},
  uFormPadraoConsultaPEDSCI in '..\PEDSCIForms\uFormPadraoConsultaPEDSCI.pas' {frFormPadraoConsultaPEDSCI},
  uUtilPEDSCI in '..\PEDSCIForms\uUtilPEDSCI.pas',
  uConsEmpresasEXEMPLO in 'Consultas\uConsEmpresasEXEMPLO.pas' {frConsEmpresasEXEMPLO},
  uCadEmpresasEXEMPLO in 'Cadastros\uCadEmpresasEXEMPLO.pas' {frCadEmpresasEXEMPLO},
  uCadEmpresas in 'Cadastros\uCadEmpresas.pas' {frCadEmpresas},
  uCadClientes in 'Cadastros\uCadClientes.pas' {frCadClientes},
  uCadProdutos in 'Cadastros\uCadProdutos.pas' {frCadProdutos},
  uCadLancNotas in 'Cadastros\uCadLancNotas.pas' {frCadLancNotas},
  uConsEmpresas in 'Consultas\uConsEmpresas.pas' {frConsEmpresas},
  uConsClientes in 'Consultas\uConsClientes.pas' {frConsClientes},
  uConsProdutos in 'Consultas\uConsProdutos.pas' {frConsProdutos},
  uConsLancNotas in 'Consultas\uConsLancNotas.pas' {frConsLancNotas},
  uSelecionaClienteParaLancNotas in 'Cadastros\uSelecionaClienteParaLancNotas.pas' {frSelecionaCliente},
  uSelecionaEmpresaParaLancNotas in 'Cadastros\uSelecionaEmpresaParaLancNotas.pas' {frSelecionaEmpresa},
  uSelecionaProdutoParaItensNotas in 'Cadastros\uSelecionaProdutoParaItensNotas.pas' {frSelecionaProdutoItensNotas},
  uFormPadraoRelatorioPEDSCI in '..\PEDSCIForms\uFormPadraoRelatorioPEDSCI.pas' {frFormPadraoRelatorioPEDSCI},
  uRelEmpresas in 'Relatorios\uRelEmpresas.pas' {frRelEmpresas},
  uRelEmpresasEXEMPLO in 'Relatorios\uRelEmpresasEXEMPLO.pas' {frRelEmpresasEXEMPLO},
  uRelLancNotas in 'Relatorios\uRelLancNotas.pas' {frRelLancNotas},
  uSelecionaEmpresaRelLancNotas in 'Relatorios\uSelecionaEmpresaRelLancNotas.pas' {frSelecionaEmpresaParaRelLancNotas},
  uSelecionaClienteRelLancNotas in 'Relatorios\uSelecionaClienteRelLancNotas.pas' {frSelecionaClienteParaRelLancNotas},
  uCadItensNotas in 'Cadastros\uCadItensNotas.pas' {frCadItensNotas},
  uSelecionaEmpresaParaItensNotas in 'Cadastros\uSelecionaEmpresaParaItensNotas.pas' {frSelecionaEmpresaItensNotas},
  uSelecionaNotaParaItensNotas in 'Cadastros\uSelecionaNotaParaItensNotas.pas' {frSelecionaNotaItensNotas},
  uConsItensNotas in 'Consultas\uConsItensNotas.pas' {frConsItensNotas},
  uRelClientes in 'Relatorios\uRelClientes.pas' {frRelClientes},
  uRelProdutos in 'Relatorios\uRelProdutos.pas' {frRelProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrPEDSCI, frPEDSCI);
  Application.CreateForm(TdmConnectionPEDSCI, dmConnectionPEDSCI);
  Application.CreateForm(TdmDadosPEDSCI, dmDadosPEDSCI);
  Application.Run;
end.
