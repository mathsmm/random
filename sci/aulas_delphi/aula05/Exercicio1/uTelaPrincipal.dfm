object frTelaPrincipal: TfrTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela principal'
  ClientHeight = 338
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbCadastro: TLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 23
    Caption = 'Cadastros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btAbrirCadastro: TButton
    Left = 8
    Top = 77
    Width = 218
    Height = 34
    Caption = 'Abrir Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btAbrirCadastroClick
  end
  object cbCadastros: TComboBox
    Left = 8
    Top = 45
    Width = 218
    Height = 26
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Selecione a tela de cadastro'
    Items.Strings = (
      'Pessoa'
      'Funcion'#225'rio'
      'Supervisor')
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 117
    Width = 404
    Height = 213
    TabStop = False
    DataSource = dsCadastro
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'bdCODIGO'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdTIPO'
        Title.Caption = 'TIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdNOME'
        Title.Caption = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdCPF'
        Title.Caption = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdDATANASC'
        Title.Caption = 'NASCIMENTO'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdDATAADMISSAO'
        Title.Caption = 'ADMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdSETOR'
        Title.Caption = 'SETOR'
        Visible = True
      end>
  end
  object dsCadastro: TDataSource
    Left = 376
    Top = 72
  end
end
