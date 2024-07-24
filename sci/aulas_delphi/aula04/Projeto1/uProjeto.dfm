object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 431
  ClientWidth = 570
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
  object Label1: TLabel
    Left = 30
    Top = 11
    Width = 57
    Height = 23
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbNome: TLabel
    Left = 38
    Top = 85
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
  object lbEndereco: TLabel
    Left = 8
    Top = 120
    Width = 79
    Height = 23
    Caption = 'Endere'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbCpfCnpj: TLabel
    Left = 321
    Top = 48
    Width = 31
    Height = 23
    Caption = 'CPF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edCodigo: TEdit
    Left = 93
    Top = 8
    Width = 49
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = '###'
    OnExit = edCodigoExit
  end
  object edNome: TEdit
    Left = 93
    Top = 82
    Width = 469
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TextHint = 'Insira o nome'
  end
  object edEndereco: TEdit
    Left = 93
    Top = 117
    Width = 469
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TextHint = 'Insira o endere'#231'o'
  end
  object edCpfCnpj: TEdit
    Left = 369
    Top = 45
    Width = 193
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = 'Insira o CPF'
    OnChange = edCpfCnpjChange
  end
  object cbTipoPessoa: TComboBox
    Left = 93
    Top = 45
    Width = 193
    Height = 31
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = 'Pessoa f'#237'sica'
    OnSelect = cbTipoPessoaSelect
    Items.Strings = (
      'Pessoa f'#237'sica'
      'Pessoa jur'#237'dica')
  end
  object ckIsento: TCheckBox
    Left = 93
    Top = 154
    Width = 97
    Height = 17
    Caption = 'Isento'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object btSalvar: TButton
    Left = 93
    Top = 192
    Width = 133
    Height = 33
    Caption = 'Salvar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btSalvarClick
  end
  object btExcluir: TButton
    Left = 260
    Top = 192
    Width = 133
    Height = 33
    Caption = 'Excluir'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btExcluirClick
  end
  object btExportar: TButton
    Left = 429
    Top = 192
    Width = 133
    Height = 33
    Caption = 'Exportar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btExportarClick
  end
  object DBGrid1: TDBGrid
    Left = -6
    Top = 247
    Width = 576
    Height = 186
    TabStop = False
    DataSource = dsCadastro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'bdCODIGO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdCPFCNPJ'
        Title.Caption = 'CPF/CNPJ'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdNOME'
        Title.Caption = 'Nome'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdENDERECO'
        Title.Caption = 'Endere'#231'o'
        Width = 200
        Visible = True
      end>
  end
  object dsCadastro: TDataSource
    Left = 32
    Top = 176
  end
end
