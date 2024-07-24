unit uUtilPEDSCI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Datasnap.DBClient;

type
  TUtilPEDSCI = class
  public
    class function PodeExcluir: Boolean;
    { procedures }
    procedure pAbrirTelaCadEmpresas;
    { functions }
    function fRetornarListaUFs : TStringList;
    function fVerificarStringNumerica(prString : String) : Boolean;
    function fVerificarCampoCodigo(prCampoCodigo : String;
                                   out prOutCodigo : Integer;
                                   prMostrarMensagem : Boolean) : Boolean;
    function fVerificarValidadeCPF(prCPF : String) : Boolean;
    function fVerificarValidadeCNPJ(prCNPJ : String) : Boolean;
    function fVerificarCampoCNPJCPF(prCampoCNPJCPF : String; prMostrarMensagem : Boolean) : Boolean;
    function fRetornarStatus(prNumStatus : Integer) : String;
  end;

implementation

uses
  uCadEmpresas, udmDadosPEDSCI, System.Generics.Collections;

{ TUtilPEDSCI }

procedure TUtilPEDSCI.pAbrirTelaCadEmpresas;
var
  wfrCadEmpresas : TfrCadEmpresas;
begin
  wfrCadEmpresas := TfrCadEmpresas.Create(nil);
  wfrCadEmpresas.Show;
end;

class function TUtilPEDSCI.PodeExcluir: Boolean;
begin
  Result := MessageDlg('Deseja realmente excluir esse registro?', mtWarning, [mbYes,mbNo], 0) = mrYes;
end;

function TUtilPEDSCI.fRetornarListaUFs: TStringList;
var
  wStringList : TStringList;
  wRegistroAtual : String;
begin
  wStringList := TStringList.Create;

  dmDadosPEDSCI.tbUF.First;
  while not dmDadosPEDSCI.tbUF.Eof do
    begin
      wRegistroAtual := dmDadosPEDSCI.tbUF.FieldByName('BDNOMEUF').AsString;

      if wRegistroAtual <> '' then
         wStringList.Add(wRegistroAtual);

      dmDadosPEDSCI.tbUF.Next;
    end;

    Result := wStringList;
end;

function TUtilPEDSCI.fVerificarStringNumerica(prString: String): Boolean;
var
  wI : Integer;
  wInteiroAuxiliar : Integer;
begin
  Result := True;

  wI := 1;
  while wi <= Length(prString) do
    begin
      if not TryStrToInt(prString[wI], wInteiroAuxiliar) then
         begin
           Result := False;
           exit;
         end;

      wi := wi + 1;
    end;
end;

function TUtilPEDSCI.fVerificarValidadeCNPJ(prCNPJ: String): Boolean;
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

function TUtilPEDSCI.fRetornarStatus(prNumStatus: Integer): String;
var
  wDict : TDictionary<Integer, String>;
begin
  wDict := TDictionary<Integer, String>.Create;
  wDict.Add(0, 'Aguardando preenchimento do campo "Código"');
  wDict.Add(1, 'Adicionando registro');
  wDict.Add(2, 'Editando registro');
  Result := wDict[prNumStatus];
end;

function TUtilPEDSCI.fVerificarCampoCNPJCPF(prCampoCNPJCPF: String; prMostrarMensagem : Boolean): Boolean;
var
  wLenEdCNPJCPF : Integer;
  wEdCNPJCPFNumerico : Boolean;
begin
  Result := True;

  wLenEdCNPJCPF := Length(prCampoCNPJCPF);
  wEdCNPJCPFNumerico := fVerificarStringNumerica(prCampoCNPJCPF);

  if (wEdCNPJCPFNumerico) and (wLenEdCNPJCPF = 11) then
     begin
       if not fVerificarValidadeCPF(prCampoCNPJCPF) then
          begin
            Result := False;
            if prMostrarMensagem then
               ShowMessage('O CPF informado é inválido.');
            exit;
          end;
     end
  else if (wEdCNPJCPFNumerico) and (wLenEdCNPJCPF = 14) then
     begin
       if not fVerificarValidadeCNPJ(prCampoCNPJCPF) then
          begin
            Result := False;
            if prMostrarMensagem then
               ShowMessage('O CNPJ informado é inválido.');
            exit;
          end;
     end
  else
     begin
       Result := False;
       if prMostrarMensagem then
          ShowMessage('O CPF/CNPJ informado é inválido.');
       exit;
     end;
end;

function TUtilPEDSCI.fVerificarCampoCodigo(prCampoCodigo: String;
  out prOutCodigo: Integer; prMostrarMensagem: Boolean): Boolean;
begin
  Result := True;

  if not TryStrToInt(prCampoCodigo, prOutCodigo) then
     begin
       Result := False;

       if prMostrarMensagem then
          ShowMessage('O código informado é inválido.');
     end;
end;

function TUtilPEDSCI.fVerificarValidadeCPF(prCPF: String): Boolean;
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


end.
