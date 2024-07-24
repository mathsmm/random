unit uPessoa;

interface

type
  TPessoa = class
  private
    { Private declarations }
  public
    { Public declarations }
    wCódigo     : Integer;
    wTipoPessoa : Integer;
    wCPFCNPJ    : String;
    wNome       : String;
    wEndereco   : String;
    wIsento     : Boolean;

    procedure pSalvarPessoa(prPessoa : TPessoa);
    procedure pExcluirPessoa(prCodigo : Integer);
    procedure pTipoPessoa; Virtual; Abstract;
  end;

implementation

uses
  uDataModule;

{ TPessoa }

procedure TPessoa.pExcluirPessoa(prCodigo: Integer);
begin
  if dmCadastro.cdsClientDataSet.FindKey([prCodigo]) then
     dmCadastro.cdsClientDataSet.Delete
end;

procedure TPessoa.pSalvarPessoa(prPessoa : TPessoa);
begin
  dmCadastro.pOrdenarCDSPorCodigo;

  if dmCadastro.cdsClientDataSet.FindKey([prPessoa.wCódigo]) then
     dmCadastro.cdsClientDataSet.Edit
  else
     dmCadastro.cdsClientDataSet.Insert;

  dmCadastro.cdsClientDataSet.FieldByName('bdCODIGO').AsInteger     := prPessoa.wCódigo;
  dmCadastro.cdsClientDataSet.FieldByName('bdTIPOPESSOA').AsInteger := prPessoa.wTipoPessoa;
  dmCadastro.cdsClientDataSet.FieldByName('bdCPFCNPJ').AsString     := prPessoa.wCPFCNPJ;
  dmCadastro.cdsClientDataSet.FieldByName('bdNOME').AsString        := prPessoa.wNome;
  dmCadastro.cdsClientDataSet.FieldByName('bdENDERECO').AsString    := prPessoa.wEndereco;
  dmCadastro.cdsClientDataSet.FieldByName('bdISENTO').AsBoolean     := prPessoa.wIsento;
  dmCadastro.cdsClientDataSet.Post;
end;

end.
