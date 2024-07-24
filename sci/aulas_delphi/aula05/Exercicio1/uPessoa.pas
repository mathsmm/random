unit uPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers, uTelaPrincipal;

  type
    TPessoa = class
      protected
      wCodigo   : Integer;
      wTipo     : String;
      wNome     : String;
      wCPF      : String;
      wDataNasc : TDate;
      function fTipo : String;  virtual; abstract;
    end;

type
  TfrPessoa = class(TForm)
    lbNomePessoa: TLabel;
    lbCPFPessoa: TLabel;
    edNomePessoa: TEdit;
    edCPFPessoa: TEdit;
    lbDataNascPessoa: TLabel;
    edDataNascPessoa: TDatePicker;
    btSalvar: TButton;
    edCodigo: TEdit;
    lbID: TLabel;
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function fCriarObjPessoa : TPessoa;
  public
    { Public declarations }
  end;

var
  frPessoa: TfrPessoa;

implementation

{$R *.dfm}

procedure TfrPessoa.btSalvarClick(Sender: TObject);
var
  wPessoa : TPessoa;
begin
  frTelaPrincipal.cdsClientDataSet.IndexFieldNames := 'bdCODIGO';
  if frTelaPrincipal.cdsClientDataSet.FindKey([edCodigo.Text]) then
   frTelaPrincipal.cdsClientDataSet.Edit
  else
   frTelaPrincipal.cdsClientDataSet.Insert;

   wPessoa := fCriarObjPessoa;

   frTelaPrincipal.cdsClientDataSet.FieldByName('bdCODIGO')
                                   .AsInteger
                                   := wPessoa.wCodigo;
   frTelaPrincipal.cdsClientDataSet.FieldByName('bdTIPO')
                                   .AsString
                                   := wPessoa.wTipo;
   frTelaPrincipal.cdsClientDataSet.FieldByName('bdNOME')
                                   .AsString
                                   := wPessoa.wNome;
   frTelaPrincipal.cdsClientDataSet.FieldByName('bdCPF')
                                   .AsString
                                   := wPessoa.wCPF;
   frTelaPrincipal.cdsClientDataSet.FieldByName('bdDATANASC')
                                   .AsDateTime
                                   := wPessoa.wDataNasc;
end;

function TfrPessoa.fCriarObjPessoa: TPessoa;
var
  wPessoa : TPessoa;
begin
  wPessoa := TPessoa.Create;
  wPessoa.wCodigo     := StrToInt(edCodigo.Text);
  wPessoa.wTipo       := 'Pessoa';
  wPessoa.wNome       := edNomePessoa.Text;
  wPessoa.wCPF        := edCPFPessoa.Text;
  wPessoa.wDataNasc   := edDataNascPessoa.Date;

  Result := wPessoa;
end;

end.
