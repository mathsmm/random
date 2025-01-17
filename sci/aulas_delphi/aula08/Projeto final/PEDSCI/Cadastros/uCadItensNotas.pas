unit uCadItensNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoCadastroPEDSCI,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.WinXPickers, Datasnap.DBClient, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrCadItensNotas = class(TfrFormPadraoCadastroPEDSCI)
    lbCOD: TLabel;
    lbCODEMP: TLabel;
    lbCODNOTA: TLabel;
    lbCODPROD: TLabel;
    lbQTD: TLabel;
    lbVLRUNIT: TLabel;
    lbBaseICMS: TLabel;
    lbAliquotaICMS: TLabel;
    lbValorICMS: TLabel;
    edCOD: TEdit;
    edNOMEEMP: TEdit;
    edDESCPROD: TEdit;
    edQTD: TEdit;
    edVLRUNIT: TEdit;
    edCODNOTA: TEdit;
    edCODEMP: TEdit;
    edCODPROD: TEdit;
    btCODNOTA: TButton;
    btCODEMP: TButton;
    btCODPROD: TButton;
    edBaseICMS: TEdit;
    edAliquotaICMS: TEdit;
    edValorICMS: TEdit;
    lbVLRTOTAL: TLabel;
    edVLRTOTAL: TEdit;
    imBotoesDiversos: TImageList;
    lbOBS1: TLabel;
    lbOBS2: TLabel;
    lbOBS3: TLabel;
    SQLQuerySomaValorTotal: TSQLQuery;
    procedure btCODNOTAClick(Sender: TObject);
    procedure btCODEMPClick(Sender: TObject);
    procedure btCODPRODClick(Sender: TObject);
    procedure edVLRUNITChange(Sender: TObject);
    procedure edQTDChange(Sender: TObject);
    procedure edBaseICMSChange(Sender: TObject);
    procedure edAliquotaICMSChange(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure edCODExit(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edCODNOTAExit(Sender: TObject);
    procedure edCODEMPExit(Sender: TObject);
  private
    { Private declarations }
    procedure pCalcularValorTotal;
    procedure pCalcularBaseICMS;
    procedure pCalcularValorICMS;
    procedure pVerificarExistenciaRegistro;
//    procedure pAtualizarValorDeLancNotas;
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frCadItensNotas: TfrCadItensNotas;

implementation

uses
  uSelecionaNotaParaItensNotas, uSelecionaEmpresaParaItensNotas,
  uSelecionaProdutoParaItensNotas, udmDadosPEDSCI, uConsItensNotas,
  uUtilPEDSCI, uCadLancNotas;

{$R *.dfm}

procedure TfrCadItensNotas.btCODEMPClick(Sender: TObject);
begin
  inherited;
  TfrSelecionaEmpresaItensNotas.Create(Self);
end;

procedure TfrCadItensNotas.btCODNOTAClick(Sender: TObject);
begin
  inherited;
  TfrSelecionaNotaItensNotas.Create(Self);
end;

procedure TfrCadItensNotas.btCODPRODClick(Sender: TObject);
begin
  inherited;
  TfrSelecionaProdutoItensNotas.Create(Self);
end;

procedure TfrCadItensNotas.btConsultarClick(Sender: TObject);
begin
  inherited;
  TfrConsItensNotas.Create(Self);
end;

procedure TfrCadItensNotas.btExcluirClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if (wUtilPEDSCI.fVerificarCampoCodigo(edCOD.Text, wEdCodigo, True)) and
     (dmDadosPEDSCI.tbItensNotas.FindKey([wEdCodigo])) then
     dmDadosPEDSCI.tbItensNotas.Delete;
end;

procedure TfrCadItensNotas.btOkClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
  wEdCodNota : Integer;
  wEdCodEmp : Integer;

  wIntAuxiliar : Integer;
  wCurrAuxiliar : Currency;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if not (wUtilPEDSCI.fVerificarCampoCodigo(edCOD.Text,     wEdCodigo, False)) or
     not (wUtilPEDSCI.fVerificarCampoCodigo(edCODNOTA.Text, wEdCodNota, False)) or
     not (wUtilPEDSCI.fVerificarCampoCodigo(edCODEMP.Text,  wEdCodEmp, False)) then
     exit;

  if (not TryStrToInt (edCODNOTA.Text,      wIntAuxiliar )) or
     (not TryStrToInt (edCODEMP.Text,       wIntAuxiliar )) or
     (not TryStrToInt (edCODPROD.Text,      wIntAuxiliar )) or
     (not TryStrToCurr(edQTD.Text,          wCurrAuxiliar)) or
     (not TryStrToCurr(edVLRUNIT.Text,      wCurrAuxiliar)) or
     (not TryStrToCurr(edAliquotaICMS.Text, wCurrAuxiliar)) then
     begin
       ShowMessage('Ainda h� campos incorretos ou incompletos.');
       exit;
     end;

  dmDadosPEDSCI.tbItensNotas.IndexFieldNames := 'BDCODIGO;BDCODEMP;BDCODNOTA';

  if (dmDadosPEDSCI.tbItensNotas.FindKey([wEdCodigo, wEdCodNota, wEdCodEmp])) then
     dmDadosPEDSCI.tbItensNotas.Edit
  else
     dmDadosPEDSCI.tbItensNotas.Append;

  dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODIGO').AsInteger      := wEdCodigo;
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODNOTA').AsInteger     := wEdCodNota;
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODEMP').AsInteger      := wEdCodEmp;
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODPROD').AsInteger     := StrToInt(Trim(edCODPROD.Text));
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORUNI').AsCurrency   := StrToCurr(Trim(edVLRUNIT.Text));
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDQTD').AsCurrency        := StrToCurr(Trim(edQTD.Text));
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORTOTAL').AsCurrency := StrToCurr(Trim(edVLRTOTAL.Text));
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDBCICMS').AsCurrency     := StrToCurr(Trim(edBaseICMS.Text));
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDALIQICMS').AsCurrency   := StrToCurr(Trim(edAliquotaICMS.Text));
  dmDadosPEDSCI.tbItensNotas.FieldByName('BDVLRICMS').AsCurrency    := StrToCurr(Trim(edValorICMS.Text));

  dmDadosPEDSCI.tbItensNotas.Post;

//  pAtualizarValorDeLancNotas;

  edCOD.SetFocus;

  //Atualiza o edit de VALOR de LancNotas
  dmDadosPEDSCI.tbLancNotas.Refresh;

  if not(Owner is TfrCadLancNotas) then
     exit;

  TfrCadLancNotas(Owner).edVLRNOTA.Text := dmDadosPEDSCI.tbLancNotas.FieldByName('BDVLRNOTA').AsString;
end;

procedure TfrCadItensNotas.edAliquotaICMSChange(Sender: TObject);
begin
  inherited;
  pCalcularValorICMS;
end;

procedure TfrCadItensNotas.edBaseICMSChange(Sender: TObject);
begin
  inherited;
  pCalcularValorICMS;
end;

procedure TfrCadItensNotas.edCODEMPExit(Sender: TObject);
begin
  inherited;
  pVerificarExistenciaRegistro;
end;

procedure TfrCadItensNotas.edCODExit(Sender: TObject);
begin
  inherited;
  pVerificarExistenciaRegistro;
end;

procedure TfrCadItensNotas.edQTDChange(Sender: TObject);
begin
  inherited;
  pCalcularValorTotal;
  pCalcularBaseICMS;
end;

procedure TfrCadItensNotas.edVLRUNITChange(Sender: TObject);
begin
  inherited;
  pCalcularValorTotal;
  pCalcularBaseICMS;
end;

//procedure TfrCadItensNotas.pAtualizarValorDeLancNotas;
//var
//  wSQLScript : String;
//begin
//  wSQLScript :=
//    'SELECT SUM(BDVALORTOTAL) VALORNOTA' + #13 +
//    'FROM TITENSNOTA' + #13 +
//    'WHERE BDCODNOTA = ' + edCODNOTA.Text;
//
//  SQLQuerySomaValorTotal.Close;
//  SQLQuerySomaValorTotal.SQL.Clear;
//  SQLQuerySomaValorTotal.SQL.Add(wSQLScript);
//  SQLQuerySomaValorTotal.Open;
//
//  dmDadosPEDSCI.tbLancNotas.IndexFieldNames := 'BDCODNOTA;BDCODEMP';
//  dmDadosPEDSCI.tbLancNotas.FindKey([StrToInt(edCODNOTA.Text), StrToInt(edCODEMP.Text)]);
//  dmDadosPEDSCI.tbLancNotas.Edit;
//
//  dmDadosPEDSCI.tbLancNotas.FieldByName('BDVLRNOTA').AsCurrency :=
//    SQLQuerySomaValorTotal.FieldByName('VALORNOTA').AsCurrency;
//end;

procedure TfrCadItensNotas.pCalcularBaseICMS;
begin
  edBaseICMS.Text := edVLRTOTAL.Text;
end;

procedure TfrCadItensNotas.pCalcularValorICMS;
var
  wCurrAuxBase : Currency;
  wCurrAuxAliq : Currency;
begin
  if TryStrToCurr(edBaseICMS.Text,     wCurrAuxBase) and
     TryStrToCurr(edAliquotaICMS.Text, wCurrAuxAliq) then
     begin
       edValorICMS.Text := CurrToStr(wCurrAuxBase * (wCurrAuxAliq / 100));
       exit;
     end;

  edValorICMS.Text := '';
end;

procedure TfrCadItensNotas.pCalcularValorTotal;
var
  wCurrAuxUnit : Currency;
  wCurrAuxQtd : Currency;
begin
  if TryStrToCurr(edVLRUNIT.Text, wCurrAuxUnit) and
     TryStrToCurr(edQTD.Text,     wCurrAuxQtd) then
     begin
       edVLRTOTAL.Text := CurrToStr(wCurrAuxUnit * wCurrAuxQtd);
       exit;
     end;

  edVLRTOTAL.Text := '';
end;

procedure TfrCadItensNotas.pVerificarExistenciaRegistro;
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
  wEdCodNota : Integer;
  wEdCodEmp: Integer;
begin
  inherited;

  if not (wUtilPEDSCI.fVerificarCampoCodigo(edCOD.Text,     wEdCodigo, False)) or
     not (wUtilPEDSCI.fVerificarCampoCodigo(edCODNOTA.Text, wEdCodNota, False)) or
     not (wUtilPEDSCI.fVerificarCampoCodigo(edCODEMP.Text,  wEdCodEmp, False)) then
     exit;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  dmDadosPEDSCI.tbItensNotas.IndexFieldNames := 'BDCODIGO;BDCODEMP;BDCODNOTA';

  if (dmDadosPEDSCI.tbItensNotas.FindKey([wEdCodigo, wEdCodNota, wEdCodEmp])) then
     begin
       edCODNOTA.Text      := dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODNOTA').AsString;
       edCODEMP.Text       := dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODEMP').AsString;
       edCODPROD.Text      := dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODPROD').AsString;
       edVLRUNIT.Text      := dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORUNI').AsString;
       edQTD.Text          := dmDadosPEDSCI.tbItensNotas.FieldByName('BDQTD').AsString;
       edVLRTOTAL.Text     := dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORTOTAL').AsString;
       edBaseICMS.Text     := dmDadosPEDSCI.tbItensNotas.FieldByName('BDBCICMS').AsString;
       edAliquotaICMS.Text := dmDadosPEDSCI.tbItensNotas.FieldByName('BDALIQICMS').AsString;
       edValorICMS.Text    := dmDadosPEDSCI.tbItensNotas.FieldByName('BDVLRICMS').AsString;
     end
end;

function TfrCadItensNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbItensNotas;
end;

procedure TfrCadItensNotas.edCODNOTAExit(Sender: TObject);
begin
  inherited;
  pVerificarExistenciaRegistro;
end;

end.
