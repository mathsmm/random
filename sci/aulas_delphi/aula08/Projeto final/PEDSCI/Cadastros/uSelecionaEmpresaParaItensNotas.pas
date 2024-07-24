unit uSelecionaEmpresaParaItensNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient;

type
  TfrSelecionaEmpresaItensNotas = class(TfrFormPadraoConsultaPEDSCI)
    procedure grConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frSelecionaEmpresaItensNotas: TfrSelecionaEmpresaItensNotas;

implementation

uses
  udmDadosPEDSCI, uCadItensNotas;

{$R *.dfm}

{ TfrSelecionaClienteItensNotas }

procedure TfrSelecionaEmpresaItensNotas.grConsultaDblClick(Sender: TObject);
begin
  inherited;
  TfrCadItensNotas(Owner).edCODEMP.Text  := grConsulta.DataSource.DataSet.FieldByName('BDCODEMP').AsString;
  TfrCadItensNotas(Owner).edNOMEEMP.Text := grConsulta.DataSource.DataSet.FieldByName('BDNOMEEMP').AsString;
  Close;
end;

function TfrSelecionaEmpresaItensNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbEmpresas;
end;

end.
