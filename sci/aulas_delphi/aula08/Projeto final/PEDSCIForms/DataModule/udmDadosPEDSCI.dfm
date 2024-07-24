object dmDadosPEDSCI: TdmDadosPEDSCI
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 452
  Width = 646
  object SQLQueryFiltros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 440
    Top = 32
  end
  object dsQueryFiltros: TDataSource
    DataSet = SQLQueryFiltros
    Left = 528
    Top = 32
  end
  object dsEmpresas: TSQLDataSet
    CommandText = 'SELECT * FROM TEMPRESA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 24
    Top = 8
  end
  object dspEmpresas: TDataSetProvider
    DataSet = dsEmpresas
    Left = 92
    Top = 8
  end
  object tbEmpresas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresas'
    Left = 160
    Top = 8
  end
  object tbClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 160
    Top = 64
  end
  object tbProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 160
    Top = 120
  end
  object tbLancNotas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLancNotas'
    Left = 160
    Top = 184
  end
  object dsClientes: TSQLDataSet
    CommandText = 'SELECT * FROM TCLIENTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 24
    Top = 64
  end
  object dsProdutos: TSQLDataSet
    CommandText = 'SELECT * FROM TCADPRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 24
    Top = 120
  end
  object dsLancNotas: TSQLDataSet
    CommandText = 'SELECT * FROM TLANCNOTA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 24
    Top = 184
  end
  object dspClientes: TDataSetProvider
    DataSet = dsClientes
    Left = 92
    Top = 64
  end
  object dspProdutos: TDataSetProvider
    DataSet = dsProdutos
    Left = 92
    Top = 120
  end
  object dspLancNotas: TDataSetProvider
    DataSet = dsLancNotas
    Left = 91
    Top = 184
  end
  object dsUF: TSQLDataSet
    CommandText = 'SELECT * FROM TUF'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 24
    Top = 240
  end
  object dspUF: TDataSetProvider
    DataSet = dsUF
    Left = 90
    Top = 240
  end
  object tbUF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUF'
    Left = 160
    Top = 240
  end
  object dsItensNotas: TSQLDataSet
    CommandText = 'SELECT * FROM TITENSNOTA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConnectionPEDSCI.SQLConnectionPEDSCI
    Left = 24
    Top = 304
  end
  object dspItensNotas: TDataSetProvider
    DataSet = dsItensNotas
    Left = 98
    Top = 304
  end
  object tbItensNotas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItensNotas'
    Left = 168
    Top = 304
  end
end
