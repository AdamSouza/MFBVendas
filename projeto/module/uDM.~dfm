object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 478
  Top = 101
  Height = 560
  Width = 811
  object Conexao: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=localhost:C:\MFBVendas\banco\MFBVendas.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 72
    Top = 48
  end
  object sdsClientes: TSQLDataSet
    CommandText = 'select * from CLIENTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 72
    Top = 112
  end
  object dspClientes: TDataSetProvider
    DataSet = sdsClientes
    Left = 72
    Top = 160
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 72
    Top = 208
    object cdsClientesID_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_CLIENTE'
    end
    object cdsClientesNOME_CLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 75
    end
    object cdsClientesENDERECO_CLIENTE: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO_CLIENTE'
      Size = 75
    end
    object cdsClientesBAIRRO_CLIENTE: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO_CLIENTE'
    end
    object cdsClientesUF_CLIENTE: TStringField
      DisplayLabel = 'UF'
      FieldName = 'UF_CLIENTE'
    end
    object cdsClientesCIDADE_CLIENTE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE_CLIENTE'
    end
    object cdsClientesCEP_CLIENTE: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'CEP_CLIENTE'
      EditMask = '00000\-999;1;_'
      Size = 9
    end
    object cdsClientesEMAIL_CLIENTE: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL_CLIENTE'
      Size = 75
    end
    object cdsClientesTELEFONE_CLIENTE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE_CLIENTE'
      EditMask = '!\(99\)0000-0000;1;_'
    end
    object cdsClientesCELULAR_CLIENTE: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR_CLIENTE'
      EditMask = '!\(99\)0000-0000;1;_'
    end
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProdutos'
    Left = 144
    Top = 208
    object cdsProdutosID_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_PRODUTO'
    end
    object cdsProdutosDESCRICAO_PRODUTO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 75
    end
    object cdsProdutosESTOQUE_PRODUTO: TFMTBCDField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE_PRODUTO'
      Precision = 15
      Size = 3
    end
    object cdsProdutosVALOR_PRECO_PRODUTO: TFMTBCDField
      DisplayLabel = 'Valor Produto'
      FieldName = 'VALOR_PRECO_PRODUTO'
      currency = True
      Precision = 15
      Size = 2
    end
    object cdsProdutosDESC_CATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldKind = fkLookup
      FieldName = 'DESC_CATEGORIA'
      LookupDataSet = cdsCategoria
      LookupKeyFields = 'ID_CATEGORIA'
      LookupResultField = 'NOME_CATEGORIA'
      KeyFields = 'ID_CATEGORIA'
      Lookup = True
    end
    object cdsProdutosDESC_FABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      FieldKind = fkLookup
      FieldName = 'DESC_FABRICANTE'
      LookupDataSet = cdsFabricante
      LookupKeyFields = 'ID_FABRICANTE'
      LookupResultField = 'NOME_FABRICANTE'
      KeyFields = 'ID_FABRICANTE'
      Lookup = True
    end
    object cdsProdutosID_FABRICANTE: TIntegerField
      FieldName = 'ID_FABRICANTE'
    end
    object cdsProdutosID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
    end
  end
  object dspProdutos: TDataSetProvider
    DataSet = sdsProdutos
    Left = 144
    Top = 160
  end
  object sdsProdutos: TSQLDataSet
    CommandText = 'select * from PRODUTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 144
    Top = 112
  end
  object sdsUsuarios: TSQLDataSet
    CommandText = 'select * from USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 216
    Top = 112
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sdsUsuarios
    Left = 216
    Top = 160
  end
  object cdsUsuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 216
    Top = 208
    object cdsUsuariosID_USUARIO: TIntegerField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'ID_USUARIO'
    end
    object cdsUsuariosNOME_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOME_USUARIO'
      Size = 75
    end
    object cdsUsuariosEMAIL_USUARIO: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL_USUARIO'
      Size = 75
    end
    object cdsUsuariosLOGIN_USUARIO: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN_USUARIO'
      Size = 10
    end
    object cdsUsuariosSENHA_USUARIO: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA_USUARIO'
      EditMask = '!9999999999;1;*'
      Size = 10
    end
    object cdsUsuariosATIVO_VENDEDOR: TStringField
      FieldName = 'ATIVO_VENDEDOR'
      Size = 1
    end
  end
  object sdsPerfil: TSQLDataSet
    CommandText = 'select * from PERFIL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 150
    Top = 296
  end
  object dspPerfil: TDataSetProvider
    DataSet = sdsPerfil
    Options = [poCascadeDeletes, poCascadeUpdates]
    Left = 222
    Top = 296
  end
  object cdsPerfil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPerfil'
    Left = 284
    Top = 296
    object cdsPerfilID_PERFIL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 12
      FieldName = 'ID_PERFIL'
    end
    object cdsPerfilNOME_PERFIL: TStringField
      DisplayLabel = 'Perfil'
      DisplayWidth = 24
      FieldName = 'NOME_PERFIL'
    end
    object cdsPerfilDESCRICAO_PERFIL: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 76
      FieldName = 'DESCRICAO_PERFIL'
      Size = 75
    end
    object cdsPerfilsdsPerfilConfig: TDataSetField
      DisplayWidth = 14
      FieldName = 'sdsPerfilConfig'
    end
  end
  object sdsVendas: TSQLDataSet
    CommandText = 'select * from VENDAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 148
    Top = 400
  end
  object dspVendas: TDataSetProvider
    DataSet = sdsVendas
    Options = [poCascadeDeletes, poCascadeUpdates]
    Left = 220
    Top = 400
  end
  object cdsVendas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendas'
    Left = 284
    Top = 400
    object cdsVendasID_VENDA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_VENDA'
    end
    object cdsVendasID_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object cdsVendasID_USUARIO: TIntegerField
      DisplayLabel = 'C'#243'd. Usu'#225'rio'
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object cdsVendasDATA_CADASTRO_VENDA: TDateField
      DisplayLabel = 'Data da Venda'
      FieldName = 'DATA_CADASTRO_VENDA'
    end
    object cdsVendassdsVendaItem: TDataSetField
      FieldName = 'sdsVendaItem'
    end
  end
  object sdsVendaItem: TSQLDataSet
    CommandText = 'select * from VENDA_ITEM where ID_VENDA =:ID_VENDA'
    DataSource = srcVenda_ItemVenda
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_VENDA'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = Conexao
    Left = 148
    Top = 464
  end
  object cdsVendaItem: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsVendassdsVendaItem
    Params = <>
    Left = 284
    Top = 464
    object cdsVendaItemID_VENDA: TIntegerField
      DisplayLabel = 'C'#243'd. Venda'
      FieldName = 'ID_VENDA'
    end
    object cdsVendaItemID_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'ID_PRODUTO'
    end
    object cdsVendaItemQTD_ITEM: TFMTBCDField
      DisplayLabel = 'Quantidade Item'
      FieldName = 'QTD_ITEM'
      Precision = 15
      Size = 3
    end
    object cdsVendaItemVALOR_PRECO_ITEM: TFMTBCDField
      DisplayLabel = 'Valor Item'
      FieldName = 'VALOR_PRECO_ITEM'
      currency = True
      Precision = 15
      Size = 2
    end
  end
  object sdsPerfilConfig: TSQLDataSet
    CommandText = 'select * from PERFIL_CONFIG where ID_PERFIL =:ID_PERFIL'
    DataSource = srcPerfil_PerfilConfig
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PERFIL'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = Conexao
    Left = 148
    Top = 344
  end
  object cdsPerfilConfig: TClientDataSet
    Aggregates = <>
    DataSetField = cdsPerfilsdsPerfilConfig
    Params = <>
    Left = 284
    Top = 344
    object cdsPerfilConfigID_PERFIL: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_PERFIL'
    end
    object cdsPerfilConfigACTION_PERFIL: TStringField
      DisplayLabel = 'A'#231#227'o'
      DisplayWidth = 75
      FieldName = 'ACTION_PERFIL'
      Size = 75
    end
    object cdsPerfilConfigCAPTION_PERFIL: TStringField
      DisplayLabel = 'Caption'
      FieldName = 'CAPTION_PERFIL'
      Size = 75
    end
    object cdsPerfilConfigPERMISSAO_PERFIL: TStringField
      DisplayLabel = 'Permiss'#227'o'
      FieldName = 'PERMISSAO_PERFIL'
      FixedChar = True
      Size = 1
    end
  end
  object srcPerfil_PerfilConfig: TDataSource
    DataSet = sdsPerfil
    Left = 45
    Top = 344
  end
  object srcVenda_ItemVenda: TDataSource
    DataSet = sdsVendas
    Left = 37
    Top = 464
  end
  object sdsFabrincate: TSQLDataSet
    CommandText = 'select * from FABRICANTE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 296
    Top = 112
  end
  object dspFabricante: TDataSetProvider
    DataSet = sdsFabrincate
    Left = 296
    Top = 160
  end
  object cdsFabricante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFabricante'
    Left = 296
    Top = 208
    object cdsFabricanteID_FABRICANTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_FABRICANTE'
    end
    object cdsFabricanteNOME_FABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'NOME_FABRICANTE'
      Size = 75
    end
  end
  object sdsCategoria: TSQLDataSet
    CommandText = 'select * from CATEGORIA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 376
    Top = 112
  end
  object dspCategoria: TDataSetProvider
    DataSet = sdsCategoria
    Left = 376
    Top = 160
  end
  object cdsCategoria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCategoria'
    Left = 376
    Top = 208
    object cdsCategoriaID_CATEGORIA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_CATEGORIA'
    end
    object cdsCategoriaNOME_CATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      FieldName = 'NOME_CATEGORIA'
    end
  end
  object sdsConsulta: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 496
    Top = 64
  end
  object dspConsulta: TDataSetProvider
    DataSet = sdsConsulta
    Options = [poAllowCommandText]
    Left = 496
    Top = 112
  end
  object ConexaoLocal: TLocalConnection
    Left = 144
    Top = 48
  end
end
