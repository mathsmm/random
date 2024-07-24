unit uConsItensNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient, Vcl.StdCtrls;

type
  TfrConsItensNotas = class(TfrFormPadraoConsultaPEDSCI)
    btResetarFiltro: TButton;
    cbFiltro: TComboBox;
    edFiltro: TEdit;
    ToolButton2: TToolButton;
    btExportar: TToolButton;
    ToolButton4: TToolButton;
    procedure grConsultaDblClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure edFiltroChange(Sender: TObject);
    procedure btResetarFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
    function fRetornarInformacoesRegistroAtual : String;
    procedure pFiltrar;
  end;

var
  frConsItensNotas: TfrConsItensNotas;

implementation

uses
  udmDadosPEDSCI, uCadItensNotas, System.Generics.Collections;

{$R *.dfm}

{ TfrConsItensNotas }

procedure TfrConsItensNotas.btFiltrarClick(Sender: TObject);
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

  dmDadosPEDSCI.tbItensNotas.Filtered := False;
end;

procedure TfrConsItensNotas.btResetarFiltroClick(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbItensNotas.Filtered := False;
end;

procedure TfrConsItensNotas.edFiltroChange(Sender: TObject);
begin
  inherited;
  pFiltrar;
end;

procedure TfrConsItensNotas.FormCreate(Sender: TObject);
begin
  inherited;
  dmDadosPEDSCI.tbItensNotas.Filtered := False;
end;

function TfrConsItensNotas.fRetornarInformacoesRegistroAtual: String;
begin
  Result := 'Código: '         + dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODIGO').AsString   + ' | ' +
            'Código Nota: '    + dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODNOTA').AsString  + ' | ' +
            'Código Empresa'   + dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODEMP').AsString   + ' | ' +
            'Código Produto: ' + dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODPROD').AsString  + ' | ' +
            'Valor unitário: ' + dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORUNI').AsString  + ' | ' +
            'Quantidade: '     + dmDadosPEDSCI.tbItensNotas.FieldByName('BDQTD').AsString      + ' | ' +
            'Valor total: '    + dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORTOTAL').AsString + ' | ' +
            'Base ICMS: '      + dmDadosPEDSCI.tbItensNotas.FieldByName('BDBCICMS').AsString   + ' | ' +
            'AlíquotaICMS: '   + dmDadosPEDSCI.tbItensNotas.FieldByName('BDALIQICMS').AsString + ' | ' +
            'Valor ICMS: '     + dmDadosPEDSCI.tbItensNotas.FieldByName('BDVLRICMS').AsString;
end;

procedure TfrConsItensNotas.grConsultaDblClick(Sender: TObject);
begin
  inherited;

  if not(Owner is TfrCadItensNotas) then
     exit;

  TfrCadItensNotas(Owner).edCOD.Text          := dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODIGO').AsString;
  TfrCadItensNotas(Owner).edCODNOTA.Text      := dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODNOTA').AsString;
  TfrCadItensNotas(Owner).edCODEMP.Text       := dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODEMP').AsString;
//  TfrCadItensNotas(Owner).edNOMEEMP.Text      := dmDadosPEDSCI.tbItensNotas.FieldByName('BDNOMEEMP').AsString;
  TfrCadItensNotas(Owner).edCODPROD.Text      := dmDadosPEDSCI.tbItensNotas.FieldByName('BDCODPROD').AsString;
//  TfrCadItensNotas(Owner).edDESCPROD.Text     := dmDadosPEDSCI.tbItensNotas.FieldByName('BDDESCPROD').AsString;
  TfrCadItensNotas(Owner).edVLRUNIT.Text      := dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORUNI').AsString;
  TfrCadItensNotas(Owner).edQTD.Text          := dmDadosPEDSCI.tbItensNotas.FieldByName('BDQTD').AsString;
  TfrCadItensNotas(Owner).edVLRTOTAL.Text     := dmDadosPEDSCI.tbItensNotas.FieldByName('BDVALORTOTAL').AsString;
  TfrCadItensNotas(Owner).edBaseICMS.Text     := dmDadosPEDSCI.tbItensNotas.FieldByName('BDBCICMS').AsString;
  TfrCadItensNotas(Owner).edAliquotaICMS.Text := dmDadosPEDSCI.tbItensNotas.FieldByName('BDALIQICMS').AsString;
  TfrCadItensNotas(Owner).edValorICMS.Text    := dmDadosPEDSCI.tbItensNotas.FieldByName('BDVLRICMS').AsString;

  Close;
end;

procedure TfrConsItensNotas.pFiltrar;
var
  wDictCampos : TDictionary<Integer, String>;
  wCampoFiltro : String;
begin
  if (edFiltro.Text = '') or (cbFiltro.ItemIndex = -1) then
     begin
       dmDadosPEDSCI.tbItensNotas.Filtered := False;
       exit;
     end;

  wDictCampos := TDictionary<Integer, String>.Create;
  wDictCampos.Add(0, 'BDCODIGO');
  wDictCampos.Add(1, 'BDCODEMP');
  wDictCampos.Add(2, 'BDCODNOTA');

  wCampoFiltro := wDictCampos[cbFiltro.ItemIndex];

  dmDadosPEDSCI.tbItensNotas.Filter   := wCampoFiltro + ' = ' + edFiltro.Text;
  dmDadosPEDSCI.tbItensNotas.Filtered := True;
end;

function TfrConsItensNotas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbItensNotas;
end;

end.
