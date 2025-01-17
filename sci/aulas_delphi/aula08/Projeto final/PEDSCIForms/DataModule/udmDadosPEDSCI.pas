unit udmDadosPEDSCI;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Dialogs,
  Datasnap.DBClient, Datasnap.Provider;

type
  TdmDadosPEDSCI = class(TDataModule)
    SQLQueryFiltros: TSQLQuery;
    dsQueryFiltros: TDataSource;
    dsEmpresas: TSQLDataSet;
    dspEmpresas: TDataSetProvider;
    tbEmpresas: TClientDataSet;
    tbClientes: TClientDataSet;
    tbProdutos: TClientDataSet;
    tbLancNotas: TClientDataSet;
    dsClientes: TSQLDataSet;
    dsProdutos: TSQLDataSet;
    dsLancNotas: TSQLDataSet;
    dspClientes: TDataSetProvider;
    dspProdutos: TDataSetProvider;
    dspLancNotas: TDataSetProvider;
    dsUF: TSQLDataSet;
    dspUF: TDataSetProvider;
    tbUF: TClientDataSet;
    dsItensNotas: TSQLDataSet;
    dspItensNotas: TDataSetProvider;
    tbItensNotas: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDadosPEDSCI: TdmDadosPEDSCI;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConnectionPEDSCI;

{$R *.dfm}

procedure TdmDadosPEDSCI.DataModuleCreate(Sender: TObject);
var
  I: Integer;
  wMSG: string;
  wObjName: string;
begin
  I := 0;
  wMSG := EmptyStr;
  wObjName := EmptyStr;
  if dmConnectionPEDSCI.SQLConnectionPEDSCI.Connected then
  begin
    for I := 0 to Self.ComponentCount-1 do
    begin
      if Self.Components[I] is TSQLQuery then
         TSQLQuery(Self.Components[I]).Close
      else
      if Self.Components[I] is TDataSet then
      try
        wObjName := TDataSet(Self.Components[I]).Name;
        if Self.Components[I] is TSQLDataSet then
           TSQLDataSet(Self.Components[I]).Open
        else
        if Self.Components[I] is TClientDataSet then
           TClientDataSet(Self.Components[I]).Open;
      except on E:Exception do
        wMSG := wMSG + 'Erro tentando acessar "' + Self.Name + '.' + wObjName + '".: ' + e.Message + #13;
      end;
    end;
  end
  else
     wMSG := 'N�o � poss�vel conectar as tabelas porque o banco n�o est� conectando.';

  if wMSG <> EmptyStr then
     MessageDlg(wMSG, mtError, [mbOK], 0);

  tbEmpresas.IndexDefs.Add('iCODEMP', 'BDCODEMP', [ixPrimary, ixUnique]);
  tbEmpresas.IndexDefs.Add('iNOMEEMP', 'BDNOMEEMP', [ixCaseInsensitive]);

  tbClientes.IndexDefs.Add('iCODCLI', 'BDCODIGO', [ixPrimary, ixUnique]);
  tbClientes.IndexDefs.Add('iNOMECLI', 'BDNOMECLI', [ixCaseInsensitive]);

  tbProdutos.IndexDefs.Add('iCODPROD', 'BDCODPROD', [ixPrimary, ixUnique]);
  tbProdutos.IndexDefs.Add('iDESCPROD', 'BDDESCRICAO', [ixCaseInsensitive]);

  tbLancNotas.IndexDefs.Add('iCODNOTA', 'BDCODNOTA', [ixPrimary, ixUnique]);
  tbLancNotas.IndexDefs.Add('iDATAEMISSAONOTA', 'BDDATAEMISSAO', []);
  tbLancNotas.IndexDefs.Add('iCODCLINOTA', 'BDCODCLI', []);
  tbLancNotas.IndexDefs.Add('iCODEMPNOTA', 'BDCODEMP', []);
  tbLancNotas.IndexDefs.Add('iCODPRODNOTA', 'BDCODPROD', []);

  tbItensNotas.IndexDefs.Add('iCODIGOS', 'BDCODIGO;BDCODEMP;BDCODNOTA', [ixPrimary, ixUnique]);
  //tbItensNotas.IndexDefs.Add('iCODPRODITENS', 'BDCODPROD', []);
end;

procedure TdmDadosPEDSCI.DataModuleDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[I] is TCustomSQLDataSet then
    try
      TCustomSQLDataSet(Self.Components[I]).Close;
    except
      // aqui n�o precisa apresentar mensagem pois est� finalizando o sistema
    end;
  end;
end;

end.
