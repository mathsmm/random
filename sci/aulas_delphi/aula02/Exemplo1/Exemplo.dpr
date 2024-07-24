program Exemplo;

uses
  Vcl.Forms,
  uExemplo in 'uExemplo.pas' {frExemplo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrExemplo, frExemplo);
  Application.Run;
end.
