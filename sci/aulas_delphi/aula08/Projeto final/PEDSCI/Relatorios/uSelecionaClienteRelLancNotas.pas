unit uSelecionaClienteRelLancNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient;

type
  TfrSelecionaClienteParaRelLancNotas = class(TfrFormPadraoConsultaPEDSCI)
    procedure grConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frSelecionaClienteParaRelLancNotas: TfrSelecionaClienteParaRelLancNotas;

implementation

uses
  udmDadosPEDSCI, uRelLancNotas;

{$R *.dfm}

{ TfrSelecionaClienteParaRelLancNotas }

procedure TfrSelecionaClienteParaRelLancNotas.grConsultaDblClick(
  Sender: TObject);
begin
  inherited;
  TfrRelLancNotas(Owner).edCODCLINOTA.Text  := grConsulta.DataSource.DataSet.FieldByName('BDCODIGO').AsString;
  TfrRelLancNotas(Owner).edNOMECLINOTA.Text := grConsulta.DataSource.DataSet.FieldByName('BDNOMECLI').AsString;
  Close;
end;

function TfrSelecionaClienteParaRelLancNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbClientes;
end;

end.
