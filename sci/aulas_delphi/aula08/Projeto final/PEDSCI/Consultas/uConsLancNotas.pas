unit uConsLancNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient, Vcl.StdCtrls, Vcl.WinXPickers;

type
  TfrConsLancNotas = class(TfrFormPadraoConsultaPEDSCI)
    cbFiltro: TComboBox;
    edFiltro: TEdit;
    ToolButton2: TToolButton;
    edFiltroDataInicial: TDatePicker;
    edFiltroDataFinal: TDatePicker;
    btExportar: TToolButton;
    ToolButton5: TToolButton;
    btResetarFiltro: TButton;
    procedure cbFiltroSelect(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edFiltroDataInicialCloseUp(Sender: TObject);
    procedure edFiltroDataFinalCloseUp(Sender: TObject);
    procedure btResetarFiltroClick(Sender: TObject);
    procedure grConsultaDblClick(Sender: TObject);
    procedure grConsultaTitleClick(Column: TColumn);
    procedure edFiltroChange(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function fDiretorioExportacao : String;
    function fRetornarInformacoesRegistroAtual : String;
    procedure pExportar;
    procedure pFiltrar;
    procedure pFiltrarEntreDatasEmissao;
  end;

var
  frConsLancNotas: TfrConsLancNotas;

implementation

uses
  udmDadosPEDSCI, System.Generics.Collections, uCadLancNotas;

{$R *.dfm}

{ TfrConsLancNotas }

procedure TfrConsLancNotas.btExportarClick(Sender: TObject);
begin
  inherited;
  pExportar;
end;

procedure TfrConsLancNotas.btFiltrarClick(Sender: TObject);
begin
  inherited;
  if cbFiltro.Visible then
     begin
       cbFiltro.Visible            := False;
       edFiltro.Visible            := False;
       edFiltroDataInicial.Visible := False;
       edFiltroDataFinal.Visible   := False;
       btResetarFiltro.Visible     := False;
     end
  else
     begin
       cbFiltro.Visible := True;

       if cbFiltro.ItemIndex <> 1 then
          begin
            edFiltro.Visible        := True;
            btResetarFiltro.Left    := 459;
            btResetarFiltro.Visible := True;
          end
       else
          begin
            edFiltroDataInicial.Visible := True;
            edFiltroDataFinal.Visible   := True;
            btResetarFiltro.Left        := 593;
            btResetarFiltro.Visible     := True;
          end;
     end;

  dmDadosPEDSCI.tbLancNotas.Filtered := False;
end;

procedure TfrConsLancNotas.btResetarFiltroClick(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbLancNotas.Filtered := False;
end;

procedure TfrConsLancNotas.cbFiltroSelect(Sender: TObject);
begin
  inherited;
  edFiltro.Text := '';

  if cbFiltro.ItemIndex = 1 then
     begin
       edFiltro.Visible            := False;
       edFiltroDataInicial.Visible := True;
       edFiltroDataFinal.Visible   := True;
       btResetarFiltro.Left        := 593;
     end
  else
     begin
       edFiltro.Visible            := True;
       edFiltroDataInicial.Visible := False;
       edFiltroDataFinal.Visible   := False;
       btResetarFiltro.Left        := 459;
     end;
end;

procedure TfrConsLancNotas.edFiltroChange(Sender: TObject);
begin
  inherited;
  pFiltrar;
end;

procedure TfrConsLancNotas.edFiltroDataFinalCloseUp(Sender: TObject);
begin
  inherited;
  pFiltrarEntreDatasEmissao;
end;

procedure TfrConsLancNotas.edFiltroDataInicialCloseUp(Sender: TObject);
begin
  inherited;
  pFiltrarEntreDatasEmissao;
end;

function TfrConsLancNotas.fDiretorioExportacao: String;
begin
  Result := 'C:\Users\prog27\Desktop\sci\aulas_delphi\aula08\Projeto final\PEDSCIForms\Exportacoes\LancNotas'
end;

procedure TfrConsLancNotas.FormActivate(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbLancNotas.Refresh;
end;

procedure TfrConsLancNotas.FormCreate(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbLancNotas.Filtered := False;
  edFiltroDataInicial.Visible := False;
  edFiltroDataFinal.Visible   := False;
end;

function TfrConsLancNotas.fRetornarInformacoesRegistroAtual: String;
begin
  Result := 'C�digo: '          + dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODNOTA').AsString  + ' | ' +
            'C�digo Cliente: '  + dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODCLI').AsString   + ' | ' +
            'C�digo Empresa: '  + dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODEMP').AsString   + ' | ' +
            'Data de emiss�o: ' + FormatDateTime('dd/mm/yyyy', dmDadosPEDSCI.tbLancNotas.FieldByName('BDDATAEMISSAO').AsDateTime) + ' | ' +
            'Valor: '           + dmDadosPEDSCI.tbLancNotas.FieldByName('BDVLRNOTA').AsString;
end;

procedure TfrConsLancNotas.grConsultaDblClick(Sender: TObject);
begin
  inherited;

  if not(Owner is TfrCadLancNotas) then
     exit;

  TfrCadLancNotas(Owner).edCODNOTA.Text         := dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODNOTA').AsString;
  TfrCadLancNotas(Owner).edCODCLINOTA.Text      := dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODCLI').AsString;
  TfrCadLancNotas(Owner).edCODEMPNOTA.Text      := dmDadosPEDSCI.tbLancNotas.FieldByName('BDCODEMP').AsString;
  TfrCadLancNotas(Owner).edDATAEMISSAONOTA.Date := dmDadosPEDSCI.tbLancNotas.FieldByName('BDDATAEMISSAO').AsDateTime;
  TfrCadLancNotas(Owner).edVLRNOTA.Text         := dmDadosPEDSCI.tbLancNotas.FieldByName('BDVLRNOTA').AsString;

  Close;
end;

procedure TfrConsLancNotas.grConsultaTitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'BDCODNOTA' then
     dmDadosPEDSCI.tbLancNotas.IndexFieldNames := 'BDCODNOTA'
  else if Column.FieldName = 'BDDATAEMISSAO' then
     dmDadosPEDSCI.tbLancNotas.IndexFieldNames := 'BDDATAEMISSAO'
  else if Column.FieldName = 'BDCODCLI' then
     dmDadosPEDSCI.tbLancNotas.IndexFieldNames := 'BDCODCLI'
  else if Column.FieldName = 'BDCODEMP' then
     dmDadosPEDSCI.tbLancNotas.IndexFieldNames := 'BDCODEMP'
end;

procedure TfrConsLancNotas.pExportar;
var
  wStringList : TStringList;
begin
  wStringList := TStringList.Create;

  dmDadosPEDSCI.tbLancNotas.First;
  while not dmDadosPEDSCI.tbLancNotas.Eof do
    begin
      wStringList.Add(fRetornarInformacoesRegistroAtual);

      dmDadosPEDSCI.tbLancNotas.Next;
    end;

  if not DirectoryExists(fDiretorioExportacao) then
     ForceDirectories(fDiretorioExportacao);

  wStringList.SaveToFile(fDiretorioExportacao + '\CadastrosLancNotas.txt');
  wStringList.Clear;
end;

procedure TfrConsLancNotas.pFiltrar;
var
  wDictCampos : TDictionary<Integer, String>;
  wCampoFiltro : String;
begin
  if (edFiltro.Text = '') or (cbFiltro.ItemIndex = -1) then
     begin
       dmDadosPEDSCI.tbLancNotas.Filtered := False;
       exit;
     end;

  wDictCampos := TDictionary<Integer, String>.Create;
  wDictCampos.Add(0, 'BDCODNOTA');

  { Filtro por data � implementado em edFiltroDataInicial e edFiltroDataFinal }
  wDictCampos.Add(1, 'BDDATAEMISSAO');

  wDictCampos.Add(2, 'BDCODCLI');
  wDictCampos.Add(3, 'BDCODEMP');

  wCampoFiltro := wDictCampos[cbFiltro.ItemIndex];

  dmDadosPEDSCI.tbLancNotas.Filter   := wCampoFiltro + ' = ' + edFiltro.Text;
  dmDadosPEDSCI.tbLancNotas.Filtered := True;
end;

procedure TfrConsLancNotas.pFiltrarEntreDatasEmissao;
begin
  dmDadosPEDSCI.tbLancNotas.Filter :=
    'BDDATAEMISSAO >= ' +
    QuotedStr(FormatDateTime('dd/mm/yyyy', edFiltroDataInicial.Date)) +
    ' AND BDDATAEMISSAO <= ' +
    QuotedStr(FormatDateTime('dd/mm/yyyy', edFiltroDataFinal.Date));

  dmDadosPEDSCI.tbLancNotas.Filtered := True;
end;

function TfrConsLancNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbLancNotas;
end;

end.
