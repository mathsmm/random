inherited frSelecionaProdutoItensNotas: TfrSelecionaProdutoItensNotas
  Caption = 'Selecionar produto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grConsulta: TDBGrid
    OnDblClick = grConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODPROD'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDDESCRICAO'
        Title.Caption = 'DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNCM'
        Title.Caption = 'NCM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDVALOR'
        Title.Caption = 'VALOR'
        Visible = True
      end>
  end
end
