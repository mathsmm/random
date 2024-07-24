inherited frSelecionaCliente: TfrSelecionaCliente
  Caption = 'Selecionar cliente para lan'#231'amento de nota'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grConsulta: TDBGrid
    OnDblClick = grConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODIGO'
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
        FieldName = 'BDNOMECLI'
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
