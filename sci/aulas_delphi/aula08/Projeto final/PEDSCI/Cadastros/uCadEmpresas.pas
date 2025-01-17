unit uCadEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoCadastroPEDSCI,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Datasnap.DBClient, System.Character, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrCadEmpresas = class(TfrFormPadraoCadastroPEDSCI)
    edCODEMP: TEdit;
    lbCODEMP: TLabel;
    edNOMEEMP: TEdit;
    edCNPJCPFEMP: TEdit;
    edTELEFONEEMP: TEdit;
    cbCODUFEMP: TComboBox;
    lbNOMEEMP: TLabel;
    lbCNPJCPFEMP: TLabel;
    lbCODUFEMP: TLabel;
    lbTELEFONEEMP: TLabel;
    SQLQueryMaiorCodigo: TSQLQuery;
    lbStatus: TLabel;
    procedure btConsultarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edCODEMPExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edCODEMPChange(Sender: TObject);
  private
    { Private declarations }
    procedure pDefinirStatus(prStatus: Integer);
    procedure pManipularTelaPorCampoCodigo(prExecucaoOpcional : Boolean);
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frCadEmpresas: TfrCadEmpresas;

implementation

uses
  udmDadosPEDSCI, uConsEmpresas, uUtilPEDSCI;

{$R *.dfm}

{ TfrCadEmpresas }

procedure TfrCadEmpresas.btConsultarClick(Sender: TObject);
begin
  inherited;
  TfrConsEmpresas.Create(Self);
  edCODEMP.SetFocus;
end;

procedure TfrCadEmpresas.btExcluirClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if (wUtilPEDSCI.fVerificarCampoCodigo(edCODEMP.Text, wEdCodigo, True)) and
     (dmDadosPEDSCI.tbEmpresas.FindKey([wEdCodigo])) then
     dmDadosPEDSCI.tbEmpresas.Delete;
end;

procedure TfrCadEmpresas.btOkClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if not wUtilPEDSCI.fVerificarCampoCodigo(edCODEMP.Text, wEdCodigo, True) then
     exit;

  if not wUtilPEDSCI.fVerificarCampoCNPJCPF(edCNPJCPFEMP.Text, True) then
     exit;

  if (cbCODUFEMP.ItemIndex = -1) or (edNOMEEMP.Text = '') then
     begin
       ShowMessage('Ainda h� campos incorretos ou incompletos.');
       exit;
     end;

  if dmDadosPEDSCI.tbEmpresas.FindKey([wEdCodigo]) then
     dmDadosPEDSCI.tbEmpresas.Edit
  else
     dmDadosPEDSCI.tbEmpresas.Append;

  dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODEMP').AsInteger  := wEdCodigo;
  dmDadosPEDSCI.tbEmpresas.FieldByName('BDCNPJCPF').AsString  := Trim(Copy(edCNPJCPFEMP.Text, 1, 18));
  dmDadosPEDSCI.tbEmpresas.FieldByName('BDNOMEEMP').AsString  := Trim(Copy(edNOMEEMP.Text, 1, 200));
  dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODUF').AsInteger   := cbCODUFEMP.ItemIndex + 1;
  dmDadosPEDSCI.tbEmpresas.FieldByName('BDTELEFONE').AsString := Trim(Copy(edTELEFONEEMP.Text, 1, 17));
  dmDadosPEDSCI.tbEmpresas.Post;

  edCODEMP.SetFocus;
end;

procedure TfrCadEmpresas.edCODEMPChange(Sender: TObject);
begin
  inherited;
  pManipularTelaPorCampoCodigo(False);
end;

procedure TfrCadEmpresas.edCODEMPExit(Sender: TObject);
begin
  pManipularTelaPorCampoCodigo(True);
//  else
//     setLimpaCampos;
end;

procedure TfrCadEmpresas.FormCreate(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
begin
  inherited;
  wUtilPEDSCI := TUtilPEDSCI.Create;
  cbCODUFEMP.Items := wUtilPEDSCI.fRetornarListaUFs;
end;

procedure TfrCadEmpresas.pDefinirStatus(prStatus: Integer);
var
  wUtilPEDSCI : TUtilPEDSCI;
begin
  wUtilPEDSCI := TUtilPEDSCI.Create;
  lbStatus.Caption := wUtilPEDSCI.fRetornarStatus(prStatus);
end;

procedure TfrCadEmpresas.pManipularTelaPorCampoCodigo(prExecucaoOpcional : Boolean);
var
  wUtilPEDSCI        : TUtilPEDSCI;
  wVerificacaoCodigo : Boolean;
  wEdCodigo          : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  wVerificacaoCodigo := wUtilPEDSCI.fVerificarCampoCodigo(edCODEMP.Text, wEdCodigo, False);

  if (wVerificacaoCodigo) and
     (dmDadosPEDSCI.tbEmpresas.FindKey([wEdCodigo])) then
     begin
       pDefinirStatus(2);
       if prExecucaoOpcional then
          begin
            edCNPJCPFEMP.Text    := dmDadosPEDSCI.tbEmpresas.FieldByName('BDCNPJCPF').AsString;
            edNOMEEMP.Text       := dmDadosPEDSCI.tbEmpresas.FieldByName('BDNOMEEMP').AsString;
            cbCODUFEMP.ItemIndex := dmDadosPEDSCI.tbEmpresas.FieldByName('BDCODUF').AsInteger - 1;
            edTELEFONEEMP.Text   := dmDadosPEDSCI.tbEmpresas.FieldByName('BDTELEFONE').AsString;
          end;
       exit;
     end
  else if (wVerificacaoCodigo) and
          (not dmDadosPEDSCI.tbEmpresas.FindKey([wEdCodigo])) then
     begin
       pDefinirStatus(1);
       exit;
     end
  else if (edCODEMP.Text = EmptyStr) then
     begin
       pDefinirStatus(1);
       if prExecucaoOpcional then
         begin
           SQLQueryMaiorCodigo.Close;
           SQLQueryMaiorCodigo.SQL.Clear;
           SQLQueryMaiorCodigo.SQL.Add(
             'SELECT MAX(EMP.BDCODEMP) MAIORCODIGO' + #13 +
             'FROM TEMPRESA EMP'
           );
           SQLQueryMaiorCodigo.Open;
           edCODEMP.Text := IntToStr(SQLQueryMaiorCodigo.FieldByName('MAIORCODIGO').AsInteger + 1);
         end;
       exit;
     end;

  pDefinirStatus(0);
end;

function TfrCadEmpresas.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbEmpresas;
end;

end.
