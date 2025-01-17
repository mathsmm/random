unit uCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoCadastroPEDSCI,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Datasnap.DBClient, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TfrCadClientes = class(TfrFormPadraoCadastroPEDSCI)
    edCODCLI: TEdit;
    lbCODCLI: TLabel;
    edNOMECLI: TEdit;
    edCNPJCPFCLI: TEdit;
    edTELEFONECLI: TEdit;
    cbCODUFCLI: TComboBox;
    lbNOMECLI: TLabel;
    lbCNPJCPFCLI: TLabel;
    lbCODUFCLI: TLabel;
    lbTELEFONECLI: TLabel;
    SQLQueryMaiorCodigo: TSQLQuery;
    lbStatus: TLabel;
    procedure btConsultarClick(Sender: TObject);
    procedure edCODCLIExit(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edCODCLIChange(Sender: TObject);
  private
    { Private declarations }
    procedure pDefinirStatus(prStatus : Integer);
    procedure pManipularTelaPorCampoCodigo(prExecucaoOpcional : Boolean);
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frCadClientes: TfrCadClientes;

implementation

uses
  udmDadosPEDSCI, uConsClientes, uUtilPEDSCI, System.Generics.Collections;

{$R *.dfm}

{ TfrCadClientes }

procedure TfrCadClientes.btConsultarClick(Sender: TObject);
begin
  inherited;
  TfrConsClientes.Create(Self);
  edCODCLI.SetFocus;
end;

procedure TfrCadClientes.btExcluirClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if (wUtilPEDSCI.fVerificarCampoCodigo(edCODCLI.Text, wEdCodigo, True)) and
     (dmDadosPEDSCI.tbClientes.FindKey([wEdCodigo])) then
     dmDadosPEDSCI.tbClientes.Delete;
end;

procedure TfrCadClientes.btOkClick(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
  wEdCodigo : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;

  if not wUtilPEDSCI.fVerificarCampoCodigo(edCODCLI.Text, wEdCodigo, True) then
     exit;

  if not wUtilPEDSCI.fVerificarCampoCNPJCPF(edCNPJCPFCLI.Text, True) then
     exit;

  if (cbCODUFCLI.ItemIndex = -1) or (edNOMECLI.Text = '') then
     begin
       ShowMessage('Ainda h� campos incorretos ou incompletos.');
       exit;
     end;

  if dmDadosPEDSCI.tbClientes.FindKey([wEdCodigo]) then
     dmDadosPEDSCI.tbClientes.Edit
  else
     dmDadosPEDSCI.tbClientes.Append;

  dmDadosPEDSCI.tbClientes.FieldByName('BDCODIGO').AsInteger  := wEdCodigo;
  dmDadosPEDSCI.tbClientes.FieldByName('BDCNPJCPF').AsString  := Trim(Copy(edCNPJCPFCLI.Text, 1, 18));
  dmDadosPEDSCI.tbClientes.FieldByName('BDNOMECLI').AsString  := Trim(Copy(edNOMECLI.Text, 1, 200));
  dmDadosPEDSCI.tbClientes.FieldByName('BDCODUF').AsInteger   := cbCODUFCLI.ItemIndex + 1;
  dmDadosPEDSCI.tbClientes.FieldByName('BDTELEFONE').AsString := Trim(Copy(edTELEFONECLI.Text, 1, 17));
  dmDadosPEDSCI.tbClientes.Post;

  edCODCLI.SetFocus;
end;

procedure TfrCadClientes.edCODCLIChange(Sender: TObject);
begin
  inherited;
  pManipularTelaPorCampoCodigo(False);
end;

procedure TfrCadClientes.edCODCLIExit(Sender: TObject);
begin
  pManipularTelaPorCampoCodigo(True);
//  else
//     setLimpaCampos;
end;

procedure TfrCadClientes.FormCreate(Sender: TObject);
var
  wUtilPEDSCI : TUtilPEDSCI;
begin
  inherited;
  wUtilPEDSCI := TUtilPEDSCI.Create;
  cbCODUFCLI.Items := wUtilPEDSCI.fRetornarListaUFs;
end;

procedure TfrCadClientes.pDefinirStatus(prStatus: Integer);
var
  wUtilPEDSCI : TUtilPEDSCI;
begin
  wUtilPEDSCI := TUtilPEDSCI.Create;
  lbStatus.Caption := wUtilPEDSCI.fRetornarStatus(prStatus);
end;

procedure TfrCadClientes.pManipularTelaPorCampoCodigo(prExecucaoOpcional : Boolean);
var
  wUtilPEDSCI        : TUtilPEDSCI;
  wVerificacaoCodigo : Boolean;
  wEdCodigo          : Integer;
begin
  inherited;

  wUtilPEDSCI := TUtilPEDSCI.Create;
  wVerificacaoCodigo := wUtilPEDSCI.fVerificarCampoCodigo(edCODCLI.Text, wEdCodigo, False);

  if (wVerificacaoCodigo) and
     (dmDadosPEDSCI.tbClientes.FindKey([wEdCodigo])) then
     begin
       pDefinirStatus(2);
         if prExecucaoOpcional then
            begin
              edCNPJCPFCLI.Text    := dmDadosPEDSCI.tbClientes.FieldByName('BDCNPJCPF').AsString;
              edNOMECLI.Text       := dmDadosPEDSCI.tbClientes.FieldByName('BDNOMECLI').AsString;
              cbCODUFCLI.ItemIndex := dmDadosPEDSCI.tbClientes.FieldByName('BDCODUF').AsInteger - 1;
              edTELEFONECLI.Text   := dmDadosPEDSCI.tbClientes.FieldByName('BDTELEFONE').AsString;
            end;
       exit;
     end
  else if (wVerificacaoCodigo) and
          (not dmDadosPEDSCI.tbClientes.FindKey([wEdCodigo])) then
     begin
       pDefinirStatus(1);
       exit;
     end
  else if (edCODCLI.Text = EmptyStr) then
     begin
       pDefinirStatus(1);
       if prExecucaoOpcional then
         begin
           SQLQueryMaiorCodigo.Close;
           SQLQueryMaiorCodigo.SQL.Clear;
           SQLQueryMaiorCodigo.SQL.Add(
             'SELECT MAX(CLI.BDCODIGO) MAIORCODIGO' + #13 +
             'FROM TCLIENTE CLI'
           );
           SQLQueryMaiorCodigo.Open;
           edCODCLI.Text := IntToStr(SQLQueryMaiorCodigo.FieldByName('MAIORCODIGO').AsInteger + 1);
         end;
       exit;
     end;

  pDefinirStatus(0);
end;

function TfrCadClientes.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbClientes;
end;

end.
