unit uCadLancNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoCadastroPEDSCI,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Datasnap.DBClient,
  Vcl.WinXPickers, Vcl.StdCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrCadLancNotas = class(TfrFormPadraoCadastroPEDSCI)
    lbCODNOTA: TLabel;
    lbCODEMPNOTA: TLabel;
    lbCODCLINOTA: TLabel;
    edCODNOTA: TEdit;
    edNOMEEMPNOTA: TEdit;
    edNOMECLINOTA: TEdit;
    lbDATAEMISSAONOTA: TLabel;
    edDATAEMISSAONOTA: TDatePicker;
    lbVLRNOTA: TLabel;
    edVLRNOTA: TEdit;
    edCODCLINOTA: TEdit;
    edCODEMPNOTA: TEdit;
    btCODCLINOTA: TButton;
    btCODEMPNOTA: TButton;
    imBotoesDiversos: TImageList;
    SQLQueryMaiorCodigo: TSQLQuery;
    procedure btConsultarClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edCODNOTAExit(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCODCLINOTAClick(Sender: TObject);
    procedure btCODEMPNOTAClick(Sender: TObject);
    procedure edCODEMPNOTAExit(Sender: TObject);
  private
    { Private declarations }
    procedure pVerificarExistenciaRegistro;
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frCadLancNotas: TfrCadLancNotas;

implementation

uses
  udmDadosPEDSCI, uConsLancNotas, uConsClientes,
  uSelecionaClienteParaLancNotas, uSelecionaEmpresaParaLancNotas,
  uUtilPEDSCI, uCadItensNotas;

{$R *.dfm}

{ TfrCadLancNotas }

procedure TfrCadLancNotas.btCODCLINOTAClick(Sender: TObject);
begin
  inherited;
  TfrSelecionaCliente.Create(Self);
end;

procedure TfrCadLancNotas.btCODEMPNOTAClick(Sender: TObject);
begin
  inherited;
  TfrSelecionaEmpresa.Create(Self);
end;

procedure TfrCadLancNotas.btConsultarClick(Sender: TObject);
begin
  inherited;
  TfrConsLancNotas.Create(Self);
end;

procedure TfrCadLancNotas.btExcluirClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if (wUtilPEDSCI.fVerificarCampoCodigo(edCODNOTA.Text, wEdCodigo, True)) and
     (dmDadosPEDSCI.tbLancNotas.FindKey([wEdCodigo])) then
     dmDadosPEDSCI.tbLancNotas.Delete;
end;

procedure TfrCadLancNotas.btOkClick(Sender: TObject);
var
  wUtilPEDSCI    : TUtilPEDSCI;
  wEdCodigo      : Integer;
  wIntAuxiliar   : Integer;
  wCurrAuxiliar  : Currency;
  wValorNota     : Currency;
  wCadItensNotas : TfrCadItensNotas;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if not (wUtilPEDSCI.fVerificarCampoCodigo(edCODNOTA.Text, wEdCodigo, True)) then
     exit;

  if (not TryStrToInt (edCODCLINOTA.Text,   wIntAuxiliar )) or
     (not TryStrToInt (edCODEMPNOTA.Text,   wIntAuxiliar )) then
     begin
       ShowMessage('Ainda há campos incorretos ou incompletos.');
       exit;
     end;

  if (dmDadosPEDSCI.tbLancNotas.FindKey([wEdCodigo])) then
     dmDadosPEDSCI.tbLancNotas.Edit
  else
     dmDadosPEDSCI.tbLancNotas.Append;

  if edVLRNOTA.Text = '' then
     wValorNota := 0
  else
     wValorNota := StrToCurr(Trim(edVLRNOTA.Text));

  dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODNOTA').AsInteger      := wEdCodigo;
  dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODCLI').AsInteger       := StrToInt(Trim(edCODCLINOTA.Text));
  dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODEMP').AsInteger       := StrToInt(Trim(edCODEMPNOTA.Text));
  dmDadosPEDSCI.tbLancNotas.FieldByName('BDDATAEMISSAO').AsDateTime := edDATAEMISSAONOTA.Date;
  dmDadosPEDSCI.tbLancNotas.FieldByName('BDVLRNOTA').AsCurrency     := wValorNota;
  dmDadosPEDSCI.tbLancNotas.Post;

  edCODNOTA.SetFocus;

  //Abre tela de relação itens-notas
  wCadItensNotas := TfrCadItensNotas.Create(Self);
  wCadItensNotas.edCODNOTA.Text  := Self.edCODNOTA.Text;
  wCadItensNotas.edCODEMP.Text   := Self.edCODEMPNOTA.Text;
  wCadItensNotas.edNOMEEMP.Text  := Self.edNOMEEMPNOTA.Text;
end;

procedure TfrCadLancNotas.edCODEMPNOTAExit(Sender: TObject);
begin
  inherited;
  pVerificarExistenciaRegistro;
end;

procedure TfrCadLancNotas.edCODNOTAExit(Sender: TObject);
begin
  inherited;
  pVerificarExistenciaRegistro;
//  else
//     setLimpaCampos;
end;

procedure TfrCadLancNotas.pVerificarExistenciaRegistro;
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo   : Integer;
  wEdCodEmp   : Integer;
begin
  inherited;

  if not (wUtilPEDSCI.fVerificarCampoCodigo(edCODNOTA.Text,    wEdCodigo, False)) or
     not (wUtilPEDSCI.fVerificarCampoCodigo(edCODEMPNOTA.Text, wEdCodEmp, False)) then
     begin
       edVLRNOTA.Text := '0';
       exit;
     end;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  dmDadosPEDSCI.tbLancNotas.IndexFieldNames := 'BDCODNOTA;BDCODEMP';

  if (dmDadosPEDSCI.tbLancNotas.FindKey([wEdCodigo, wEdCodEmp])) then
     begin
       edCODCLINOTA.Text      := dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODCLI').AsString;
       edCODEMPNOTA.Text      := dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODEMP').AsString;
       edDATAEMISSAONOTA.Date := dmDadosPEDSCI.tbLancNotas.FieldByName('BDDATAEMISSAO').AsDateTime;
       edVLRNOTA.Text         := dmDadosPEDSCI.tbLancNotas.FieldByName('BDVLRNOTA').AsString;
     end
end;

function TfrCadLancNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbLancNotas;
end;

end.
