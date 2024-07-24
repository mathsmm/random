unit uSupervisor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers,
  uFuncionario;

  type
    TSupervisor = class(TFuncionario)
      protected
      wSetor : String;
      function fNome : String; override;
      function fTipo : String; override;
    end;

type
  TfrSupervisor = class(TfrFuncionario)
    lbSetorSupervisor: TLabel;
    edSetorSupervisor: TEdit;
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
    objSupervisor : TSupervisor;
  public
    { Public declarations }
  end;

var
  frSupervisor: TfrSupervisor;

implementation

uses
  uTelaPrincipal;

{$R *.dfm}

procedure TfrSupervisor.btSalvarClick(Sender: TObject);
var
  wSupervisor : TSupervisor;
begin
  inherited;
  wSupervisor := TSupervisor.Create;
  wSupervisor.wSetor := edSetorSupervisor.Text;

  frTelaPrincipal.cdsClientDataSet.FieldByName('bdSETOR')
                                   .AsString
                                   := wSupervisor.wSetor;

  frTelaPrincipal.cdsClientDataSet.FieldByName('bdTipo')
                                   .AsString := wSupervisor.fTipo;

  frTelaPrincipal.cdsClientDataSet.FieldByName('bdNOME')
                                   .AsString := wSupervisor.fNome;
end;

{ TSupervisor }

function TSupervisor.fNome: String;
var
  wStrAuxiliar : String;
begin
  wStrAuxiliar := Copy(frTelaPrincipal.cdsClientDataSet.FieldByName('bdNOME')
                       .AsString, 13);
  Result := 'Supervisor ' + wStrAuxiliar;
end;

function TSupervisor.fTipo: String;
begin
  Result := 'Supervisor';
end;

end.
