inherited frCadEmpresasEXEMPLO: TfrCadEmpresasEXEMPLO
  Caption = 'Cadastro de empresas - EXEMPLO'
  ClientHeight = 152
  ClientWidth = 347
  ExplicitWidth = 363
  ExplicitHeight = 191
  PixelsPerInch = 96
  TextHeight = 13
  object lbCODEMP: TLabel [0]
    Left = 12
    Top = 52
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'digo:'
  end
  object lbCNPJEMP: TLabel [1]
    Left = 20
    Top = 84
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'CNPJ:'
  end
  object lbNOMEMP: TLabel [2]
    Left = 18
    Top = 116
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome:'
  end
  inherited tbFerramentas: TToolBar
    Width = 347
    ExplicitWidth = 347
    inherited btConsultar: TToolButton
      OnClick = btConsultarClick
    end
  end
  object edCODEMP: TEdit [4]
    Left = 52
    Top = 48
    Width = 57
    Height = 21
    TabOrder = 1
    OnExit = edCODEMPExit
  end
  object edCNPJEMP: TEdit [5]
    Left = 52
    Top = 81
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edNOMEMP: TEdit [6]
    Left = 52
    Top = 112
    Width = 281
    Height = 21
    TabOrder = 3
  end
end
