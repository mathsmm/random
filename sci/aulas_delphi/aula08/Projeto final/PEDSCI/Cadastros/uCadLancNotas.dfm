inherited frCadLancNotas: TfrCadLancNotas
  Caption = 'Cadastro de lan'#231'amentos de notas'
  ClientHeight = 184
  ClientWidth = 449
  ExplicitWidth = 465
  ExplicitHeight = 223
  PixelsPerInch = 96
  TextHeight = 13
  object lbCODNOTA: TLabel [0]
    Left = 54
    Top = 49
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object lbCODEMPNOTA: TLabel [1]
    Left = 46
    Top = 103
    Width = 45
    Height = 13
    Caption = 'Empresa:'
  end
  object lbCODCLINOTA: TLabel [2]
    Left = 54
    Top = 76
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  object lbDATAEMISSAONOTA: TLabel [3]
    Left = 8
    Top = 130
    Width = 83
    Height = 13
    Caption = 'Data de emiss'#227'o:'
  end
  object lbVLRNOTA: TLabel [4]
    Left = 63
    Top = 157
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  inherited tbFerramentas: TToolBar
    Width = 449
    TabOrder = 7
    ExplicitWidth = 449
    inherited btConsultar: TToolButton
      OnClick = btConsultarClick
    end
  end
  object edCODNOTA: TEdit [6]
    Left = 97
    Top = 46
    Width = 62
    Height = 21
    TabOrder = 0
    OnExit = edCODNOTAExit
  end
  object edNOMEEMPNOTA: TEdit [7]
    Left = 191
    Top = 100
    Width = 168
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 8
  end
  object edNOMECLINOTA: TEdit [8]
    Left = 191
    Top = 73
    Width = 168
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 9
  end
  object edDATAEMISSAONOTA: TDatePicker [9]
    Left = 97
    Top = 127
    Height = 21
    Date = 44760.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 3
  end
  object edVLRNOTA: TEdit [10]
    Left = 97
    Top = 154
    Width = 168
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object edCODCLINOTA: TEdit [11]
    Left = 97
    Top = 73
    Width = 62
    Height = 21
    TabOrder = 1
  end
  object edCODEMPNOTA: TEdit [12]
    Left = 97
    Top = 100
    Width = 62
    Height = 21
    TabOrder = 2
    OnExit = edCODEMPNOTAExit
  end
  object btCODCLINOTA: TButton [13]
    Left = 165
    Top = 73
    Width = 20
    Height = 16
    ImageIndex = 0
    Images = imBotoesDiversos
    TabOrder = 5
    TabStop = False
    OnClick = btCODCLINOTAClick
  end
  object btCODEMPNOTA: TButton [14]
    Left = 165
    Top = 100
    Width = 20
    Height = 16
    ImageIndex = 0
    Images = imBotoesDiversos
    TabOrder = 6
    TabStop = False
    OnClick = btCODEMPNOTAClick
  end
  inherited imBotoes: TImageList
    Left = 392
  end
  inherited imBotoesSelecionados: TImageList
    Left = 392
  end
  inherited imBotoesDesabilitados: TImageList
    Left = 392
  end
  object imBotoesDiversos: TImageList
    Left = 392
    Top = 192
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000328DFF5C318EFFE23A9EFF9D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000308EFF5F318EFFFD318EFFFF41A8FEED0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000318F
      FF5D318EFFFD318EFFFF40A7FEFE3D9FFF700000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004A678E4F318E
      FFFC318EFFFF41A7FEFE3CA0FF73000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005D48
      344A5E4A339564513CD164503BCA5D4A348E5F49343B0000000067544088505D
      70BF41A7FFFD3DA0FF7100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A4B2D11614B36AB806D
      5BFFBAAA98FFD2C2AFFFCFBFACFFB6A694FF776452FE634E3BAA7D6C5BFD6653
      40874B719A580000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000604B37B4A08F7DFFECDC
      C8FFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFE7D7C3FF938270FF624F3AAB0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F483459847360FFEDDDCAFFF2E2
      CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFE7D7C3FF776452FE5F49
      343B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000614C37B1C8B8A6FFF8F0E6FFF2E2
      CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFB6A694FF5D4A
      348E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066523EE9E2D4C4FFFBF7F1FFF2E2
      CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFCFBFACFF6450
      3BCA000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066533FEFE7DBCBFFFAF5EDFFF2E2
      CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFD2C2AFFF6451
      3CD1000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000614D38BACCBDAAFFFDFAF7FFF2E3
      D0FFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFBAAA98FF5E4A
      3395000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F4933698E7D6AFFF6EDE1FFF5E8
      D9FFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFF2E2CEFFECDCC8FF806D5BFF5D48
      344A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080800002614D38C7AD9D8BFFF3E5
      D5FFFDFAF7FFFAF3EBFFF2E3CFFFF2E2CEFFEDDDCAFFA08F7DFF614B36AB0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006245311A614D38C78E7D
      6AFFCBBBA8FFE7DBCBFFDECFBCFFC6B6A3FF847360FF604B37B45A4B2D110000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000025F49
      3369614D38BA66533FEF66523EE9614C37B15F48345900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFF8000000000000FFF0000000000000
      FFE0000000000000FFC1000000000000E0430000000000008007000000000000
      801F000000000000000F000000000000000F000000000000000F000000000000
      000F000000000000000F000000000000000F000000000000001F000000000000
      801F000000000000C07F00000000000000000000000000000000000000000000
      000000000000}
  end
  object SQLQueryMaiorCodigo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 312
    Top = 24
  end
end