unit uExercicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    procedure FormShow(Sender: TObject);
    procedure btAdicionarPessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btMensagemClick(Sender: TObject);
  private
    { Private declarations }
    wStringList : TStringList;

    function fDiretorio : String;
    function fObterInformacoes : String;
    procedure pCarregaPessoasNaLista;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btAdicionarPessoaClick(Sender: TObject);
var
  wI : Integer;
begin
  wStringList.Add(fObterInformacoes);
  pCarregaPessoasNaLista;
end;

procedure TForm1.btMensagemClick(Sender: TObject);
var
  wI : Integer;
  wMensagem : String;
begin
  for wI := 0 to wStringList.Count-1 do
    begin
      wMensagem := wMensagem + wStringList[wI] + #13''
    end;

  ShowMessage(wMensagem)
end;

function TForm1.fDiretorio: String;
begin
  Result := 'C:\Users\prog27\Desktop\Aulas Delphi\aula02\Exercicio1\Arquivo';
end;

function TForm1.fObterInformacoes: String;
var
  wStrEstrangeiro : String;
  wStrSexo : String;
begin
  wStrEstrangeiro := 'Não';
  if ckEstrangeiro.Checked then
     wStrEstrangeiro := 'Sim';

  if cbSexo.ItemIndex = 0 then
     wStrSexo := 'Masculino'
  else if cbSexo.ItemIndex = 1 then
     wStrSexo := 'Feminino';


  Result := 'Nome: ' + edNome.Text + ' | ' +
            'Sexo: ' + wStrSexo + ' | ' +
            'Estrangeiro: ' + wStrEstrangeiro;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Ao fechar o formulário, salva a wStringList em um arquivo
  //Se o diretório não existir, cria o diretório
  if not DirectoryExists(fDiretorio) then
     ForceDirectories(fDiretorio);

  //Sobrescreve o arquivo que já existir
  wStringList.SaveToFile(fDiretorio + '\Cadastro.txt');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  wStringList := TStringList.Create;

  if FileExists(fDiretorio + '\Cadastro.txt') then
     wStringList.LoadFromFile(fDiretorio + '\Cadastro.txt');

  pCarregaPessoasNaLista;
end;

procedure TForm1.pCarregaPessoasNaLista;
begin
  lbxListaPessoas.Items := wStringList;
end;

end.
