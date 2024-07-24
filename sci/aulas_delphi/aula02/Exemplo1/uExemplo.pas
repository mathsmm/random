unit uExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrExemplo = class(TForm)
    lbNumero: TLabel;
    edNumero: TEdit;
    btMensagem: TButton;
    btAdicionar: TButton;
    lbxNumeros: TListBox;
    cbQuantidade: TComboBox;
    lbQuantidade: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btMensagemClick(Sender: TObject);
    procedure edNumeroChange(Sender: TObject);
  private
    { Private declarations }
    wStringList : TStringList;
    wMaior : Integer;
    procedure pLimpaCampo;
    procedure pMensagemPassouLimiteNumeros(prQuantidade : Integer);
  public
    { Public declarations }
  end;

var
  frExemplo: TfrExemplo;

implementation

{$R *.dfm}

procedure TfrExemplo.btAdicionarClick(Sender: TObject);
begin
  if edNumero.Text = '' then
     exit;

  if cbQuantidade.ItemIndex = 0 then
     begin
       if wStringList.Count >= 3 then
          begin
            pMensagemPassouLimiteNumeros(3);
            exit;
          end;
     end
  else if cbQuantidade.ItemIndex = 1 then
     begin
       if wStringList.Count >= 10 then
          begin
            pMensagemPassouLimiteNumeros(10);
            exit;
          end;
     end
  else if cbQuantidade.ItemIndex = 2 then
     begin
       if wStringList.Count >= 15 then
          begin
            pMensagemPassouLimiteNumeros(15);
            exit;
          end;
     end;

  wStringList.Add(edNumero.Text);
  lbxNumeros.Items.Add(edNumero.Text);
  btMensagem.Enabled := True;
  pLimpaCampo;
end;

procedure TfrExemplo.btMensagemClick(Sender: TObject);
var
  wI : Integer;
  wSLElementoAtual : Integer;
begin
  wMaior := 0;

  for wI := 0 to wStringList.Count-1 do
    begin
      wSLElementoAtual := StrToInt(wStringList[wI]);
      if wSLElementoAtual > wMaior then
         begin
           wMaior := wSLElementoAtual;
         end;
    end;

    ShowMessage('O maior número é: ' + IntToStr(wMaior));
    wStringList.Clear;
    lbxNumeros.Items.Clear;
    btMensagem.Enabled := False;
    pLimpaCampo;    
end;

procedure TfrExemplo.edNumeroChange(Sender: TObject);
begin
  if edNumero.Text = '' then
     btAdicionar.Enabled := False
  else if edNumero.Text <> '' then
     btAdicionar.Enabled := True;   
end;

procedure TfrExemplo.FormShow(Sender: TObject);
begin
  wStringList := TStringList.Create;
end;

procedure TfrExemplo.pLimpaCampo;
begin
  edNumero.Text := '';
  edNumero.SetFocus;
end;

procedure TfrExemplo.pMensagemPassouLimiteNumeros(prQuantidade: Integer);
begin
  ShowMessage('A quantidade de números passou do limite de ' 
              + IntToStr(prQuantidade) + 
              ' números!');
end;

end.
