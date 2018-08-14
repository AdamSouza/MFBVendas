inherited frmCliente: TfrmCliente
  Top = 39
  Height = 620
  Caption = 'Cadastro de Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgControl: TPageControl
    Height = 520
    inherited tabCadastro: TTabSheet
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 32
        Height = 13
        Caption = 'Cliente'
        FocusControl = dbCliente
      end
      object Label4: TLabel
        Left = 8
        Top = 61
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = dbEnderecoCliente
      end
      object Label5: TLabel
        Left = 368
        Top = 61
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = dbBairroCliente
      end
      object Label6: TLabel
        Left = 8
        Top = 104
        Width = 14
        Height = 13
        Caption = 'UF'
        FocusControl = dbUFCliente
      end
      object Label7: TLabel
        Left = 96
        Top = 104
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = dbCidadeCliente
      end
      object Label8: TLabel
        Left = 272
        Top = 104
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = dbCEPCliente
      end
      object Label9: TLabel
        Left = 8
        Top = 144
        Width = 28
        Height = 13
        Caption = 'E-mail'
        FocusControl = dbEmailCliente
      end
      object Label10: TLabel
        Left = 8
        Top = 192
        Width = 42
        Height = 13
        Caption = 'Telefone'
        FocusControl = dbTelefoneCliente
      end
      object Label11: TLabel
        Left = 168
        Top = 192
        Width = 32
        Height = 13
        Caption = 'Celular'
        FocusControl = dbCelularCliente
      end
      object dbCliente: TDBEdit
        Left = 8
        Top = 32
        Width = 281
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 0
      end
      object dbEnderecoCliente: TDBEdit
        Left = 8
        Top = 77
        Width = 350
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 1
      end
      object dbBairroCliente: TDBEdit
        Left = 368
        Top = 77
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 2
      end
      object dbUFCliente: TDBEdit
        Left = 8
        Top = 120
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UF_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 3
      end
      object dbCidadeCliente: TDBEdit
        Left = 96
        Top = 120
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 4
      end
      object dbCEPCliente: TDBEdit
        Left = 272
        Top = 120
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 5
      end
      object dbEmailCliente: TDBEdit
        Left = 8
        Top = 160
        Width = 249
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 6
      end
      object dbTelefoneCliente: TDBEdit
        Left = 8
        Top = 208
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        DataField = 'TELEFONE_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 7
      end
      object dbCelularCliente: TDBEdit
        Left = 168
        Top = 208
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CELULAR_CLIENTE'
        DataSource = srcRegistro
        TabOrder = 8
      end
    end
    inherited tabConsulta: TTabSheet
      inherited DBGridRegistro: TDBGrid
        Height = 437
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_CLIENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE_CLIENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CELULAR_CLIENTE'
            Visible = True
          end>
      end
    end
  end
  inherited srcRegistro: TDataSource
    DataSet = DM.cdsClientes
  end
end
