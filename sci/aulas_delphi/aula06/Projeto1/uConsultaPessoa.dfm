inherited frTelaConsultaPessoa: TfrTelaConsultaPessoa
  Caption = 'Consulta de Pessoa'
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 668
    Height = 305
    DataSource = dmCadastro.dsCadastro
    TabOrder = 0
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
        Title.Caption = 'C'#211'DIGO'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdCPFCNPJ'
        Title.Caption = 'CPF/CNPJ'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdNOME'
        Title.Caption = 'NOME'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bdENDERECO'
        Title.Caption = 'ENDERE'#199'O'
        Width = 240
        Visible = True
      end>
  end
end
