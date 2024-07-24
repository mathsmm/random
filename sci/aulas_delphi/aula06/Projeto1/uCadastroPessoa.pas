unit uCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Datasnap.DBClient, uDataModule, uConsultaPessoa,
  uCadastroPai, Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.Character;

type
  TfrTelaCadastroPessoa = class(TfrTelaCadastroPai)
    lbNomePessoa: TLabel;
    lbEnderecoPessoa: TLabel;
    lbCpfCnpjPessoa: TLabel;
    edNomePessoa: TEdit;
    edEnderecoPessoa: TEdit;
    edCpfCnpjPessoa: TEdit;
    cbTipoPessoa: TComboBox;
    ckIsentoPessoa: TCheckBox;
    btSalvar: TButton;
    btExcluir: TButton;
    btExportar: TButton;
    btConsultar: TButton;
    imCPFCNPJ: TImage;
    procedure btSalvarClick(Sender: TObject);
    procedure cbTipoPessoaSelect(Sender: TObject);
    procedure edCodigoExit(Sender: TObject); Override;
    procedure btExcluirClick(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure edCpfCnpjPessoaChange(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure edCodigoChange(Sender: TObject); Override;
  private
    { Private declarations }
    procedure pSalvarRegistro;
    procedure pExcluirRegistro;
    procedure pExportar;

    procedure pCarregarCampos;
    procedure pVerificarComponentes;
    procedure pSetFocusCodigo;

    function fDiretorio : String;
    function fDiretorioCloseMark : String;
    function fDiretorioCheckMark : String;
    function fRetornarInformacoesRegistroAtual : String;
    function fVerificarValidadeCPF(prCPF : String) : Boolean;
    function fVerificarValidadeCNPJ(prCNPJ : String) : Boolean;
    function fVerificarCaracteresCPFCNPJ : Boolean;
    function fVerificarCaracteresCodigo : Boolean; Override;
    function fVerificarCampoCodigo : Boolean; Override;
  public
    { Public declarations }
  end;

var
  frTelaCadastroPessoa: TfrTelaCadastroPessoa;

implementation

uses
  uPessoa, uPessoaFisica, uPessoaJuridica;

{$R *.dfm}

{ TForm1 }

procedure TfrTelaCadastroPessoa.btConsultarClick(Sender: TObject);
var
  wTelaConsultaPessoa : TfrTelaConsultaPessoa;
begin
  wTelaConsultaPessoa := TfrTelaConsultaPessoa.Create(Self);
  wTelaConsultaPessoa.Show;
end;

procedure TfrTelaCadastroPessoa.btExcluirClick(Sender: TObject);
begin
  pExcluirRegistro;
  pVerificarComponentes;
  pSetFocusCodigo;
end;

procedure TfrTelaCadastroPessoa.btExportarClick(Sender: TObject);
begin
  pExportar;
end;

procedure TfrTelaCadastroPessoa.btSalvarClick(Sender: TObject);
begin
  if cbTipoPessoa.ItemIndex = 0 then
     begin
       if not fVerificarValidadeCPF(edCpfCnpjPessoa.Text) then
          begin
            ShowMessage('O CPF informado é inválido!');
            exit;
          end
     end
     
  else if cbTipoPessoa.ItemIndex = 1 then
     begin
       if not fVerificarValidadeCNPJ(edCpfCnpjPessoa.Text) then
          begin
            ShowMessage('O CNPJ informado é inválido!');
            exit;
          end;
     end;
     
  pSalvarRegistro;
  pVerificarComponentes;
  pSetFocusCodigo;
end;

procedure TfrTelaCadastroPessoa.cbTipoPessoaSelect(Sender: TObject);
begin
  if cbTipoPessoa.ItemIndex = 0 then
     begin
       ckIsentoPessoa.Enabled := False;
       ckIsentoPessoa.Checked := False;
       lbCpfCnpjPessoa.Caption := 'CPF';
       edCpfCnpjPessoa.TextHint := 'Insira o CPF';
     end
  else if cbTipoPessoa.ItemIndex = 1 then
     begin
       ckIsentoPessoa.Enabled := True;
       lbCpfCnpjPessoa.Caption := 'CNPJ';
       edCpfCnpjPessoa.TextHint := 'Insira o CNPJ';
     end;

  pVerificarComponentes;
end;

procedure TfrTelaCadastroPessoa.edCodigoChange(Sender: TObject);
begin
  pVerificarComponentes;
end;

procedure TfrTelaCadastroPessoa.edCodigoExit(Sender: TObject);
begin
  pCarregarCampos;
  //pVerificarComponentes;
end;

procedure TfrTelaCadastroPessoa.edCpfCnpjPessoaChange(Sender: TObject);
begin
  pVerificarComponentes;
end;

function TfrTelaCadastroPessoa.fDiretorio: String;
begin
  Result := 'C:\Users\prog27\Desktop\delphi-classes\aula04\Projeto1\Arquivo';
end;

function TfrTelaCadastroPessoa.fDiretorioCheckMark: String;
begin
  Result := 'C:\Users\prog27\Desktop\sci\aulas_delphi\aula06\Projeto1\Image\check-mark.png';
end;

function TfrTelaCadastroPessoa.fDiretorioCloseMark: String;
begin
  Result := 'C:\Users\prog27\Desktop\sci\aulas_delphi\aula06\Projeto1\Image\close.png';
end;

function TfrTelaCadastroPessoa.fRetornarInformacoesRegistroAtual: String;
var
  wStrTipoPessoa : String;
  wStrIsento : String;
begin
  wStrTipoPessoa := 'Física';
  if dmCadastro.cdsClientDataSet.FieldByName('bdTIPOPESSOA').AsInteger = 1 then
     wStrTipoPessoa := 'Jurídica';

  wStrIsento := 'Não';
  if dmCadastro.cdsClientDataSet.FieldByName('bdISENTO').AsBoolean then
     wStrIsento := 'Sim';

  Result := 'Código: '   + dmCadastro.cdsClientDataSet.FieldByName('bdCODIGO').AsString   + ' | ' +
            'Pessoa: '   + wStrTipoPessoa                                      + ' | ' +
            'CPF/CNPJ: ' + dmCadastro.cdsClientDataSet.FieldByName('bdCPFCNPJ').AsString  + ' | ' +
            'Nome: '     + dmCadastro.cdsClientDataSet.FieldByName('bdNOME').AsString     + ' | ' +
            'Endereço: ' + dmCadastro.cdsClientDataSet.FieldByName('bdENDERECO').AsString + ' | ' +
            'Isento: '   + wStrIsento;
end;

function TfrTelaCadastroPessoa.fVerificarCampoCodigo: Boolean;
var
  wI : Integer;
begin
  if edCodigo.Text = '' then
     Result := False;

  Result := True;
  wI := 1;
  while wI <= Length(edCodigo.Text) do
    begin
      if not IsNumber(edCodigo.Text[wI]) then
         begin
           Result := False;
           exit;
         end;
      wI := wI + 1;
    end;
end;

function TfrTelaCadastroPessoa.fVerificarCaracteresCodigo: Boolean;
var
  wLengthEdit : Integer;
  wI : Integer;
  wOrdCaractereAtual : Integer;
begin
  Result := True;
  
  wLengthEdit := Length(edCodigo.Text);

  if wLengthEdit = 0 then
     begin
       Result := False;
       exit;
     end;
  
  wI := 1;
  while wI <= wLengthEdit do
    begin
      wOrdCaractereAtual := Ord(edCodigo.Text[wI]);
      if (wOrdCaractereAtual < 48) or (wOrdCaractereAtual > 57) then
         begin
           Result := False;
           exit;
         end;

      wI := wI + 1;
    end;
end;

function TfrTelaCadastroPessoa.fVerificarCaracteresCPFCNPJ : Boolean;
var
  wLengthEdit : Integer;
  wI : Integer;
  wOrdCaractereAtual : Integer;
begin
  Result := True;

  wLengthEdit := Length(edCpfCnpjPessoa.Text);

  if wLengthEdit = 0 then
     begin
       Result := False;
       exit;
     end;
 
  wI := 1;
  while wI <= wLengthEdit do
    begin
      wOrdCaractereAtual := Ord((edCpfCnpjPessoa.Text)[wI]);
      if (wOrdCaractereAtual < 45) or (wOrdCaractereAtual > 57) then
         begin
           Result := False;
           exit;
         end;

      wI := wI + 1;
    end;
end;

function TfrTelaCadastroPessoa.fVerificarValidadeCNPJ(prCNPJ: String): Boolean;
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

function TfrTelaCadastroPessoa.fVerificarValidadeCPF(prCPF: String): Boolean;
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

procedure TfrTelaCadastroPessoa.pCarregarCampos;
begin
  dmCadastro.pOrdenarCDSPorCodigo;

  if not fVerificarCampoCodigo then
     exit;
  
  if dmCadastro.cdsClientDataSet.FindKey([edCodigo.Text]) then
     begin
       cbTipoPessoa.ItemIndex := dmCadastro.cdsClientDataSet.FieldByName('bdTIPOPESSOA').AsInteger;
       edCpfCnpjPessoa.text   := dmCadastro.cdsClientDataSet.FieldByName('bdCPFCNPJ').AsString;
       edNomePessoa.Text      := dmCadastro.cdsClientDataSet.FieldByName('bdNOME').AsString;
       edEnderecoPessoa.Text  := dmCadastro.cdsClientDataSet.FieldByName('bdENDERECO').AsString;
       ckIsentoPessoa.Checked := dmCadastro.cdsClientDataSet.FieldByName('bdISENTO').AsBoolean;
     end;
end;

procedure TfrTelaCadastroPessoa.pExcluirRegistro;
var
  wPessoa : TPessoa;
begin
  wPessoa := TPessoa.Create;

  dmCadastro.pOrdenarCDSPorCodigo;
  wPessoa.pExcluirPessoa(StrToInt(edCodigo.Text));
end;

procedure TfrTelaCadastroPessoa.pExportar;
var
  wStringList : TStringList;
begin
  wStringList := TStringList.Create;

  dmCadastro.cdsClientDataSet.First;
  while not dmCadastro.cdsClientDataSet.Eof do
    begin
      wStringList.Add(fRetornarInformacoesRegistroAtual);

      dmCadastro.cdsClientDataSet.Next;
    end;

  if not DirectoryExists(fDiretorio) then
     ForceDirectories(fDiretorio);

  wStringList.SaveToFile(fDiretorio + '\Cadastros.txt');
  wStringList.Clear;
end;

procedure TfrTelaCadastroPessoa.pSalvarRegistro;
var
  wPessoa         : TPessoa;
  wPessoaFisica   : TPessoaFisica;
  wPessoaJuridica : TPessoaJuridica;
begin
  wPessoa         := TPessoa.Create;
  wPessoaFisica   := TPessoaFisica.Create;
  wPessoaJuridica := TPessoaJuridica.Create;

  if cbTipoPessoa.ItemIndex = 0 then
     wPessoaFisica.pTipoPessoa
  else if cbTipoPessoa.ItemIndex = 1 then
     wPessoaJuridica.pTipoPessoa;

  wPessoa.wCódigo     := StrToInt(edCodigo.Text);
  wPessoa.wCPFCNPJ    := edCpfCnpjPessoa.Text;
  wPessoa.wNome       := edNomePessoa.Text;
  wPessoa.wEndereco   := edEnderecoPessoa.Text;
  wPessoa.wIsento     := ckIsentoPessoa.Enabled;

  wPessoa.pSalvarPessoa(wPessoa);
end;

procedure TfrTelaCadastroPessoa.pSetFocusCodigo;
begin
  edCodigo.SetFocus;
end;

procedure TfrTelaCadastroPessoa.pVerificarComponentes;
var
  wI : Integer;
begin
  dmCadastro.pOrdenarCDSPorCodigo;

  //Verifica o tamanho do campo edCPFCNPJ e também
  //se há somente números, ponto, barra e hífen
  if cbTipoPessoa.ItemIndex = 0 then
     begin
       if (Length(edCpfCnpjPessoa.Text) <> 11) or not
          (fVerificarCaracteresCPFCNPJ) then
          begin
            btSalvar.Enabled := False;
            imCPFCNPJ.Picture.LoadFromFile(fDiretorioCloseMark);
          end
       else
          begin
            btSalvar.Enabled := True;
            imCPFCNPJ.Picture.LoadFromFile(fDiretorioCheckMark);
          end;
     end
  else if cbTipoPessoa.ItemIndex = 1 then
     begin
       if (Length(edCpfCnpjPessoa.Text) <> 14) or not
          (fVerificarCaracteresCPFCNPJ) then
          begin
            btSalvar.Enabled := False;
            imCPFCNPJ.Picture.LoadFromFile(fDiretorioCloseMark);
          end
       else
          begin
            btSalvar.Enabled := True;
            imCPFCNPJ.Picture.LoadFromFile(fDiretorioCheckMark);
          end;
     end;

  //Verifica se há somente números no edCodigo   
  if not fVerificarCaracteresCodigo then
     begin
       btSalvar.Enabled := False;
       btExcluir.Enabled := False;
       imCodigo.Picture.LoadFromFile(fDiretorioCloseMark);
       exit;
     end
  else
     begin
       imCodigo.Picture.LoadFromFile(fDiretorioCheckMark);
     end;
     
  //Verifica se o código no edCodigo existe no ClientDataSet
  if {(not fVerificarCampoCodigo) and}
     (dmCadastro.cdsClientDataSet.FindKey([edCodigo.Text])) then
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
