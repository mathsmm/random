inherited frCadEmpresas: TfrCadEmpresas
  Caption = 'Cadastro de empresas'
  ClientHeight = 210
  ClientWidth = 416
  ExplicitWidth = 432
  ExplicitHeight = 249
  PixelsPerInch = 96
  TextHeight = 13
  object lbCODEMP: TLabel [0]
    Left = 35
    Top = 52
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lbNOMEEMP: TLabel [1]
    Left = 41
    Top = 106
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lbCNPJCPFEMP: TLabel [2]
    Left = 20
    Top = 79
    Width = 52
    Height = 13
    Caption = 'CPF/CNPJ:'
  end
  object lbCODUFEMP: TLabel [3]
    Left = 55
    Top = 133
    Width = 17
    Height = 13
    Caption = 'UF:'
  end
  object lbTELEFONEEMP: TLabel [4]
    Left = 26
    Top = 160
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object lbStatus: TLabel [5]
    Left = 8
    Top = 189
    Width = 226
    Height = 13
    Caption = 'Aguardando preenchimento do campo "C'#243'digo"'
  end
  inherited tbFerramentas: TToolBar
    Width = 416
    ExplicitWidth = 416
    inherited btConsultar: TToolButton
      OnClick = btConsultarClick
    end
  end
  object edCODEMP: TEdit [7]
    Left = 78
    Top = 49
    Width = 62
    Height = 21
    TabOrder = 1
    OnChange = edCODEMPChange
    OnExit = edCODEMPExit
  end
  object edNOMEEMP: TEdit [8]
    Left = 78
    Top = 103
    Width = 243
    Height = 21
    TabOrder = 3
  end
  object edCNPJCPFEMP: TEdit [9]
    Left = 78
    Top = 76
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object edTELEFONEEMP: TEdit [10]
    Left = 78
    Top = 157
    Width = 147
    Height = 21
    TabOrder = 5
  end
  object cbCODUFEMP: TComboBox [11]
    Left = 78
    Top = 130
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 4
  end
  inherited imBotoes: TImageList
    Left = 344
  end
  inherited imBotoesSelecionados: TImageList
    Left = 344
  end
  inherited imBotoesDesabilitados: TImageList
    Left = 344
  end
  object SQLQueryMaiorCodigo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 256
    Top = 40
  end
end
