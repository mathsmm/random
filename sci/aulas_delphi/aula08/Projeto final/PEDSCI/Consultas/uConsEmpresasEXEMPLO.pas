unit uConsEmpresasEXEMPLO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadraoConsultaPEDSCI, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, Datasnap.DBClient;

type
  TfrConsEmpresasEXEMPLO = class(TfrFormPadraoConsultaPEDSCI)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela: TClientDataSet; override;
  end;

var
  frConsEmpresasEXEMPLO: TfrConsEmpresasEXEMPLO;

implementation

{$R *.dfm}

uses udmDadosPEDSCI;

{ TfrConsEmpresas }

function TfrConsEmpresasEXEMPLO.setTabela: TClientDataSet;
begin
  Result := dmDadosPEDSCI.tbEmpresas;
end;

end.
