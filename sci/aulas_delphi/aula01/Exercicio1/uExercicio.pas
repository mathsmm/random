unit uExercicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lbPrimeiroNumero: TLabel;
    lbSegundoNumero: TLabel;
    lbTerceiroNumero: TLabel;
    edPrimeiroNumero: TEdit;
    edSegundoNumero: TEdit;
    edTerceiroNumero: TEdit;
    btQualMaior: TButton;
    procedure btQualMaiorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btQualMaiorClick(Sender: TObject);
var
  wStringList : TStringList;
  wI : Integer;
  wMaiorNumero : Integer;
begin
  wStringList := TStringList.Create;
  wStringList.Add(edPrimeiroNumero.Text);
  wStringList.Add(edSegundoNumero.Text);
  wStringList.Add(edTerceiroNumero.Text);

  wMaiorNumero := StrToInt(wStringList[0]);

  wI := 0;
  while wI < wStringList.Count do
    begin
      if StrToInt(wStringList[wI]) > wMaiorNumero then
         wMaiorNumero := StrToInt(wStringList[wI]);

      wI := wI + 1;
    end;

    ShowMessage('O maior número é: ' + IntToStr(wMaiorNumero));
end;

end.
