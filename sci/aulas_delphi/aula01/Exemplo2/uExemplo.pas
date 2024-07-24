unit uExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    lbNome: TLabel;
    lbSexo: TLabel;
    edNome: TEdit;
    cbSexo: TComboBox;
    ckEstrangeiro: TCheckBox;
    btMensagem: TButton;
    edDataNascimento: TDateTimePicker;
    lbDataNascimento: TLabel;
    procedure btMensagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btMensagemClick(Sender: TObject);
var
  wEstrangeiro: String;
begin
  wEstrangeiro := 'Não';
  if ckEstrangeiro.Checked then
     wEstrangeiro := 'Sim';

  ShowMessage('Nome: '        + edNome.Text + #10'' +
              'Sexo: '        + cbSexo.Text + #10'' +
              'Estrangeiro: ' + wEstrangeiro)
end;

end.
