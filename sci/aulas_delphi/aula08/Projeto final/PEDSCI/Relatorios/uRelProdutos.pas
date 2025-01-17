unit uRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoRelatorioPEDSCI, Data.FMTBcd,
  Data.DB, Data.SqlExpr, frxClass, frxDBSet, frxExportCSV, frxExportDOCX,
  frxExportXLSX, frxExportBaseDialog, frxExportPDF, frxDesgn, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls;

type
  TfrRelProdutos = class(TfrFormPadraoRelatorioPEDSCI)
    lbOBS1: TLabel;
    procedure btVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRelProdutos: TfrRelProdutos;

implementation

{$R *.dfm}

procedure TfrRelProdutos.btVisualizarClick(Sender: TObject);
begin
  inherited;
  SQLQueryPadrao.Close;
  SQLQueryPadrao.SQL.Clear;
  SQLQueryPadrao.SQL.Add('SELECT * FROM TCADPRODUTO PROD');
  SQLQueryPadrao.SQL.Add('ORDER BY PROD.BDCODPROD');
  SQLQueryPadrao.Open;
end;

end.
