unit uExercicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.WinXPickers;

type
  TForm1 = class(TForm)
    lbNome: TLabel;
    lbSexo: TLabel;
    lbDataNascimento: TLabel;
    lbPCD1: TLabel;
    lbPCD2: TLabel;
    edNome: TEdit;
    cbSexo: TComboBox;
    rbPCDSim: TRadioButton;
    rbPCDNao: TRadioButton;
    lbxListaPessoas: TListBox;
    btAdicionar: TButton;
    imAdicionar: TImage;
    edDataNascimento: TDatePicker;
    lbCPF: TLabel;
    edCPF: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure edNomeChange(Sender: TObject);
    procedure edCPFChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    wStringList : TStringList;

    function fObterInformacoes : String;
    function fDiretorio : String;
    procedure pCarregarPessoasLista;
    procedure pVerificarCampos;
    procedure pLimparCampos;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btAdicionarClick(Sender: TObject);
begin
  if edNome.Text = '' then
     exit;

  wStringList.Add(fObterInformacoes);
  lbxListaPessoas.Items := wStringList;
  pLimparCampos;
end;

procedure TForm1.edCPFChange(Sender: TObject);
begin
  pVerificarCampos;
end;

procedure TForm1.edNomeChange(Sender: TObject);
begin
  pVerificarCampos
end;

function TForm1.fDiretorio: String;
begin
  Result := 'C:\Users\prog27\Desktop\Aulas Delphi\aula02\Exercicio2\Arquivo';
end;

function TForm1.fObterInformacoes: String;
var
  wStrSexo : String;
  wStrPCD : String;
begin
  if cbSexo.ItemIndex = 0 then
     wStrSexo := 'Masculino'
  else if cbSexo.ItemIndex = 1 then
     wStrSexo := 'Feminino';

  wStrPCD := 'Não';
  if rbPCDSim.Checked then
     wStrPCD := 'Sim';


  Result := 'Nome: ' + edNome.Text + ' | ' +
            'Sexo: ' + wStrSexo + ' | ' +
            'Data Nasc.:' + DateTimeToStr(edDataNascimento.Date) + ' | ' +
            'PCD: ' + wStrPCD + ' | ' +
            'CPF: ' + edCPF.Text;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not DirectoryExists(fDiretorio) then
     ForceDirectories(fDiretorio);

  wStringList.SaveToFile(fDiretorio + '\Cadastro.txt');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  wStringList := TStringList.Create;

  if FileExists(fDiretorio + '\Cadastro.txt') then
     wStringList.LoadFromFile(fDiretorio + '\Cadastro.txt');

  pCarregarPessoasLista;
end;

procedure TForm1.pCarregarPessoasLista;
begin
  lbxListaPessoas.Items := wStringList;
  lbxListaPessoas.SetFocus;
end;

procedure TForm1.pLimparCampos;
begin
  edNome.Text := '';
  edNome.SetFocus;
  rbPCDNao.Enabled := True;
  rbPCDNao.SetFocus();
  edCPF.Text := '';
  edCPF.SetFocus;
end;

procedure TForm1.pVerificarCampos;
begin
  if (edNome.Text = '') or (Length(edCPF.Text) <> 11) then
     btAdicionar.Enabled := False
  else
     btAdicionar.Enabled := True;
end;

end.
