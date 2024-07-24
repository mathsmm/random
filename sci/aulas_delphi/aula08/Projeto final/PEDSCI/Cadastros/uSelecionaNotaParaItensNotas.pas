unit uSelecionaNotaParaItensNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient;

type
  TfrSelecionaNotaItensNotas = class(TfrFormPadraoConsultaPEDSCI)
    procedure grConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frSelecionaNotaItensNotas: TfrSelecionaNotaItensNotas;

implementation

uses
  udmDadosPEDSCI, uCadItensNotas;

{$R *.dfm}

{ TfrSelecionaNotaItensNotas }

procedure TfrSelecionaNotaItensNotas.grConsultaDblClick(Sender: TObject);
begin
  inherited;
  TfrCadItensNotas(Owner).edCODNOTA.Text  := grConsulta.DataSource.DataSet.FieldByName('BDCODNOTA').AsString;
  Close;
end;

function TfrSelecionaNotaItensNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbLancNotas;
end;

end.
