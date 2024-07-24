unit uProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    lbNome: TLabel;
    lbEndereco: TLabel;
    lbCpfCnpj: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    edEndereco: TEdit;
    edCpfCnpj: TEdit;
    cbTipoPessoa: TComboBox;
    ckIsento: TCheckBox;
    btSalvar: TButton;
    btExcluir: TButton;
    btExportar: TButton;
    DBGrid1: TDBGrid;
    dsCadastro: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure cbTipoPessoaSelect(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edCpfCnpjChange(Sender: TObject);
  private
    { Private declarations }
    cdsClientDataSet : TClientDataSet;

    procedure pCarregarDataClient;
    procedure pOrdenarCDSPorCodigo;
    procedure pOrdenarCDSPorNome;
    procedure pSalvarRegistro;
    procedure pExportar;

    procedure pCarregarCampos;
    procedure pVerificarBotoes;
    procedure pSetFocusCodigo;

    function fDiretorio : String;
    function fRetornarInformacoesRegistroAtual : String;
    function fVerificarValidadeCPF(prCPF : String) : Boolean;
    function fVerificarValidadeCNPJ(prCNPJ : String) : Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.btExcluirClick(Sender: TObject);
begin
  pOrdenarCDSPorCodigo;

  if cdsClientDataSet.FindKey([edCodigo.Text]) then
     cdsClientDataSet.Delete;

  pVerificarBotoes;
  pSetFocusCodigo;
end;

procedure TForm1.btExportarClick(Sender: TObject);
begin
  pExportar;
end;

procedure TForm1.btSalvarClick(Sender: TObject);
begin
  if cbTipoPessoa.ItemIndex = 0 then
     begin
       if not fVerificarValidadeCPF(edCpfCnpj.Text) then
          begin
            ShowMessage('O CPF informado é inválido!');
            exit;
          end
     end
     
  else if cbTipoPessoa.ItemIndex = 1 then
     begin
       if not fVerificarValidadeCNPJ(edCpfCnpj.Text) then
          begin
            ShowMessage('O CNPJ informado é inválido!');
           exit;
          end;
     end;
     
  pSalvarRegistro;
  pVerificarBotoes;
  pSetFocusCodigo;
end;

procedure TForm1.cbTipoPessoaSelect(Sender: TObject);
begin
  if cbTipoPessoa.ItemIndex = 0 then
     begin
       ckIsento.Enabled := False;
       ckIsento.Checked := False;
       lbCpfCnpj.Caption := 'CPF';
       edCpfCnpj.TextHint := 'Insira o CPF';
     end
  else if cbTipoPessoa.ItemIndex = 1 then
     begin
       ckIsento.Enabled := True;
       lbCpfCnpj.Caption := 'CNPJ';
       edCpfCnpj.TextHint := 'Insira o CNPJ';
     end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  if Column.FieldName = 'bdCODIGO' then
     pOrdenarCDSPorCodigo
  else if Column.FieldName = 'bdNOME' then
     pOrdenarCDSPorNome;
end;

procedure TForm1.edCodigoExit(Sender: TObject);
begin
  pCarregarCampos;
  pVerificarBotoes;
end;

procedure TForm1.edCpfCnpjChange(Sender: TObject);
begin
  if cbTipoPessoa.ItemIndex = 0 then
     begin
       if Length(edCpfCnpj.Text) <> 11 then
          btSalvar.Enabled := False
       else
          btSalvar.Enabled := True;
     end
  else if cbTipoPessoa.ItemIndex = 1 then
     begin
       if Length(edCpfCnpj.Text) <> 14 then
          btSalvar.Enabled := False
       else
          btSalvar.Enabled := True;
     end;
end;

function TForm1.fDiretorio: String;
begin
  Result := 'C:\Users\prog27\Desktop\delphi-classes\aula04\Projeto1\Arquivo';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pCarregarDataClient;
  dsCadastro.DataSet := cdsClientDataSet;
end;

function TForm1.fRetornarInformacoesRegistroAtual: String;
var
  wStrTipoPessoa : String;
  wStrIsento : String;
begin
  wStrTipoPessoa := 'Física';
  if cdsClientDataSet.FieldByName('bdTIPOPESSOA').AsInteger = 1 then
     wStrTipoPessoa := 'Jurídica';

  wStrIsento := 'Não';
  if cdsClientDataSet.FieldByName('bdISENTO').AsBoolean then
     wStrIsento := 'Sim';

  Result := 'Código: '   + cdsClientDataSet.FieldByName('bdCODIGO').AsString   + ' | ' +
            'Pessoa: '   + wStrTipoPessoa                                      + ' | ' +
            'CPF/CNPJ: ' + cdsClientDataSet.FieldByName('bdCPFCNPJ').AsString  + ' | ' +
            'Nome: '     + cdsClientDataSet.FieldByName('bdNOME').AsString     + ' | ' +
            'Endereço: ' + cdsClientDataSet.FieldByName('bdENDERECO').AsString + ' | ' +
            'Isento: '   + wStrIsento;
end;

function TForm1.fVerificarValidadeCNPJ(prCNPJ: String): Boolean;
var
  wI, wJ : Integer;
  wStrDigitoAtual : String;
  
  wCNPJResultante : String;

  wSomaPenultimoDigito : Integer;
  wRestoPenultimoDigito : Integer;
  wPenultimoDigito : Integer;

  wSomaUltimoDigito : Integer;
  wRestoUltimoDigito : Integer;
  wUltimoDigito : Integer;
begin
  //Cálculo do penúltimo dígito do CNPJ
  wSomaPenultimoDigito := 0;
  wI := 1;
  wJ := 5;
  while wI <= 12 do
    begin
      wStrDigitoAtual := prCNPJ[wI];
      wCNPJResultante := wCNPJResultante + wStrDigitoAtual;
      wSomaPenultimoDigito := wSomaPenultimoDigito + 
                              (StrToInt(wStrDigitoAtual) * wJ);
    
      if wJ = 2 then
         wJ := 10;
    
      wI := wI + 1;
      wJ := wJ - 1;
    end;

  wRestoPenultimoDigito := wSomaPenultimoDigito MOD 11;

  if wRestoPenultimoDigito < 2 then
     wPenultimoDigito := 0
  else
     wPenultimoDigito := 11 - wRestoPenultimoDigito;

  //Cálculo do último dígito do CNPJ
  wCNPJResultante := wCNPJResultante + IntToStr(wPenultimoDigito);
  
  wSomaUltimoDigito := 0;
  wI := 1;
  wJ := 6;
  while wI <= 13 do
    begin
      wSomaUltimoDigito := wSomaUltimoDigito + 
                           (StrToInt(wCNPJResultante[wI]) * wJ);
    
      if wJ = 2 then
         wJ := 10;
    
      wI := wI + 1;
      wJ := wJ - 1;
    end;

  wRestoUltimoDigito := wSomaUltimoDigito MOD 11;

  if wRestoUltimoDigito < 2 then
     wUltimoDigito := 0
  else
     wUltimoDigito := 11 - wRestoUltimoDigito;

  wCNPJResultante := wCNPJResultante + IntToStr(wUltimoDigito);

  Result := False;
  if wCNPJResultante = prCNPJ then
     Result := True;  
end;

function TForm1.fVerificarValidadeCPF(prCPF: String): Boolean;
var
  wI, wJ : Integer;
  wStrDigitoAtual : String;
  
  wSomaPenultimoDigito : Integer;
  wRestoPenultimoDigito : Integer;
  wPenultimoDigito : Integer;
  
  wSomaUltimoDigito : Integer;
  wRestoUltimoDigito : Integer;
  wUltimoDigito : Integer;

  wCPFResultante : String;
begin
  //Cálculo do penúltimo dígito do CPF
  wSomaPenultimoDigito := 0;
  wI := 1;
  wJ := 10;
  while wI <= 9 do
    begin
      wStrDigitoAtual := prCPF[wI];
      wCPFResultante := wCPFResultante + wStrDigitoAtual;
      wSomaPenultimoDigito := wSomaPenultimoDigito + 
                              (StrToInt(wStrDigitoAtual) * wJ);

      wI := wI + 1;                        
      wJ := wJ - 1;
    end;
    
  wRestoPenultimoDigito :=  wSomaPenultimoDigito MOD 11;

  if wRestoPenultimoDigito < 2 then
     wPenultimoDigito := 0
  else
     wPenultimoDigito := 11 - wRestoPenultimoDigito;

  //Cálculo do último dígito do CPF
  wCPFResultante := wCPFResultante + IntToStr(wPenultimoDigito);
  
  wSomaUltimoDigito := 0;
  wI := 1;
  wJ := 11;
  while wI <= 10 do
    begin
      wSomaUltimoDigito := wSomaUltimoDigito + 
                           (StrToInt(wCPFResultante[wI]) * wJ);

      wI := wI + 1;                        
      wJ := wJ - 1;
    end;
  
  wRestoUltimoDigito := wSomaUltimoDigito MOD 11;

  if wRestoUltimoDigito < 2 then
     wUltimoDigito := 0
  else
     wUltimoDigito := 11 - wRestoUltimoDigito;

  wCPFResultante := wCPFResultante + IntToStr(wUltimoDigito);

  Result := False;
  if wCPFResultante = prCPF then
     Result := True
end;

procedure TForm1.pCarregarCampos;
begin
  pOrdenarCDSPorCodigo;

  if cdsClientDataSet.FindKey([edCodigo.Text]) then
     begin
       cbTipoPessoa.ItemIndex := cdsClientDataSet.FieldByName('bdTIPOPESSOA').AsInteger;
       edCpfCnpj.text         := cdsClientDataSet.FieldByName('bdCPFCNPJ').AsString;
       edNome.Text            := cdsClientDataSet.FieldByName('bdNOME').AsString;
       edEndereco.Text        := cdsClientDataSet.FieldByName('bdENDERECO').AsString;
       ckIsento.Checked       := cdsClientDataSet.FieldByName('bdISENTO').AsBoolean;
     end;
end;

procedure TForm1.pCarregarDataClient;
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

procedure TForm1.pExportar;
var
  wStringList : TStringList;
begin
  wStringList := TStringList.Create;

  cdsClientDataSet.First;
  while not cdsClientDataSet.Eof do
    begin
      wStringList.Add(fRetornarInformacoesRegistroAtual);

      cdsClientDataSet.Next;
    end;

  if not DirectoryExists(fDiretorio) then
     ForceDirectories(fDiretorio);

  wStringList.SaveToFile(fDiretorio + '\Cadastros.txt');
  wStringList.Clear;
end;

procedure TForm1.pOrdenarCDSPorCodigo;
begin
  cdsClientDataSet.IndexFieldNames := 'bdCODIGO';
end;

procedure TForm1.pOrdenarCDSPorNome;
begin
  cdsClientDataSet.IndexFieldNames := 'bdNOME';
end;

procedure TForm1.pSalvarRegistro;
begin
  pOrdenarCDSPorCodigo;

  if cdsClientDataSet.FindKey([edCodigo.Text]) then
     cdsClientDataSet.Edit
  else
     cdsClientDataSet.Insert;

  cdsClientDataSet.FieldByName('bdCODIGO').AsInteger     := StrToInt(edCodigo.Text);
  cdsClientDataSet.FieldByName('bdTIPOPESSOA').AsInteger := cbTipoPessoa.ItemIndex;
  cdsClientDataSet.FieldByName('bdCPFCNPJ').AsString     := edCpfCnpj.Text;
  cdsClientDataSet.FieldByName('bdNOME').AsString        := edNome.Text;
  cdsClientDataSet.FieldByName('bdENDERECO').AsString    := edEndereco.Text;
  cdsClientDataSet.FieldByName('bdISENTO').AsBoolean     := ckIsento.Checked;
  cdsClientDataSet.Post;
end;

procedure TForm1.pSetFocusCodigo;
begin
  edCodigo.SetFocus;
end;

procedure TForm1.pVerificarBotoes;
begin
  if cdsClientDataSet.FindKey([edCodigo.Text]) then
     begin
       btSalvar.Caption := 'Editar';
       btExcluir.Enabled := True;
     end
  else
     begin
       btSalvar.Caption := 'Salvar';
       btExcluir.Enabled := False;
     end;
end;

end.
