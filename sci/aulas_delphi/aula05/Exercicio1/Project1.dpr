program Project1;

uses
  Vcl.Forms,
  uTelaPrincipal in 'uTelaPrincipal.pas' {frTelaPrincipal},
  uPessoa in 'uPessoa.pas' {frPessoa},
  uFuncionario in 'uFuncionario.pas' {frFuncionario},
  uSupervisor in 'uSupervisor.pas' {frSupervisor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrTelaPrincipal, frTelaPrincipal);
  Application.CreateForm(TfrPessoa, frPessoa);
  Application.CreateForm(TfrFuncionario, frFuncionario);
  Application.CreateForm(TfrSupervisor, frSupervisor);
  Application.Run;
end.
