unit uSelecionaEmpresaRelLancNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient;

type
  TfrSelecionaEmpresaParaRelLancNotas = class(TfrFormPadraoConsultaPEDSCI)
    procedure grConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frSelecionaEmpresaParaRelLancNotas: TfrSelecionaEmpresaParaRelLancNotas;

implementation

uses
  uRelLancNotas, udmDadosPEDSCI;

{$R *.dfm}

procedure TfrSelecionaEmpresaParaRelLancNotas.grConsultaDblClick(
  Sender: TObject);
begin
  inherited;
  TfrRelLancNotas(Owner).edCODEMPNOTA.Text  := grConsulta.DataSource.DataSet.FieldByName('BDCODEMP').AsString;
  TfrRelLancNotas(Owner).edNOMEEMPNOTA.Text := grConsulta.DataSource.DataSet.FieldByName('BDNOMEEMP').AsString;
  Close;
end;

function TfrSelecionaEmpresaParaRelLancNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbEmpresas;
end;

end.
