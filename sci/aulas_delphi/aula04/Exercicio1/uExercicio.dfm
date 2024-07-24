object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 455
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
    Top = 48
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
    Left = 17
    Top = 85
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
  object lbCodigo: TLabel
    Left = 8
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
  object edNome: TEdit
    Left = 71
    Top = 45
    Width = 194
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'Insira o nome'
    OnChange = edNomeChange
  end
  object cbSexo: TComboBox
    Left = 71
    Top = 82
    Width = 194
    Height = 31
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 2
    Text = 'Masculino'
    TextHint = 'Selecione o sexo'
    Items.Strings = (
      'Masculino'
      'Feminino')
  end
  object ckEstrangeiro: TCheckBox
    Left = 71
    Top = 119
    Width = 194
    Height = 31
    Caption = 'Estrangeiro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object btAdicionarPessoa: TButton
    Left = 71
    Top = 156
    Width = 194
    Height = 39
    Caption = 'Adicionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btAdicionarPessoaClick
  end
  object btMensagem: TButton
    Left = 271
    Top = 156
    Width = 194
    Height = 39
    Caption = 'Mensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btMensagemClick
  end
  object edCodigo: TEdit
    Left = 71
    Top = 8
    Width = 50
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = '###'
    OnChange = edCodigoChange
    OnExit = edCodigoExit
  end
  object rbCodigo: TRadioButton
    Left = 471
    Top = 156
    Width = 48
    Height = 13
    Caption = 'C'#243'digo'
    Checked = True
    TabOrder = 6
    TabStop = True
  end
  object rbNome: TRadioButton
    Left = 471
    Top = 175
    Width = 48
    Height = 13
    Caption = 'Nome'
    TabOrder = 7
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 201
    Width = 511
    Height = 246
    TabStop = False
    DataSource = dsCadastro
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
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
        FieldName = 'bdNOME'
        Title.Caption = 'Nome'
        Width = 297
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdSEXO'
        Title.Caption = 'Sexo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdESTRANGEIRO'
        Title.Caption = 'Estrangeiro'
        Visible = True
      end>
  end
  object dsCadastro: TDataSource
    Left = 24
    Top = 120
  end
end
