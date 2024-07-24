object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbNome: TLabel
    Left = 105
    Top = 8
    Width = 42
    Height = 26
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbSexo: TLabel
    Left = 113
    Top = 40
    Width = 34
    Height = 26
    Caption = 'Sexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDataNascimento: TLabel
    Left = 8
    Top = 72
    Width = 139
    Height = 26
    Caption = 'Data de nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edNome: TEdit
    Left = 153
    Top = 8
    Width = 169
    Height = 26
    Hint = 'Insira o nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cbSexo: TComboBox
    Left = 153
    Top = 40
    Width = 169
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'Selecione o sexo'
    Items.Strings = (
      'Masculino'
      'Feminino')
  end
  object ckEstrangeiro: TCheckBox
    Left = 153
    Top = 119
    Width = 169
    Height = 17
    Caption = 'Estrangeiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btMensagem: TButton
    Left = 8
    Top = 200
    Width = 97
    Height = 34
    Caption = 'Mensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btMensagemClick
  end
  object edDataNascimento: TDateTimePicker
    Left = 153
    Top = 72
    Width = 169
    Height = 26
    Date = 44733.000000000000000000
    Time = 0.631274907405895600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
