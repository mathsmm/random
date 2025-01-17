unit uConsEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrConsEmpresas = class(TfrFormPadraoConsultaPEDSCI)
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
    procedure grConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  frConsEmpresas: TfrConsEmpresas;

implementation

uses
  udmDadosPEDSCI, System.Generics.Collections, uCadEmpresas;

{$R *.dfm}

{ TfrConsEmpresas }

procedure TfrConsEmpresas.btExportarClick(Sender: TObject);
begin
  inherited;
  pExportar;
end;

procedure TfrConsEmpresas.btFiltrarClick(Sender: TObject);
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

  dmDadosPEDSCI.tbEmpresas.Filtered := False;
end;

procedure TfrConsEmpresas.btResetarFiltroClick(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbEmpresas.Filtered := False;
end;

procedure TfrConsEmpresas.cbFiltroSelect(Sender: TObject);
begin
  inherited;
  edFiltro.Text := '';
end;

procedure TfrConsEmpresas.edFiltroChange(Sender: TObject);
begin
  inherited;
  pFiltrar;
end;

function TfrConsEmpresas.fDiretorioExportacao: String;
begin
  Result := 'C:\Users\prog27\Desktop\sci\aulas_delphi\aula08\Projeto final\PEDSCIForms\Exportacoes\Empresas'
end;

procedure TfrConsEmpresas.FormCreate(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbEmpresas.Filtered := False;
end;

function TfrConsEmpresas.fRetornarInformacoesRegistroAtual: String;
begin
  Result := 'C�digo: '    + dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODEMP').AsString  + ' | ' +
            'CPF/CNPJ: '  + dmDadosPEDSCI.tbEmpresas.FieldByName('BDCNPJCPF').AsString + ' | ' +
            'Nome: '      + dmDadosPEDSCI.tbEmpresas.FieldByName('BDNOMEEMP').AsString + ' | ' +
            'C�digo UF: ' + dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODUF').AsString   + ' | ' +
            'Telefone: '  + dmDadosPEDSCI.tbEmpresas.FieldByName('BDTELEFONE').AsString;
end;

procedure TfrConsEmpresas.grConsultaDblClick(Sender: TObject);
begin
  inherited;

  if not(Owner is TfrCadEmpresas) then
     exit;

  TfrCadEmpresas(Owner).edCODEMP.Text        := dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODEMP').AsString;
  TfrCadEmpresas(Owner).edCNPJCPFEMP.Text    := dmDadosPEDSCI.tbEmpresas.FieldByName('BDCNPJCPF').AsString;
  TfrCadEmpresas(Owner).edNOMEEMP.Text       := dmDadosPEDSCI.tbEmpresas.FieldByName('BDNOMEEMP').AsString;
  TfrCadEmpresas(Owner).cbCODUFEMP.ItemIndex := dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODUF').AsInteger - 1;
  TfrCadEmpresas(Owner).edTELEFONEEMP.Text   := dmDadosPEDSCI.tbEmpresas.FieldByName('BDTELEFONE').AsString;

  Close;
end;

procedure TfrConsEmpresas.grConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // Filtrar ao pressionar uma tecla
  // DBGrid1.SelectedIndex; //column
end;

procedure TfrConsEmpresas.grConsultaTitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'BDCODEMP' then
     dmDadosPEDSCI.tbEmpresas.IndexFieldNames := 'BDCODEMP'
  else if Column.FieldName = 'BDNOMEEMP' then
     dmDadosPEDSCI.tbEmpresas.IndexFieldNames := 'BDNOMEEMP';
end;

procedure TfrConsEmpresas.pExportar;
var
  wStringList : TStringList;
begin
  wStringList := TStringList.Create;

  dmDadosPEDSCI.tbEmpresas.First;
  while not dmDadosPEDSCI.tbEmpresas.Eof do
    begin
      wStringList.Add(fRetornarInformacoesRegistroAtual);

      dmDadosPEDSCI.tbEmpresas.Next;
    end;

  if not DirectoryExists(fDiretorioExportacao) then
     ForceDirectories(fDiretorioExportacao);

  wStringList.SaveToFile(fDiretorioExportacao + '\CadastrosEmpresas.txt');
  wStringList.Clear;
end;

procedure TfrConsEmpresas.pFiltrar;
var
  wDictCampos : TDictionary<Integer, String>;
  wCampoFiltro : String;
begin
  if (edFiltro.Text = '') or (cbFiltro.ItemIndex = -1) then
     begin
       dmDadosPEDSCI.tbEmpresas.Filtered := False;
       exit;
     end;

  wDictCampos := TDictionary<Integer, String>.Create;
  wDictCampos.Add(0, 'BDCODEMP');
  wDictCampos.Add(1, 'BDNOMEEMP');

  wCampoFiltro := wDictCampos[cbFiltro.ItemIndex];

  if wCampoFiltro = 'BDCODEMP' then
     begin
       dmDadosPEDSCI.tbEmpresas.Filter   := wCampoFiltro + ' = ' + edFiltro.Text;
       dmDadosPEDSCI.tbEmpresas.Filtered := True;
     end
  else
     begin
       dmDadosPEDSCI.tbEmpresas.FilterOptions := [foCaseInsensitive];
       dmDadosPEDSCI.tbEmpresas.Filter   := wCampoFiltro + ' LIKE ' + QuotedStr('%' + edFiltro.Text + '%');
       dmDadosPEDSCI.tbEmpresas.Filtered := True;
     end;
end;

function TfrConsEmpresas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbEmpresas;
end;

end.
