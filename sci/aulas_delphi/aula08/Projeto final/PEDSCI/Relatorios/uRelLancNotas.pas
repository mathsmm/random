unit uRelLancNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoRelatorioPEDSCI, Data.FMTBcd,
  Data.DB, Data.SqlExpr, frxClass, frxDBSet, frxExportCSV, frxExportDOCX,
  frxExportXLSX, frxExportBaseDialog, frxExportPDF, frxDesgn, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.WinXPickers;

type
  TfrRelLancNotas = class(TfrFormPadraoRelatorioPEDSCI)
    lbDATAINICIAL: TLabel;
    lbCODNOTAINICIAL: TLabel;
    lbEMP: TLabel;
    lbCLI: TLabel;
    edNOMEEMPNOTA: TEdit;
    edNOMECLINOTA: TEdit;
    edCODCLINOTA: TEdit;
    edCODEMPNOTA: TEdit;
    btCODCLINOTA: TButton;
    btCODEMPNOTA: TButton;
    edDataInicial: TDatePicker;
    lbDATAFINAL: TLabel;
    edDataFinal: TDatePicker;
    edNotaInicial: TEdit;
    lbCODNOTAFINAL: TLabel;
    edNotaFinal: TEdit;
    imBotoesDiversos: TImageList;
    procedure btVisualizarClick(Sender: TObject);
    procedure btCODCLINOTAClick(Sender: TObject);
    procedure btCODEMPNOTAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRelLancNotas: TfrRelLancNotas;

implementation

uses
  uSelecionaClienteRelLancNotas, uSelecionaEmpresaRelLancNotas;

{$R *.dfm}

procedure TfrRelLancNotas.btCODCLINOTAClick(Sender: TObject);
begin
  inherited;
  TfrSelecionaClienteParaRelLancNotas.Create(Self);
end;

procedure TfrRelLancNotas.btCODEMPNOTAClick(Sender: TObject);
begin
  inherited;
  TfrSelecionaEmpresaParaRelLancNotas.Create(Self);
end;

procedure TfrRelLancNotas.btVisualizarClick(Sender: TObject);
var
  wSQLScriptPrimeiraParte : String;
  wSQLScriptSegundaParte : String;
begin
  inherited;
  wSQLScriptPrimeiraParte :=
    'SELECT NOTA.BDCODNOTA     CODNOTA,'      + #13 +
    '       NOTA.BDCODCLI      CODCLI,'       + #13 +
    '       NOTA.BDCODEMP      CODEMP,'       + #13 +
    '       NOTA.BDDATAEMISSAO DATAEMISSAO,'  + #13 +
    '       NOTA.BDVLRNOTA     VLRNOTA,'      + #13 +
    '       ITENS.BDCODPROD    CODPROD,'      + #13 +
    '       PROD.BDDESCRICAO   DESCPROD,'     + #13 +
    '       ITENS.BDQTD        QTD,'          + #13 +
    '       ITENS.BDVALORUNI   VLRUNIT,'      + #13 +
    '       ITENS.BDVALORTOTAL VLRTOTALPROD,' + #13 +
    '       ITENS.BDBCICMS     BASEICMS,'     + #13 +
    '       ITENS.BDALIQICMS   ALIQUOTAICMS,' + #13 +
    '       ITENS.BDVLRICMS    VLRICMS,'      + #13 +
    '       CLI.BDCNPJCPF      CPFCNPJCLI,'   + #13 +
    '       CLI.BDNOMECLI      NOMECLI,'      + #13 +
    '       CLI.BDTELEFONE     TELEFONECLI,'  + #13 +
    '       UFCLI.BDSIGLAUF    UFCLI,'        + #13 +
    '       EMP.BDCNPJCPF      CPFCNPJEMP,'   + #13 +
    '       EMP.BDNOMEEMP      NOMEEMP,'      + #13 +
    '       EMP.BDTELEFONE     TELEFONEEMP,'  + #13 +
    '       UFEMP.BDSIGLAUF    UFEMP'         + #13 +
    '       FROM ('                           + #13 +
    '             SELECT *'                   + #13 +
    '             FROM TLANCNOTA NOTA'        + #13;
                //WHERE --> É adicionado depois

  wSQLScriptSegundaParte :=
    '            ) NOTA'                                                + #13 +
    'INNER JOIN TCLIENTE CLI ON (NOTA.BDCODCLI = CLI.BDCODIGO)'         + #13 +
    'INNER JOIN TUF UFCLI ON (CLI.BDCODUF = UFCLI.BDCODUF)'             + #13 +
    'INNER JOIN TEMPRESA EMP ON (NOTA.BDCODEMP = EMP.BDCODEMP)'         + #13 +
    'INNER JOIN TUF UFEMP ON (EMP.BDCODUF = UFEMP.BDCODUF)'             + #13 +
    'INNER JOIN TITENSNOTA ITENS ON (NOTA.BDCODNOTA = ITENS.BDCODNOTA)' + #13 +
    'INNER JOIN TCADPRODUTO PROD ON (ITENS.BDCODPROD = PROD.BDCODPROD)' + #13 +
    'ORDER BY NOTA.BDCODNOTA';

  SQLQueryPadrao.Close;
  SQLQueryPadrao.SQL.Clear;

  //Adição da primeira parte do script
  SQLQueryPadrao.SQL.Add(wSQLScriptPrimeiraParte);

  //Adição do filtro
  SQLQueryPadrao.SQL.Add(
    'WHERE ' +
    'NOTA.BDDATAEMISSAO >= ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy', edDataInicial.Date)) +
    ' AND NOTA.BDDATAEMISSAO <= ' +
    QuotedStr(FormatDateTime('dd.mm.yyyy', edDataFinal.Date))
  );

  if Trim(edCODEMPNOTA.Text) <> EmptyStr then
       SQLQueryPadrao.SQL.Add(' AND NOTA.BDCODEMP = ' + edCODEMPNOTA.Text);

  if Trim(edCODCLINOTA.Text) <> EmptyStr then
       SQLQueryPadrao.SQL.Add(' AND NOTA.BDCODCLI = ' + edCODCLINOTA.Text);

  if Trim(edNotaInicial.Text) <> EmptyStr then
       SQLQueryPadrao.SQL.Add(' AND NOTA.BDCODNOTA >= ' + edNotaInicial.Text);

  if Trim(edNotaFinal.Text) <> EmptyStr then
       SQLQueryPadrao.SQL.Add(' AND NOTA.BDCODNOTA <= ' + edNotaFinal.Text);

  //Adição da segunda parte do script
  SQLQueryPadrao.SQL.Add(wSQLScriptSegundaParte);

  SQLQueryPadrao.Open;
end;

end.
