unit uPEDSCI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TfrPEDSCI = class(TForm)
    mmPED: TMainMenu;
    mmAjuda: TMenuItem;
    mmSobre: TMenuItem;
    mmCadastros: TMenuItem;
    mmConsultas: TMenuItem;
    mmRelatorios: TMenuItem;
    mmCadEmpresas: TMenuItem;
    imFundo: TImage;
    mmConsEmpresas: TMenuItem;
    mmRelEmpresas: TMenuItem;
    mmCadClientes: TMenuItem;
    mmCadProdutos: TMenuItem;
    mmCadLancNotas: TMenuItem;
    mmConsClientes: TMenuItem;
    mmConsProdutos: TMenuItem;
    mmConsLancNotas: TMenuItem;
    mmRelLancNotas: TMenuItem;
    mmCadItensNotas: TMenuItem;
    mmConsItensNotas: TMenuItem;
    mmRelClientes: TMenuItem;
    mmRelProdutos: TMenuItem;
    procedure mmSobreClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmCadEmpresasClick(Sender: TObject);
    procedure mmCadClientesClick(Sender: TObject);
    procedure mmCadProdutosClick(Sender: TObject);
    procedure mmCadLancNotasClick(Sender: TObject);
    procedure mmConsEmpresasClick(Sender: TObject);
    procedure mmConsClientesClick(Sender: TObject);
    procedure mmConsProdutosClick(Sender: TObject);
    procedure mmConsLancNotasClick(Sender: TObject);
    procedure mmRelEmpresasClick(Sender: TObject);
    procedure mmRelLancNotasClick(Sender: TObject);
    procedure mmCadItensNotasClick(Sender: TObject);
    procedure mmConsItensNotasClick(Sender: TObject);
    procedure mmRelProdutosClick(Sender: TObject);
    procedure mmRelClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPEDSCI: TfrPEDSCI;

implementation

uses
  uUtilPEDSCI, uCadEmpresas, uCadClientes, uCadProdutos, uCadLancNotas,
  uConsEmpresas, uConsClientes, uConsProdutos, uConsLancNotas, uRelEmpresas,
  uRelLancNotas, uCadItensNotas, uConsItensNotas, uRelProdutos, uRelClientes;

{$R *.dfm}

procedure TfrPEDSCI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) and (MessageDlg('Deseja realmente sair do "' + Application.Title + '"?', mtInformation, [mbYes,mbNo], 0) = mrYes) then
     Application.Terminate;
end;

procedure TfrPEDSCI.mmCadClientesClick(Sender: TObject);
begin
  TfrCadClientes.Create(Self);
end;

procedure TfrPEDSCI.mmCadEmpresasClick(Sender: TObject);
begin
  TfrCadEmpresas.Create(Self);
end;

procedure TfrPEDSCI.mmCadItensNotasClick(Sender: TObject);
begin
  TfrCadItensNotas.Create(Self);
end;

procedure TfrPEDSCI.mmCadLancNotasClick(Sender: TObject);
begin
  TfrCadLancNotas.Create(Self);
end;

procedure TfrPEDSCI.mmCadProdutosClick(Sender: TObject);
begin
  TfrCadProdutos.Create(Self);
end;

procedure TfrPEDSCI.mmConsClientesClick(Sender: TObject);
begin
  TfrConsClientes.Create(Self);
end;

procedure TfrPEDSCI.mmConsEmpresasClick(Sender: TObject);
begin
  TfrConsEmpresas.Create(Self);
end;

procedure TfrPEDSCI.mmConsItensNotasClick(Sender: TObject);
begin
  TfrConsItensNotas.Create(Self);
end;

procedure TfrPEDSCI.mmConsLancNotasClick(Sender: TObject);
begin
  TfrConsLancNotas.Create(Self);
end;

procedure TfrPEDSCI.mmConsProdutosClick(Sender: TObject);
begin
  TfrConsProdutos.Create(Self);
end;

procedure TfrPEDSCI.mmRelClientesClick(Sender: TObject);
begin
  TfrRelClientes.Create(Self);
end;

procedure TfrPEDSCI.mmRelEmpresasClick(Sender: TObject);
begin
  TfrRelEmpresas.Create(Self);
end;

procedure TfrPEDSCI.mmRelLancNotasClick(Sender: TObject);
begin
  TfrRelLancNotas.Create(Self);
end;

procedure TfrPEDSCI.mmRelProdutosClick(Sender: TObject);
begin
  TfrRelProdutos.Create(Self);
end;

procedure TfrPEDSCI.mmSobreClick(Sender: TObject);
begin
  MessageDlg('PED-Projeto Estagio Desenvolvedor.' +#13#13 + 'Desenvolvido pela SCI.', mtInformation, [mbOK], 0);
end;

end.
