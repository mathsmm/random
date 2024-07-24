object frPessoa: TfrPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de pessoa'
  ClientHeight = 221
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomePessoa: TLabel
    Left = 106
    Top = 11
    Width = 39
    Height = 18
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbCPFPessoa: TLabel
    Left = 120
    Top = 43
    Width = 25
    Height = 18
    Caption = 'CPF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbDataNascPessoa: TLabel
    Left = 14
    Top = 76
    Width = 131
    Height = 18
    Caption = 'Data de nascimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbID: TLabel
    Left = 8
    Top = 11
    Width = 16
    Height = 18
    Caption = 'ID'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edNomePessoa: TEdit
    Left = 151
    Top = 8
    Width = 259
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'Insira o nome'
  end
  object edCPFPessoa: TEdit
    Left = 151
    Top = 40
    Width = 259
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = 'Insira o CPF'
  end
  object edDataNascPessoa: TDatePicker
    Left = 151
    Top = 72
    Width = 130
    Height = 26
    Date = 44748.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 3
  end
  object btSalvar: TButton
    Left = 151
    Top = 182
    Width = 130
    Height = 31
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btSalvarClick
  end
  object edCodigo: TEdit
    Left = 30
    Top = 8
    Width = 43
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = '###'
  end
end
