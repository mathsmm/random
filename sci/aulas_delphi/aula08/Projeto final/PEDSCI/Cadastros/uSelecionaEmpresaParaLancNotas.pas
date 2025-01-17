unit uSelecionaEmpresaParaLancNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient;

type
  TfrSelecionaEmpresa = class(TfrFormPadraoConsultaPEDSCI)
    procedure grConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frSelecionaEmpresa: TfrSelecionaEmpresa;

implementation

uses
  udmDadosPEDSCI, uCadLancNotas;

{$R *.dfm}

{ TfrSelecionaEmpresa }

procedure TfrSelecionaEmpresa.grConsultaDblClick(Sender: TObject);
begin
  inherited;
  TfrCadLancNotas(Owner).edCODEMPNOTA.Text  := grConsulta.DataSource.DataSet.FieldByName('BDCODEMP').AsString;
  TfrCadLancNotas(Owner).edNOMEEMPNOTA.Text := grConsulta.DataSource.DataSet.FieldByName('BDNOMEEMP').AsString;
  Close;
end;

function TfrSelecionaEmpresa.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbEmpresas;
end;

end.
