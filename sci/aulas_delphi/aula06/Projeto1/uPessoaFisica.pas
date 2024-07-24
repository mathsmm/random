unit uPessoaFisica;

interface

uses
  uPessoa;

type
  TPessoaFisica = class(TPessoa)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pTipoPessoa; Override;
  end;

implementation

uses
  uDataModule;

{ TPessoaFisica }

procedure TPessoaFisica.pTipoPessoa;
begin
  //inherited;
  wTipoPessoa := 0;
end;

end.
