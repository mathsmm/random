unit uConsProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrConsProdutos = class(TfrFormPadraoConsultaPEDSCI)
    cbFiltro: TComboBox;
    edFiltro: TEdit;
    ToolButton2: TToolButton;
    btResetarFiltro: TButton;
    btExportar: TToolButton;
    ToolButton5: TToolButton;
    procedure cbFiltroSelect(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure grConsultaDblClick(Sender: TObject);
    procedure btResetarFiltroClick(Sender: TObject);
    procedure grConsultaTitleClick(Column: TColumn);
    procedure edFiltroChange(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function fDiretorioExportacao : String;
    function fRetornarInformacoesRegistroAtual : String;
    procedure pExportar;
    procedure pFiltrar;
  end;

var
  frConsProdutos: TfrConsProdutos;

implementation

uses
  udmDadosPEDSCI, System.Generics.Collections, uCadProdutos;

{$R *.dfm}

{ TfrConsProdutos }

procedure TfrConsProdutos.btFiltrarClick(Sender: TObject);
begin
  inherited;
  if cbFiltro.Visible then
     begin
       cbFiltro.Visible        := False;
       edFiltro.Visible        := False;
       btResetarFiltro.Visible := False;
     end
  else
     begin
       cbFiltro.Visible        := True;
       edFiltro.Visible        := True;
       btResetarFiltro.Visible := True;
     end;

  dmDadosPEDSCI.tbProdutos.Filtered := False;
end;

procedure TfrConsProdutos.btResetarFiltroClick(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbProdutos.Filtered := False;
end;

procedure TfrConsProdutos.cbFiltroSelect(Sender: TObject);
begin
  inherited;
  edFiltro.Text := '';
end;

procedure TfrConsProdutos.edFiltroChange(Sender: TObject);
begin
  inherited;
  pFiltrar;
end;

function TfrConsProdutos.fDiretorioExportacao: String;
begin
  Result := 'C:\Users\prog27\Desktop\sci\aulas_delphi\aula08\Projeto final\PEDSCIForms\Exportacoes\Produtos'
end;

function TfrConsProdutos.fRetornarInformacoesRegistroAtual: String;
begin
  Result := 'C�digo: '    + dmDadosPEDSCI.tbProdutos.FieldByName('BDCODPROD').AsString   + ' | ' +
            'Descri��o: ' + dmDadosPEDSCI.tbProdutos.FieldByName('BDDESCRICAO').AsString + ' | ' +
            'NCM: '       + dmDadosPEDSCI.tbProdutos.FieldByName('BDNCM').AsString;
end;

procedure TfrConsProdutos.grConsultaDblClick(Sender: TObject);
begin
  inherited;

  if not(Owner is TfrCadProdutos) then
     exit;

  TfrCadProdutos(Owner).edCODPROD.Text  := dmDadosPEDSCI.tbProdutos.FieldByName('BDCODPROD').AsString;
  TfrCadProdutos(Owner).edDESCPROD.Text := dmDadosPEDSCI.tbProdutos.FieldByName('BDDESCRICAO').AsString;
  TfrCadProdutos(Owner).edNCMPROD.Text  := dmDadosPEDSCI.tbProdutos.FieldByName('BDNCM').AsString;
  Close;
end;

procedure TfrConsProdutos.grConsultaTitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'BDCODPROD' then
     dmDadosPEDSCI.tbProdutos.IndexFieldNames := 'BDCODPROD'
  else if Column.FieldName = 'BDDESCRICAO' then
     dmDadosPEDSCI.tbProdutos.IndexFieldNames := 'BDDESCRICAO';
end;

procedure TfrConsProdutos.pExportar;
var
  wStringList : TStringList;
begin
  wStringList := TStringList.Create;

  dmDadosPEDSCI.tbProdutos.First;
  while not dmDadosPEDSCI.tbProdutos.Eof do
    begin
      wStringList.Add(fRetornarInformacoesRegistroAtual);

      dmDadosPEDSCI.tbProdutos.Next;
    end;

  if not DirectoryExists(fDiretorioExportacao) then
     ForceDirectories(fDiretorioExportacao);

  wStringList.SaveToFile(fDiretorioExportacao + '\CadastrosProdutos.txt');
  wStringList.Clear;
end;

procedure TfrConsProdutos.pFiltrar;
var
  wDictCampos : TDictionary<Integer, String>;
  wCampoFiltro : String;
begin
  if (edFiltro.Text = '') or (cbFiltro.ItemIndex = -1) then
     begin
       dmDadosPEDSCI.tbProdutos.Filtered := False;
       exit;
     end;

  wDictCampos := TDictionary<Integer, String>.Create;
  wDictCampos.Add(0, 'BDCODPROD');
  wDictCampos.Add(1, 'BDDESCRICAO');

  wCampoFiltro := wDictCampos[cbFiltro.ItemIndex];

  if wCampoFiltro = 'BDCODPROD' then
     begin
       dmDadosPEDSCI.tbProdutos.Filter   := wCampoFiltro + ' = ' + edFiltro.Text;
       dmDadosPEDSCI.tbProdutos.Filtered := True;
     end
  else
     begin
       dmDadosPEDSCI.tbProdutos.FilterOptions := [foCaseInsensitive];
       dmDadosPEDSCI.tbProdutos.Filter   := wCampoFiltro + ' LIKE ' + QuotedStr('%' + edFiltro.Text + '%');
       dmDadosPEDSCI.tbProdutos.Filtered := True;
     end;
end;

function TfrConsProdutos.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbProdutos;
end;

procedure TfrConsProdutos.btExportarClick(Sender: TObject);
begin
  inherited;
  pExportar;
end;

end.
