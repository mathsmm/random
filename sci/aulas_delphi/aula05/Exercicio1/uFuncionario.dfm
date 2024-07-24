inherited frFuncionario: TfrFuncionario
  Caption = 'Cadastro de funcion'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  object lbDataAdmissaoFuncionario: TLabel [3]
    Left = 27
    Top = 108
    Width = 118
    Height = 18
    Caption = 'Data de admiss'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited btSalvar: TButton
    TabOrder = 5
  end
  object edDataAdmissaoFuncionario: TDatePicker
    Left = 151
    Top = 104
    Width = 130
    Height = 26
    Date = 44748.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
end
