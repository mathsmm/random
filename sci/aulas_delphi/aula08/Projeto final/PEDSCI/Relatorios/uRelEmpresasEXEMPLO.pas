unit uRelEmpresasEXEMPLO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoRelatorioPEDSCI, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Data.FMTBcd, Data.DB, Data.SqlExpr, frxClass, frxDBSet, frxExportCSV, frxExportDOCX, frxExportXLSX, frxExportPDF, frxDesgn,
  frxExportBaseDialog;

type
  TfrRelEmpresasEXEMPLO = class(TfrFormPadraoRelatorioPEDSCI)
    procedure btVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRelEmpresasEXEMPLO: TfrRelEmpresasEXEMPLO;

implementation

{$R *.dfm}

procedure TfrRelEmpresasEXEMPLO.btVisualizarClick(Sender: TObject);
begin
  inherited;
  SQLQueryPadrao.Close;
  SQLQueryPadrao.SQL.Clear;
  SQLQueryPadrao.SQL.Add('select * from tempresas');
  SQLQueryPadrao.Open;
end;

end.
