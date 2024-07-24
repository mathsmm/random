inherited frRelEmpresas: TfrRelEmpresas
  Caption = 'Relat'#243'rio de empresas'
  ClientHeight = 99
  ClientWidth = 285
  ExplicitWidth = 301
  ExplicitHeight = 138
  PixelsPerInch = 96
  TextHeight = 13
  object lbOBS1: TLabel [0]
    Left = 8
    Top = 36
    Width = 224
    Height = 13
    Caption = '*Sem filtros. Todos os registros s'#227'o mostrados'
  end
  inherited tbFerramentas: TToolBar
    Width = 285
    ExplicitWidth = 328
  end
  inherited frxReportLayout: TfrxReport
    ScriptText.Strings = ()
  end
  inherited frxDBDatasetPadrao: TfrxDBDataset
    DataSet = SQLQueryPadrao
  end
end
