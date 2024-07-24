unit uPessoaJuridica;

interface

uses
  uPessoa;

type
  TPessoaJuridica = class(TPessoa)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pTipoPessoa; Override;
  end;

implementation

uses
  uDataModule;

{ TPessoaJuridica }

procedure TPessoaJuridica.pTipoPessoa;
begin
  //inherited;
  wTipoPessoa := 1;
end;

end.
