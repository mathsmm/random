inherited frSupervisor: TfrSupervisor
  Caption = 'Cadastro de supervisor'
  PixelsPerInch = 96
  TextHeight = 13
  object lbSetorSupervisor: TLabel [4]
    Left = 111
    Top = 139
    Width = 34
    Height = 18
    Caption = 'Setor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited btSalvar: TButton
    TabOrder = 6
  end
  object edSetorSupervisor: TEdit
    Left = 151
    Top = 136
    Width = 259
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TextHint = 'Insira o setor'
  end
end
