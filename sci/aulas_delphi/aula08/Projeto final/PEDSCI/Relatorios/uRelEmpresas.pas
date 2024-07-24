unit uRelEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoRelatorioPEDSCI, Data.FMTBcd,
  Data.DB, Data.SqlExpr, frxClass, frxDBSet, frxExportCSV, frxExportDOCX,
  frxExportXLSX, frxExportBaseDialog, frxExportPDF, frxDesgn, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls;

type
  TfrRelEmpresas = class(TfrFormPadraoRelatorioPEDSCI)
    lbOBS1: TLabel;
    procedure btVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRelEmpresas: TfrRelEmpresas;

implementation

{$R *.dfm}

procedure TfrRelEmpresas.btVisualizarClick(Sender: TObject);
begin
  inherited;
  SQLQueryPadrao.Close;
  SQLQueryPadrao.SQL.Clear;
  SQLQueryPadrao.SQL.Add('SELECT * FROM TEMPRESA EMP');
  SQLQueryPadrao.SQL.Add('INNER JOIN TUF UF ON (EMP.BDCODUF = UF.BDCODUF)');
  SQLQueryPadrao.SQL.Add('ORDER BY EMP.BDCODUF');
  SQLQueryPadrao.Open;
end;

end.
