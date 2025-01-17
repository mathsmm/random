unit uConsClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrConsClientes = class(TfrFormPadraoConsultaPEDSCI)
    edFiltro: TEdit;
    cbFiltro: TComboBox;
    ToolButton2: TToolButton;
    btResetarFiltro: TButton;
    ToolButton4: TToolButton;
    btExportar: TToolButton;
    procedure btFiltrarClick(Sender: TObject);
    procedure cbFiltroSelect(Sender: TObject);
    procedure grConsultaDblClick(Sender: TObject);
    procedure btResetarFiltroClick(Sender: TObject);
    procedure grConsultaTitleClick(Column: TColumn);
    procedure edFiltroChange(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  frConsClientes: TfrConsClientes;

implementation

uses
  udmDadosPEDSCI, System.Generics.Collections, uCadClientes;

{$R *.dfm}

{ TfrConsClientes }

procedure TfrConsClientes.btExportarClick(Sender: TObject);
begin
  inherited;
  pExportar;
end;

procedure TfrConsClientes.btFiltrarClick(Sender: TObject);
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

  dmDadosPEDSCI.tbClientes.Filtered := False;
end;

procedure TfrConsClientes.btResetarFiltroClick(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbClientes.Filtered := False;
end;

procedure TfrConsClientes.cbFiltroSelect(Sender: TObject);
begin
  inherited;
  edFiltro.Text := '';
end;

procedure TfrConsClientes.edFiltroChange(Sender: TObject);
begin
  inherited;
  pFiltrar;
end;

function TfrConsClientes.fDiretorioExportacao: String;
begin
  Result := 'C:\Users\prog27\Desktop\sci\aulas_delphi\aula08\Projeto final\PEDSCIForms\Exportacoes\Clientes'
end;

procedure TfrConsClientes.FormCreate(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbClientes.Filtered := False;
end;

function TfrConsClientes.fRetornarInformacoesRegistroAtual: String;
begin
  Result := 'C�digo: '    + dmDadosPEDSCI.tbClientes.FieldByName('BDCODIGO').AsString  + ' | ' +
            'CPF/CNPJ: '  + dmDadosPEDSCI.tbClientes.FieldByName('BDCNPJCPF').AsString + ' | ' +
            'Nome: '      + dmDadosPEDSCI.tbClientes.FieldByName('BDNOMECLI').AsString + ' | ' +
            'C�digo UF: ' + dmDadosPEDSCI.tbClientes.FieldByName('BDCODUF').AsString   + ' | ' +
            'Telefone: '  + dmDadosPEDSCI.tbClientes.FieldByName('BDTELEFONE').AsString;
end;

procedure TfrConsClientes.grConsultaDblClick(Sender: TObject);
begin
  inherited;

  if not(Owner is TfrCadClientes) then
     exit;

  TfrCadClientes(Owner).edCODCLI.Text        := dmDadosPEDSCI.tbClientes.FieldByName('BDCODIGO').AsString;
  TfrCadClientes(Owner).edCNPJCPFCLI.Text    := dmDadosPEDSCI.tbClientes.FieldByName('BDCNPJCPF').AsString;
  TfrCadClientes(Owner).edNOMECLI.Text       := dmDadosPEDSCI.tbClientes.FieldByName('BDNOMECLI').AsString;
  TfrCadClientes(Owner).cbCODUFCLI.ItemIndex := dmDadosPEDSCI.tbClientes.FieldByName('BDCODUF').AsInteger - 1;
  TfrCadClientes(Owner).edTELEFONECLI.Text   := dmDadosPEDSCI.tbClientes.FieldByName('BDTELEFONE').AsString;

  Close;
end;

procedure TfrConsClientes.grConsultaTitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'BDCODIGO' then
     dmDadosPEDSCI.tbClientes.IndexFieldNames := 'BDCODIGO'
  else if Column.FieldName = 'BDNOMECLI' then
     dmDadosPEDSCI.tbClientes.IndexFieldNames := 'BDNOMECLI';
end;

procedure TfrConsClientes.pExportar;
var
  wStringList : TStringList;
begin
  wStringList := TStringList.Create;

  dmDadosPEDSCI.tbClientes.First;
  while not dmDadosPEDSCI.tbClientes.Eof do
    begin
      wStringList.Add(fRetornarInformacoesRegistroAtual);

      dmDadosPEDSCI.tbClientes.Next;
    end;

  if not DirectoryExists(fDiretorioExportacao) then
     ForceDirectories(fDiretorioExportacao);

  wStringList.SaveToFile(fDiretorioExportacao + '\CadastrosClientes.txt');
  wStringList.Clear;
end;

procedure TfrConsClientes.pFiltrar;
var
  wDictCampos : TDictionary<Integer, String>;
  wCampoFiltro : String;
begin
  if (edFiltro.Text = '') or (cbFiltro.ItemIndex = -1) then
     begin
       dmDadosPEDSCI.tbClientes.Filtered := False;
       exit;
     end;

  wDictCampos := TDictionary<Integer, String>.Create;
  wDictCampos.Add(0, 'BDCODIGO');
  wDictCampos.Add(1, 'BDNOMECLI');

  wCampoFiltro := wDictCampos[cbFiltro.ItemIndex];

  if wCampoFiltro = 'BDCODIGO' then
     begin
       dmDadosPEDSCI.tbClientes.Filter   := wCampoFiltro + ' = ' + edFiltro.Text;
       dmDadosPEDSCI.tbClientes.Filtered := True;
     end
  else
     begin
       dmDadosPEDSCI.tbClientes.FilterOptions := [foCaseInsensitive];
       dmDadosPEDSCI.tbClientes.Filter   := wCampoFiltro + ' LIKE ' + QuotedStr('%' + edFiltro.Text + '%');
       dmDadosPEDSCI.tbClientes.Filtered := True;
     end;
end;

function TfrConsClientes.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbClientes;
end;

end.
