inherited frCadProdutos: TfrCadProdutos
  Caption = 'Cadastro de produtos'
  ClientHeight = 189
  ClientWidth = 411
  ExplicitWidth = 427
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  object lbCODPROD: TLabel [0]
    Left = 35
    Top = 52
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lbNOMEPROD: TLabel [1]
    Left = 22
    Top = 79
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object lbNCMPROD: TLabel [2]
    Left = 46
    Top = 106
    Width = 26
    Height = 13
    Caption = 'NCM:'
  end
  object lbValor: TLabel [3]
    Left = 44
    Top = 133
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object lbStatus: TLabel [4]
    Left = 8
    Top = 168
    Width = 226
    Height = 13
    Caption = 'Aguardando preenchimento do campo "C'#243'digo"'
  end
  inherited tbFerramentas: TToolBar
    Width = 411
    ExplicitWidth = 411
    inherited btConsultar: TToolButton
      OnClick = btConsultarClick
    end
  end
  object edCODPROD: TEdit [6]
    Left = 78
    Top = 49
    Width = 62
    Height = 21
    TabOrder = 1
    OnChange = edCODPRODChange
    OnExit = edCODPRODExit
  end
  object edDESCPROD: TEdit [7]
    Left = 78
    Top = 76
    Width = 243
    Height = 21
    TabOrder = 2
  end
  object edNCMPROD: TEdit [8]
    Left = 78
    Top = 103
    Width = 145
    Height = 21
    TabOrder = 3
  end
  object edValor: TEdit [9]
    Left = 78
    Top = 130
    Width = 145
    Height = 21
    TabOrder = 4
  end
  inherited imBotoes: TImageList
    Left = 336
  end
  inherited imBotoesSelecionados: TImageList
    Left = 336
  end
  inherited imBotoesDesabilitados: TImageList
    Left = 336
  end
  object SQLQueryMaiorCodigo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 256
    Top = 40
  end
end
