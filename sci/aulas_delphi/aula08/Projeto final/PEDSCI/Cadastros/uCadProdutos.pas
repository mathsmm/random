unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoCadastroPEDSCI,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Datasnap.DBClient, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrCadProdutos = class(TfrFormPadraoCadastroPEDSCI)
    edCODPROD: TEdit;
    lbCODPROD: TLabel;
    edDESCPROD: TEdit;
    edNCMPROD: TEdit;
    lbNOMEPROD: TLabel;
    lbNCMPROD: TLabel;
    lbValor: TLabel;
    edValor: TEdit;
    SQLQueryMaiorCodigo: TSQLQuery;
    lbStatus: TLabel;
    procedure btConsultarClick(Sender: TObject);
    procedure edCODPRODExit(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure edCODPRODChange(Sender: TObject);
  private
    { Private declarations }
    procedure pDefinirStatus(prStatus : Integer);
    procedure pManipularTelaPorCampoCodigo(prExecucaoOpcional : Boolean);
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frCadProdutos: TfrCadProdutos;

implementation

uses
  udmDadosPEDSCI, uConsProdutos, uUtilPEDSCI;

{$R *.dfm}

{ TfrCadProdutos }

procedure TfrCadProdutos.btConsultarClick(Sender: TObject);
begin
  inherited;
  TfrConsProdutos.Create(Self);
  edCODPROD.SetFocus;
end;

procedure TfrCadProdutos.btExcluirClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if (wUtilPEDSCI.fVerificarCampoCodigo(edCODPROD.Text, wEdCodigo, True)) and
     (dmDadosPEDSCI.tbProdutos.FindKey([StrToInt(Trim(edCODPROD.Text))])) then
     dmDadosPEDSCI.tbProdutos.Delete;
end;

procedure TfrCadProdutos.btOkClick(Sender: TObject);
var
  wUtilPEDSCI   : TUtilPEDSCI;
  wEdCodigo     : Integer;
  wIntAuxiliar  : Integer;
  wCurrAuxiliar : Currency;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if not wUtilPEDSCI.fVerificarCampoCodigo(edCODPROD.Text, wEdCodigo, True) then
     exit;

  if (edDESCPROD.Text = '') or
     (not TryStrToInt (edNCMPROD.Text, wIntAuxiliar)) or
     (not TryStrToCurr(edValor.Text,  wCurrAuxiliar)) then
     begin
       ShowMessage('Ainda h� campos incompletos ou incorretos.');
       exit;
     end;

  if (dmDadosPEDSCI.tbProdutos.FindKey([wEdCodigo])) then
     dmDadosPEDSCI.tbProdutos.Edit
  else
     dmDadosPEDSCI.tbProdutos.Append;

  dmDadosPEDSCI.tbProdutos.FieldByName('BDCODPROD').AsInteger  := wEdCodigo;
  dmDadosPEDSCI.tbProdutos.FieldByName('BDDESCRICAO').AsString := Trim(Copy(edDESCPROD.Text, 1, 500));
  dmDadosPEDSCI.tbProdutos.FieldByName('BDNCM').AsString       := Trim(edNCMPROD.Text);
  dmDadosPEDSCI.tbProdutos.FieldByName('BDVALOR').AsCurrency   := wCurrAuxiliar;
  dmDadosPEDSCI.tbProdutos.Post;

  edCODPROD.SetFocus;
end;

procedure TfrCadProdutos.edCODPRODChange(Sender: TObject);
begin
  inherited;
  pManipularTelaPorCampoCodigo(False);
end;
                            
procedure TfrCadProdutos.edCODPRODExit(Sender: TObject);
begin
  inherited;
  pManipularTelaPorCampoCodigo(True);
//  else
//     setLimpaCampos;
end;

procedure TfrCadProdutos.pDefinirStatus(prStatus: Integer);
var
  wUtilPEDSCI : TUtilPEDSCI;
begin
  wUtilPEDSCI := TUtilPEDSCI.Create;
  lbStatus.Caption := wUtilPEDSCI.fRetornarStatus(prStatus);
end;

procedure TfrCadProdutos.pManipularTelaPorCampoCodigo(
  prExecucaoOpcional: Boolean);
var
  wUtilPEDSCI        : TUtilPEDSCI;
  wVerificacaoCodigo : Boolean;
  wEdCodigo          : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;
  wVerificacaoCodigo := wUtilPEDSCI.fVerificarCampoCodigo(edCODPROD.Text, wEdCodigo, False);

  if (wVerificacaoCodigo) and
     (dmDadosPEDSCI.tbProdutos.FindKey([StrToInt(Trim(edCODPROD.Text))])) then
     begin
       pDefinirStatus(2);
       if prExecucaoOpcional then
         begin
           edDESCPROD.Text := dmDadosPEDSCI.tbProdutos.FieldByName('BDDESCRICAO').AsString;
           edNCMPROD.Text  := dmDadosPEDSCI.tbProdutos.FieldByName('BDNCM').AsString;
           edValor.Text    := dmDadosPEDSCI.tbProdutos.FieldByName('BDVALOR').AsString;           
         end;
       exit;
     end
  else if (wVerificacaoCodigo) and
          (not dmDadosPEDSCI.tbProdutos.FindKey([wEdCodigo])) then
     begin
       pDefinirStatus(1);
       exit;
     end
  else if (edCODPROD.Text = EmptyStr) then
     begin
       pDefinirStatus(1);
       if prExecucaoOpcional then
          begin
            SQLQueryMaiorCodigo.Close;
            SQLQueryMaiorCodigo.SQL.Clear;
            SQLQueryMaiorCodigo.SQL.Add(
              'SELECT MAX(PROD.BDCODPROD) MAIORCODIGO' + #13 +
              'FROM TCADPRODUTO PROD'
            );
            SQLQueryMaiorCodigo.Open;
            edCODPROD.Text := IntToStr(SQLQueryMaiorCodigo.FieldByName('MAIORCODIGO').AsInteger + 1);
          end;
       exit;
     end;

  pDefinirStatus(0);
end;

function TfrCadProdutos.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbProdutos;
end;

end.
