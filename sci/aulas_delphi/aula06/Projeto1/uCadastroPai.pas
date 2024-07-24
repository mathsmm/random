unit uCadastroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrTelaCadastroPai = class(TForm)
    lbCodigo: TLabel;
    edCodigo: TEdit;
    imCodigo: TImage;
    procedure edCodigoExit(Sender: TObject); Virtual; Abstract;
    procedure edCodigoChange(Sender: TObject); Virtual; Abstract;
  private
    { Private declarations }
  public
    { Public declarations }
    function fVerificarCaracteresCodigo : Boolean; Virtual; Abstract;
    function fVerificarCampoCodigo : Boolean; Virtual; Abstract;
  end;

var
  frTelaCadastroPai: TfrTelaCadastroPai;

implementation

{$R *.dfm}

{ TfrTelaCadastroPai }

end.
