unit uConsultaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uConsultaPai, Data.DB, Vcl.Grids,
  Vcl.DBGrids, uDataModule;

type
  TfrTelaConsultaPessoa = class(TfrTelaConsultaPai)
    DBGrid1: TDBGrid;
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frTelaConsultaPessoa: TfrTelaConsultaPessoa;

implementation

{$R *.dfm}

procedure TfrTelaConsultaPessoa.DBGrid1TitleClick(Column: TColumn);
begin
  //inherited;
  if Column.FieldName = 'bdCODIGO' then
     dmCadastro.pOrdenarCDSPorCodigo
  else if Column.FieldName = 'bdNOME' then
     dmCadastro.pOrdenarCDSPorNome;
end;

end.
