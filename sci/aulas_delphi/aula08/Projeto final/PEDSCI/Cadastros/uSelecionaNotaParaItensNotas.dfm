inherited frSelecionaNotaItensNotas: TfrSelecionaNotaItensNotas
  Caption = 'Selecionar nota'
  PixelsPerInch = 96
  TextHeight = 13
  inherited grConsulta: TDBGrid
    OnDblClick = grConsultaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'BDCODNOTA'
        Title.Caption = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODCLI'
        Title.Caption = 'CODCLI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCODEMP'
        Title.Caption = 'CODEMP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDDATAEMISSAO'
        Title.Caption = 'DATAEMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDVLRNOTA'
        Title.Caption = 'VALORNOTA'
        Visible = True
      end>
  end
end
