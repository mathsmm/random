object frExemplo: TfrExemplo
  Left = 0
  Top = 0
  Caption = 'Exemplo'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbNumero: TLabel
    Left = 25
    Top = 48
    Width = 67
    Height = 23
    Caption = 'N'#250'mero'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbQuantidade: TLabel
    Left = 43
    Top = 11
    Width = 49
    Height = 23
    Caption = 'Limite'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edNumero: TEdit
    Left = 98
    Top = 45
    Width = 192
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = edNumeroChange
  end
  object btMensagem: TButton
    Left = 161
    Top = 95
    Width = 129
    Height = 34
    Caption = 'Mensagem'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btMensagemClick
  end
  object btAdicionar: TButton
    Left = 26
    Top = 95
    Width = 129
    Height = 34
    Caption = 'Adicionar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btAdicionarClick
  end
  object lbxNumeros: TListBox
    Left = 296
    Top = 8
    Width = 223
    Height = 226
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 23
    ParentFont = False
    TabOrder = 0
  end
  object cbQuantidade: TComboBox
    Left = 98
    Top = 8
    Width = 192
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = '3 n'#250'meros'
    Items.Strings = (
      '3 n'#250'meros'
      '10 n'#250'meros'
      '15 n'#250'meros')
  end
end
