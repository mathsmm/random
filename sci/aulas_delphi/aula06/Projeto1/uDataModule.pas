unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TdmCadastro = class(TDataModule)
    dsCadastro: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cdsClientDataSet : TClientDataSet;

    procedure pCarregarDataClient;
    procedure pOrdenarCDSPorCodigo;
    procedure pOrdenarCDSPorNome;
  end;

var
  dmCadastro: TdmCadastro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCadastro.DataModuleCreate(Sender: TObject);
begin
  pCarregarDataClient;
  dsCadastro.DataSet := cdsClientDataSet;
end;

procedure TdmCadastro.pCarregarDataClient;
begin
  cdsClientDataSet := TClientDataSet.Create(nil);

  cdsClientDataSet.FieldDefs.Add('bdCODIGO', ftInteger);
  cdsClientDataSet.FieldDefs.Add('bdTIPOPESSOA', ftInteger);
  cdsClientDataSet.FieldDefs.Add('bdCPFCNPJ', ftString, 14);
  cdsClientDataSet.FieldDefs.Add('bdNOME', ftString, 255);
  cdsClientDataSet.FieldDefs.Add('bdENDERECO', ftString, 255);
  cdsClientDataSet.FieldDefs.Add('bdISENTO', ftBoolean);

  cdsClientDataSet.IndexDefs.Add('iCODIGO', 'bdCODIGO', [ixPrimary, ixUnique]);
  cdsClientDataSet.IndexDefs.Add('iNOME', 'bdNome', [ixCaseInsensitive]);

  cdsClientDataSet.CreateDataSet;
  cdsClientDataSet.Open;
end;

procedure TdmCadastro.pOrdenarCDSPorCodigo;
begin
  cdsClientDataSet.IndexFieldNames := 'bdCODIGO';
end;

procedure TdmCadastro.pOrdenarCDSPorNome;
begin
  dmCadastro.cdsClientDataSet.IndexFieldNames := 'bdNOME';
end;

end.
