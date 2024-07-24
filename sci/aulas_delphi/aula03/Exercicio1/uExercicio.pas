unit uExercicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Datasnap.DBClient,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    lbNome: TLabel;
    lbSexo: TLabel;
    edNome: TEdit;
    cbSexo: TComboBox;
    ckEstrangeiro: TCheckBox;
    btAdicionarPessoa: TButton;
    lbxListaPessoas: TListBox;
    btMensagem: TButton;
    lbCodigo: TLabel;
    edCodigo: TEdit;
    rbCodigo: TRadioButton;
    rbNome: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure btAdicionarPessoaClick(Sender: TObject);
    procedure btMensagemClick(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure edCodigoChange(Sender: TObject);
    procedure edNomeChange(Sender: TObject);
  private
    { Private declarations }
    cdsClientDataSet : TClientDataSet;

    function fDiretorio : String;
    function fRetornarRegistroAtual : String;
    procedure pCarregarDataClient;
    procedure pCarregarListBox;
    procedure pCarregarCampos;
    procedure pVerificarCampos;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Data.DB;

{$R *.dfm}

procedure TForm1.btAdicionarPessoaClick(Sender: TObject);
var
  wI : Integer;
begin
  if edNome.Text = '' then
     exit;

  cdsClientDataSet.IndexFieldNames := 'bdCODIGO';
  if cdsClientDataSet.FindKey([edCodigo.Text]) then
     cdsClientDataSet.Edit
  else
     cdsClientDataSet.Insert;

  cdsClientDataSet.FieldByName('bdCODIGO').AsInteger      := StrToInt(edCodigo.Text);
  cdsClientDataSet.FieldByName('bdNOME').AsString         := edNome.Text;
  cdsClientDataSet.FieldByName('bdSEXO').AsInteger        := cbSexo.ItemIndex;
  cdsClientDataSet.FieldByName('bdESTRANGEIRO').AsBoolean := ckEstrangeiro.Checked;
  cdsClientDataSet.Post;

  pCarregarListBox;
end;

procedure TForm1.btMensagemClick(Sender: TObject);
var
  wI : Integer;
  wMensagem : String;
begin
  if rbCodigo.Checked then
     cdsClientDataSet.IndexFieldNames := 'bdCODIGO';

  if rbNome.Checked then
     cdsClientDataSet.IndexFieldNames := 'bdNOME';

  cdsClientDataSet.First;

  while not cdsClientDataSet.Eof do
  //Enquanto não "passar pela última linha do ClientDataSet"
    begin
      wMensagem := wMensagem + #13 + fRetornarRegistroAtual;

      cdsClientDataSet.Next;
    end;

  ShowMessage(wMensagem);
end;

procedure TForm1.edCodigoChange(Sender: TObject);
begin
  pVerificarCampos;
end;

procedure TForm1.edCodigoExit(Sender: TObject);
begin
  pCarregarCampos;
end;

procedure TForm1.edNomeChange(Sender: TObject);
begin
  pVerificarCampos;
end;

function TForm1.fDiretorio: String;
begin
  Result := 'C:\Users\prog27\Desktop\Aulas Delphi\aula02\Exercicio1\Arquivo';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pCarregarDataClient;
  pVerificarCampos;
end;

function TForm1.fRetornarRegistroAtual: String;
var
  wStrSexo : String;
  wStrEstrangeiro : String;
begin
    wStrSexo := 'Masculino';
    if cdsClientDataSet.FieldByName('bdSEXO').AsInteger = 1 then
       wStrSexo := 'Feminino';

    wStrEstrangeiro := 'Não';
    if cdsClientDataSet.FieldByName('bdESTRANGEIRO').AsBoolean then
       wStrEstrangeiro := 'Sim';

    Result := 'Código: '      + IntToStr(cdsClientDataSet.FieldByName('bdCODIGO').AsInteger) + ' | ' +
              'Nome: '        + cdsClientDataSet.FieldByName('bdNOME').AsString              + ' | ' +
              'Sexo: '        + wStrSexo                                                     + ' | ' +
              'Estrangeiro: ' + wStrEstrangeiro;
end;

procedure TForm1.pCarregarCampos;
begin
  cdsClientDataSet.IndexFieldNames := 'bdCODIGO';
  if cdsClientDataSet.FindKey([edCodigo.Text]) then
     begin
       edNome.Text := cdsClientDataSet.FieldByName('bdNOME').AsString;
       edNome.SetFocus;
       cbSexo.ItemIndex := cdsClientDataSet.FieldByName('bdSEXO').AsInteger;
       cbSexo.SetFocus;
       ckEstrangeiro.Checked := cdsClientDataSet.FieldByName('bdESTRANGEIRO').AsBoolean;
       ckEstrangeiro.SetFocus;
     end;
end;

procedure TForm1.pCarregarDataClient;
begin
  cdsClientDataSet := TClientDataSet.Create(nil);

  //Colunas
  cdsClientDataSet.FieldDefs.Add('bdCODIGO', ftInteger);
  cdsClientDataSet.FieldDefs.Add('bdNOME', ftString, 255);
  cdsClientDataSet.FieldDefs.Add('bdSEXO', ftInteger);
  cdsClientDataSet.FieldDefs.Add('bdESTRANGEIRO', ftBoolean);

  //Índices
  cdsClientDataSet.IndexDefs.Add('iCODIGO', 'bdCODIGO', [ixPrimary, ixUnique]);
  cdsClientDataSet.IndexDefs.Add('iNOME', 'bdNome', [ixCaseInsensitive]);

  cdsClientDataSet.CreateDataSet;
  cdsClientDataSet.Open;
end;

procedure TForm1.pCarregarListBox;
var
  wStringList : TStringList;
begin
  wStringList := TStringList.Create;

  if rbCodigo.Checked then
     cdsClientDataSet.IndexFieldNames := 'bdCODIGO';

  if rbNome.Checked then
     cdsClientDataSet.IndexFieldNames := 'bdNOME';

  cdsClientDataSet.First;
  while not cdsClientDataSet.Eof do
  //Enquanto não "passar pela última linha do ClientDataSet"
    begin
     wStringList.Add(fRetornarRegistroAtual);

     cdsClientDataSet.Next;
    end;

    lbxListaPessoas.Items := wStringList;
end;

procedure TForm1.pVerificarCampos;
begin
  if (edCodigo.Text = '') or (edNome.Text = '') then
     btAdicionarPessoa.Enabled := False
  else
     btAdicionarPessoa.Enabled := True;
end;

end.
