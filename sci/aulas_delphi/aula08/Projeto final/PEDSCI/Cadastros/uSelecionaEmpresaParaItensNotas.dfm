inherited frSelecionaEmpresaItensNotas: TfrSelecionaEmpresaItensNotas
  Caption = 'Selecionar empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grConsulta: TDBGrid
    OnDblClick = grConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODEMP'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCNPJCPF'
        Title.Caption = 'CPF/CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEEMP'
        Title.Caption = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODUF'
        Title.Caption = 'CODUF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDTELEFONE'
        Title.Caption = 'TELEFONE'
        Visible = True
      end>
  end
end
