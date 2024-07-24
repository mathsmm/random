object Form1: TForm1
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
  object lbNome: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 23
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbSexo: TLabel
    Left = 8
    Top = 37
    Width = 40
    Height = 23
    Caption = 'Sexo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edNome: TEdit
    Left = 70
    Top = 8
    Width = 137
    Height = 25
    TabOrder = 0
  end
  object cbSexo: TComboBox
    Left = 70
    Top = 39
    Width = 145
    Height = 21
    TabOrder = 1
    Items.Strings = (
      'Feminino'
      'Masculino')
  end
  object ckEstrangeiro: TCheckBox
    Left = 8
    Top = 66
    Width = 145
    Height = 23
    Caption = 'Estrangeiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btMensagem: TButton
    Left = 8
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Mensagem'
    TabOrder = 3
  end
end
