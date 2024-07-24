unit uSelecionaProdutoParaItensNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient;

type
  TfrSelecionaProdutoItensNotas = class(TfrFormPadraoConsultaPEDSCI)
    procedure grConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frSelecionaProdutoItensNotas: TfrSelecionaProdutoItensNotas;

implementation

uses
  udmDadosPEDSCI, uCadLancNotas, uCadItensNotas;

{$R *.dfm}

{ TfrSelecionaProduto }

procedure TfrSelecionaProdutoItensNotas.grConsultaDblClick(Sender: TObject);
begin
  inherited;
  TfrCadItensNotas(Owner).edCODPROD.Text  := grConsulta.DataSource.DataSet.FieldByName('BDCODPROD').AsString;
  TfrCadItensNotas(Owner).edDESCPROD.Text := grConsulta.DataSource.DataSet.FieldByName('BDDESCRICAO').AsString;
  Close;
end;

function TfrSelecionaProdutoItensNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbProdutos;
end;

end.
