unit uCadEmpresasEXEMPLO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoCadastroPEDSCI,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Datasnap.DBClient,
  Vcl.Mask;

type
  TfrCadEmpresasEXEMPLO = class(TfrFormPadraoCadastroPEDSCI)
    edCODEMP: TEdit;
    edCNPJEMP: TEdit;
    edNOMEMP: TEdit;
    lbCODEMP: TLabel;
    lbCNPJEMP: TLabel;
    lbNOMEMP: TLabel;
    procedure btOkClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure edCODEMPExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frCadEmpresasEXEMPLO: TfrCadEmpresasEXEMPLO;

implementation

{$R *.dfm}

uses udmDadosPEDSCI, uConsEmpresas;


procedure TfrCadEmpresasEXEMPLO.btConsultarClick(Sender: TObject);
begin
  inherited;
  TfrConsEmpresas.Create(edCODEMP);
end;

procedure TfrCadEmpresasEXEMPLO.btExcluirClick(Sender: TObject);
begin
  inherited;
  if dmDadosPEDSCI.tbEmpresas.FindKey([StrToInt(Trim(edCODEMP.Text))]) then
     dmDadosPEDSCI.tbEmpresas.Delete;
end;

procedure TfrCadEmpresasEXEMPLO.btOkClick(Sender: TObject);
begin
  inherited;
  if dmDadosPEDSCI.tbEmpresas.FindKey([StrToInt(Trim(edCODEMP.Text))]) then
     dmDadosPEDSCI.tbEmpresas.Edit
  else
     dmDadosPEDSCI.tbEmpresas.Append;
  dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODEMP').AsInteger := StrToInt(Trim(edCODEMP.Text));
  dmDadosPEDSCI.tbEmpresas.FieldByName('BDCNPJEMP').AsString := Trim(Copy(edCNPJEMP.Text, 1, 18));
  dmDadosPEDSCI.tbEmpresas.FieldByName('BDNOMEMP').AsString := Trim(Copy(edNOMEMP.Text, 1, 100));
  dmDadosPEDSCI.tbEmpresas.Post;
end;

procedure TfrCadEmpresasEXEMPLO.edCODEMPExit(Sender: TObject);
begin
  inherited;
  if dmDadosPEDSCI.tbEmpresas.FindKey([StrToInt(Trim(edCODEMP.Text))]) then
  begin
    edCNPJEMP.Text := dmDadosPEDSCI.tbEmpresas.FieldByName('BDCNPJEMP').AsString;
    edNOMEMP.Text := dmDadosPEDSCI.tbEmpresas.FieldByName('BDNOMEMP').AsString;
  end
  else
     setLimpaCampos;
end;

function TfrCadEmpresasEXEMPLO.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbEmpresas;
end;

end.
