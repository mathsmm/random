inherited frConsEmpresasEXEMPLO: TfrConsEmpresasEXEMPLO
  Caption = 'Consulta de empresas - EXEMPLO'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grConsulta: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODEMP'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCNPJEMP'
        Title.Caption = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEMP'
        Title.Caption = 'Nome'
        Visible = True
      end>
  end
end
