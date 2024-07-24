unit uFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers,
  uPessoa;

  type
    TFuncionario = class(TPessoa)
      protected
      wDataAdmissao  : TDate;
      function fNome : String; virtual;
      function fTipo : String; override;
    end;

type
  TfrFuncionario = class(TfrPessoa)
    lbDataAdmissaoFuncionario: TLabel;
    edDataAdmissaoFuncionario: TDatePicker;
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frFuncionario: TfrFuncionario;

implementation
  uses
    uTelaPrincipal;

{$R *.dfm}

procedure TfrFuncionario.btSalvarClick(Sender: TObject);
var
  wFuncionario : TFuncionario;
begin
  inherited;
  wFuncionario := TFuncionario.Create;
  wFuncionario.wDataAdmissao := edDataAdmissaoFuncionario.Date;

  frTelaPrincipal.cdsClientDataSet.FieldByName('bdDATAADMISSAO')
                                   .AsDateTime
                                   := wFuncionario.wDataAdmissao;

  frTelaPrincipal.cdsClientDataSet.FieldByName('bdTipo')
                                   .AsString := wFuncionario.fTipo;

  frTelaPrincipal.cdsClientDataSet.FieldByName('bdNOME')
                                   .AsString := wFuncionario.fNome;
end;

{ TFuncionario }

function TFuncionario.fNome: String;
begin
  Result := 'Funcionário ' + frTelaPrincipal.cdsClientDataSet.FieldByName('bdNOME')
                             .AsString;
end;

function TFuncionario.fTipo: String;
begin
  Result := 'Funcionário';
end;

end.
