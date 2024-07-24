unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient;

type
  TfrTelaPrincipal = class(TForm)
    lbCadastro: TLabel;
    btAbrirCadastro: TButton;
    cbCadastros: TComboBox;
    DBGrid1: TDBGrid;
    dsCadastro: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btAbrirCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cdsClientDataSet : TClientDataSet;
  end;

var
  frTelaPrincipal: TfrTelaPrincipal;

implementation
  uses
    uPessoa, uFuncionario, uSupervisor;

{$R *.dfm}

procedure TfrTelaPrincipal.btAbrirCadastroClick(Sender: TObject);
var
  wTelaPessoa      : TfrPessoa;
  wTelaFuncionario : TfrFuncionario;
  wTelaSupervisor  : TfrSupervisor;
begin
  if cbCadastros.ItemIndex = 0 then
     begin
       wTelaPessoa := TfrPessoa.Create(Self);
       wTelaPessoa.Show;
     end
  else if cbCadastros.ItemIndex = 1 then
     begin
       wTelaFuncionario := TfrFuncionario.Create(Self);
       wTelaFuncionario.Show;
     end
  else
     begin
       wTelaSupervisor := TfrSupervisor.Create(Self);
       wTelaSupervisor.Show;
     end;
end;

procedure TfrTelaPrincipal.FormCreate(Sender: TObject);
begin
  cdsClientDataSet := TClientDataSet.Create(nil);

  cdsClientDataSet.FieldDefs.Add('bdCODIGO', ftInteger);
  cdsClientDataSet.FieldDefs.Add('bdTIPO', ftString, 20);
  cdsClientDataSet.FieldDefs.Add('bdNOME', ftString, 100);
  cdsClientDataSet.FieldDefs.Add('bdCPF', ftString, 14);
  cdsClientDataSet.FieldDefs.Add('bdDATANASC', ftDate);
  cdsClientDataSet.FieldDefs.Add('bdDATAADMISSAO', ftDate);
  cdsClientDataSet.FieldDefs.Add('bdSETOR', ftString, 100);

  cdsClientDataSet.IndexDefs.Add('iCODIGO', 'bdCODIGO', [ixPrimary, ixUnique]);
  cdsClientDataSet.IndexDefs.Add('iNOME', 'bdNOME', [ixCaseInsensitive]);

  cdsClientDataSet.CreateDataSet;
  cdsClientDataSet.Open;

  dsCadastro.DataSet := cdsClientDataSet;
end;

end.
