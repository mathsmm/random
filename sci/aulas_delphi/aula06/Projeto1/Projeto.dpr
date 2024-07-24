program Projeto;

uses
  Vcl.Forms,
  uCadastroPessoa in 'uCadastroPessoa.pas' {frTelaCadastroPessoa},
  uDataModule in 'uDataModule.pas' {dmCadastro: TDataModule},
  uCadastroPai in 'uCadastroPai.pas' {frTelaCadastroPai},
  uPessoa in 'uPessoa.pas',
  uConsultaPai in 'uConsultaPai.pas' {frTelaConsultaPai},
  uConsultaPessoa in 'uConsultaPessoa.pas' {frTelaConsultaPessoa},
  uPessoaFisica in 'uPessoaFisica.pas',
  uPessoaJuridica in 'uPessoaJuridica.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrTelaCadastroPessoa, frTelaCadastroPessoa);
  Application.CreateForm(TdmCadastro, dmCadastro);
  Application.CreateForm(TfrTelaCadastroPai, frTelaCadastroPai);
  Application.CreateForm(TfrTelaConsultaPai, frTelaConsultaPai);
  Application.CreateForm(TfrTelaConsultaPessoa, frTelaConsultaPessoa);
  Application.Run;
end.
