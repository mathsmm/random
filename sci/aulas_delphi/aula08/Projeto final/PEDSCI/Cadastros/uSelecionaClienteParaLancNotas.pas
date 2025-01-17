unit uSelecionaClienteParaLancNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient, Vcl.ExtCtrls;

type
  TfrSelecionaCliente = class(TfrFormPadraoConsultaPEDSCI)
    procedure grConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frSelecionaCliente: TfrSelecionaCliente;

implementation

uses
  udmDadosPEDSCI, uCadLancNotas;

{$R *.dfm}

{ TfrSelecionaCLiente }

procedure TfrSelecionaCliente.grConsultaDblClick(Sender: TObject);
begin
  inherited;
  TfrCadLancNotas(Owner).edCODCLINOTA.Text  := grConsulta.DataSource.DataSet.FieldByName('BDCODIGO').AsString;
  TfrCadLancNotas(Owner).edNOMECLINOTA.Text := grConsulta.DataSource.DataSet.FieldByName('BDNOMECLI').AsString;
  Close;
end;

function TfrSelecionaCliente.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbClientes;
end;

end.

